import 'package:test/test.dart';
import 'package:swapi_cli/utils/generic_displayer.dart';
import 'package:swapi_cli/models/species.dart';
import 'package:swapi_cli/models/film.dart';
import 'package:swapi_cli/models/person.dart';
import 'package:swapi_cli/models/planet.dart';
import 'package:swapi_cli/models/vehicle.dart';
import 'package:swapi_cli/models/starship.dart';

void main() {
  group('GenericDisplayer Tests', () {
    late GenericDisplayer displayer;

    setUp(() {
      displayer = GenericDisplayer();
    });

    group('Display Item Tests', () {
      test('should handle Species display', () {
        final species = Species(
          name: 'Human',
          classification: 'mammal',
          designation: 'sentient',
          averageHeight: '180',
          skinColors: 'caucasian, black',
          hairColors: 'blonde, brown',
          eyeColors: 'brown, blue',
          averageLifespan: '120',
          homeworld: 'https://swapi.info/api/planets/9/',
          language: 'Galactic Basic',
          people: ['person1', 'person2'],
          films: ['film1', 'film2'],
          created: DateTime.now(),
          edited: DateTime.now(),
          url: 'https://swapi.info/api/species/1/',
        );

        // Test that displayItem doesn't throw an exception
        expect(
            () => displayer.displayItem(species, 'species'), returnsNormally);
      });

      test('should handle Film display', () {
        final film = Film(
          title: 'A New Hope',
          episodeId: 4,
          openingCrawl: 'It is a period of civil war...',
          director: 'George Lucas',
          producer: 'Gary Kurtz',
          releaseDate: '1977-05-25',
          characters: ['char1', 'char2'],
          planets: ['planet1'],
          starships: ['ship1'],
          vehicles: ['vehicle1'],
          species: ['species1'],
        );

        expect(() => displayer.displayItem(film, 'films'), returnsNormally);
      });

      test('should handle Person display', () {
        final person = Person(
          name: 'Luke Skywalker',
          height: '172',
          mass: '77',
          hairColor: 'blond',
          skinColor: 'fair',
          eyeColor: 'blue',
          birthYear: '19BBY',
          gender: 'male',
          homeworld: 'https://swapi.info/api/planets/1/',
          films: ['film1', 'film2'],
          species: [],
          vehicles: ['vehicle1'],
          starships: ['ship1'],
        );

        expect(() => displayer.displayItem(person, 'people'), returnsNormally);
      });

      test('should handle Planet display', () {
        final planet = Planet(
          name: 'Tatooine',
          rotationPeriod: '23',
          orbitalPeriod: '304',
          diameter: '10465',
          climate: 'arid',
          gravity: '1 standard',
          terrain: 'desert',
          surfaceWater: '1',
          population: '200000',
          residents: ['resident1'],
          films: ['film1'],
        );

        expect(() => displayer.displayItem(planet, 'planets'), returnsNormally);
      });

      test('should handle Vehicle display', () {
        final vehicle = Vehicle(
          name: 'Sand Crawler',
          model: 'Digger Crawler',
          manufacturer: 'Corellia Mining Corporation',
          costInCredits: '150000',
          length: '36.8',
          maxAtmospheringSpeed: '30',
          crew: '46',
          passengers: '30',
          cargoCapacity: '50000',
          consumables: '2 months',
          vehicleClass: 'wheeled',
          pilots: [],
          films: ['film1'],
        );

        expect(
            () => displayer.displayItem(vehicle, 'vehicles'), returnsNormally);
      });

      test('should handle Starship display', () {
        final starship = Starship(
          name: 'Death Star',
          model: 'DS-1 Orbital Battle Station',
          manufacturer: 'Imperial Department of Military Research',
          costInCredits: '1000000000000',
          length: '120000',
          maxAtmospheringSpeed: 'n/a',
          crew: '342953',
          passengers: '843342',
          cargoCapacity: '1000000000000',
          consumables: '3 years',
          hyperdriveRating: 'n/a',
          mglt: '10',
          starshipClass: 'Deep Space Mobile Battlestation',
          pilots: [],
          films: ['film1'],
        );

        expect(() => displayer.displayItem(starship, 'starships'),
            returnsNormally);
      });

      test('should handle unknown type gracefully', () {
        final unknownObject = {'name': 'Unknown'};

        expect(() => displayer.displayItem(unknownObject, 'unknown'),
            returnsNormally);
      });
    });

    group('Private Method Validation', () {
      test('should have all required display methods available', () {
        // We can't directly test private methods, but we can ensure
        // that displayItem doesn't throw for all supported types
        final testData = [
          Species(
            name: 'Test Species',
            classification: 'test',
            designation: 'test',
            averageHeight: 'test',
            skinColors: 'test',
            hairColors: 'test',
            eyeColors: 'test',
            averageLifespan: 'test',
            homeworld: 'test',
            language: 'test',
            people: [],
            films: [],
            created: DateTime.now(),
            edited: DateTime.now(),
            url: 'test',
          ),
          Film(
            title: 'Test Film',
            episodeId: 1,
            openingCrawl: 'test',
            director: 'test',
            producer: 'test',
            releaseDate: 'test',
            characters: [],
            planets: [],
            starships: [],
            vehicles: [],
            species: [],
          ),
          Person(
            name: 'Test Person',
            height: 'test',
            mass: 'test',
            hairColor: 'test',
            skinColor: 'test',
            eyeColor: 'test',
            birthYear: 'test',
            gender: 'test',
            homeworld: 'test',
            films: [],
            species: [],
            vehicles: [],
            starships: [],
          ),
        ];

        for (final item in testData) {
          expect(() => displayer.displayItem(item, 'test'), returnsNormally);
        }
      });
    });
  });
}
