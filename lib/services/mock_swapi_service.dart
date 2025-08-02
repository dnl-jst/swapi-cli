import 'dart:io';
import 'dart:math';
import '../models/all_models.dart';

class MockSwapiService {
  Future<List<T>> getAllFromEndpoint<T>(String endpoint) async {
    stdout.write('Lade Mock-Daten');
    await Future.delayed(Duration(milliseconds: 500));
    stdout.write('.');
    await Future.delayed(Duration(milliseconds: 300));
    stdout.write('.');
    await Future.delayed(Duration(milliseconds: 200));
    stdout.write('.');

    switch (endpoint) {
      case 'species':
        return _getMockSpecies() as List<T>;
      case 'films':
        return _getMockFilms() as List<T>;
      case 'people':
        return _getMockPeople() as List<T>;
      case 'planets':
        return _getMockPlanets() as List<T>;
      case 'vehicles':
        return _getMockVehicles() as List<T>;
      case 'starships':
        return _getMockStarships() as List<T>;
      default:
        return [];
    }
  }

  Future<T?> getRandomItem<T>(String endpoint) async {
    final items = await getAllFromEndpoint<T>(endpoint);
    if (items.isEmpty) return null;
    final random = Random();
    return items[random.nextInt(items.length)];
  }

  List<Species> _getMockSpecies() {
    return [
      Species(
        name: "Human",
        classification: "mammal",
        designation: "sentient",
        averageHeight: "180",
        skinColors: "caucasian, black, asian, hispanic",
        hairColors: "blonde, brown, black, red",
        eyeColors: "brown, blue, green, hazel, grey, amber",
        averageLifespan: "120",
        language: "Galactic Basic",
        homeworld: "https://swapi.info/api/planets/9",
        people: ["https://swapi.info/api/people/1"],
        films: ["https://swapi.info/api/films/1"],
        created: DateTime.parse("2014-12-10T13:52:11.567000Z"),
        edited: DateTime.parse("2014-12-20T21:36:42.136000Z"),
        url: "https://swapi.info/api/species/1",
      ),
      Species(
        name: "Wookiee",
        classification: "mammal",
        designation: "sentient",
        averageHeight: "210",
        skinColors: "gray",
        hairColors: "black, brown",
        eyeColors: "blue, green, yellow, brown, golden, red",
        averageLifespan: "400",
        language: "Shyriiwook",
        homeworld: "https://swapi.info/api/planets/14",
        people: ["https://swapi.info/api/people/13"],
        films: ["https://swapi.info/api/films/1"],
        created: DateTime.parse("2014-12-10T16:44:31.486000Z"),
        edited: DateTime.parse("2014-12-20T21:36:42.142000Z"),
        url: "https://swapi.info/api/species/3",
      ),
    ];
  }

  List<Film> _getMockFilms() {
    return [
      Film(
        title: "A New Hope",
        episodeId: 4,
        openingCrawl: "It is a period of civil war...",
        director: "George Lucas",
        producer: "Gary Kurtz, Rick McCallum",
        releaseDate: "1977-05-25",
        characters: ["https://swapi.info/api/people/1"],
        planets: ["https://swapi.info/api/planets/1"],
        starships: ["https://swapi.info/api/starships/2"],
        vehicles: ["https://swapi.info/api/vehicles/4"],
        species: ["https://swapi.info/api/species/1"],
      ),
    ];
  }

  List<Person> _getMockPeople() {
    return [
      Person(
        name: "Luke Skywalker",
        height: "172",
        mass: "77",
        hairColor: "blond",
        skinColor: "fair",
        eyeColor: "blue",
        birthYear: "19BBY",
        gender: "male",
        homeworld: "https://swapi.info/api/planets/1",
        films: ["https://swapi.info/api/films/1"],
        species: [],
        vehicles: ["https://swapi.info/api/vehicles/14"],
        starships: ["https://swapi.info/api/starships/12"],
      ),
    ];
  }

  List<Planet> _getMockPlanets() {
    return [
      Planet(
        name: "Tatooine",
        rotationPeriod: "23",
        orbitalPeriod: "304",
        diameter: "10465",
        climate: "arid",
        gravity: "1 standard",
        terrain: "desert",
        surfaceWater: "1",
        population: "200000",
        residents: ["https://swapi.info/api/people/1"],
        films: ["https://swapi.info/api/films/1"],
      ),
    ];
  }

  List<Vehicle> _getMockVehicles() {
    return [
      Vehicle(
        name: "Sand Crawler",
        model: "Digger Crawler",
        manufacturer: "Corellia Mining Corporation",
        costInCredits: "150000",
        length: "36.8",
        maxAtmospheringSpeed: "30",
        crew: "46",
        passengers: "30",
        cargoCapacity: "50000",
        consumables: "2 months",
        vehicleClass: "wheeled",
        pilots: [],
        films: ["https://swapi.info/api/films/1"],
      ),
    ];
  }

  List<Starship> _getMockStarships() {
    return [
      Starship(
        name: "Millennium Falcon",
        model: "YT-1300 light freighter",
        manufacturer: "Corellian Engineering Corporation",
        costInCredits: "100000",
        length: "34.37",
        maxAtmospheringSpeed: "1050",
        crew: "4",
        passengers: "6",
        cargoCapacity: "100000",
        consumables: "2 months",
        hyperdriveRating: "0.5",
        mglt: "75",
        starshipClass: "Light freighter",
        pilots: ["https://swapi.info/api/people/13"],
        films: ["https://swapi.info/api/films/1"],
      ),
    ];
  }

  List<String> getAvailableEndpoints() {
    return ['films', 'people', 'planets', 'species', 'vehicles', 'starships'];
  }

  String getEndpointDisplayName(String endpoint) {
    switch (endpoint) {
      case 'films':
        return 'Filme';
      case 'people':
        return 'Personen';
      case 'planets':
        return 'Planeten';
      case 'species':
        return 'Spezies';
      case 'vehicles':
        return 'Fahrzeuge';
      case 'starships':
        return 'Raumschiffe';
      default:
        return endpoint;
    }
  }
}
