import 'dart:io';
import '../models/all_models.dart';

class MockSwapiService {
  /// Lädt alle Spezies (Mock-Daten für Demo-Zwecke)
  Future<List<Species>> getAllSpecies() async {
    print('🚀 Lade Spezies aus der Star Wars API...');

    // Simuliere das Laden
    await Future.delayed(Duration(milliseconds: 500));
    stdout.write('.');
    await Future.delayed(Duration(milliseconds: 300));
    stdout.write('.');
    await Future.delayed(Duration(milliseconds: 200));
    stdout.write('.');

    final mockSpecies = [
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
        people: ["https://swapi.info/api/people/1", "https://swapi.info/api/people/4"],
      ),
      Species(
        name: "Droid",
        classification: "artificial",
        designation: "sentient",
        averageHeight: "n/a",
        skinColors: "n/a",
        hairColors: "n/a",
        eyeColors: "n/a",
        averageLifespan: "indefinite",
        language: "n/a",
        homeworld: "Unbekannt",
        people: ["https://swapi.info/api/people/2", "https://swapi.info/api/people/3"],
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
      ),
      Species(
        name: "Rodian",
        classification: "sentient",
        designation: "reptilian",
        averageHeight: "170",
        skinColors: "green, blue",
        hairColors: "n/a",
        eyeColors: "black",
        averageLifespan: "unknown",
        language: "Galactic Basic",
        homeworld: "https://swapi.info/api/planets/23",
        people: ["https://swapi.info/api/people/15"],
      ),
      Species(
        name: "Hutt",
        classification: "gastropod",
        designation: "sentient",
        averageHeight: "300",
        skinColors: "green, brown, tan",
        hairColors: "n/a",
        eyeColors: "yellow, red",
        averageLifespan: "1000",
        language: "Huttese",
        homeworld: "https://swapi.info/api/planets/24",
        people: ["https://swapi.info/api/people/16"],
      ),
      Species(
        name: "Yoda's species",
        classification: "mammal",
        designation: "sentient",
        averageHeight: "66",
        skinColors: "green, yellow",
        hairColors: "brown, white",
        eyeColors: "brown, green, yellow",
        averageLifespan: "900",
        language: "Galactic basic",
        homeworld: "Unbekannt",
        people: ["https://swapi.info/api/people/20"],
      ),
      Species(
        name: "Trandoshan",
        classification: "reptile",
        designation: "sentient",
        averageHeight: "200",
        skinColors: "brown, green",
        hairColors: "none",
        eyeColors: "yellow, orange",
        averageLifespan: "unknown",
        language: "Dosh",
        homeworld: "https://swapi.info/api/planets/29",
        people: ["https://swapi.info/api/people/24"],
      ),
      Species(
        name: "Mon Calamari",
        classification: "amphibian",
        designation: "sentient",
        averageHeight: "160",
        skinColors: "red, blue, brown, magenta",
        hairColors: "none",
        eyeColors: "yellow",
        averageLifespan: "unknown",
        language: "Mon Calamarian",
        homeworld: "https://swapi.info/api/planets/31",
        people: ["https://swapi.info/api/people/27"],
      ),
      Species(
        name: "Ewok",
        classification: "mammal",
        designation: "sentient",
        averageHeight: "100",
        skinColors: "brown",
        hairColors: "white, brown, black",
        eyeColors: "orange, brown",
        averageLifespan: "unknown",
        language: "Ewokese",
        homeworld: "https://swapi.info/api/planets/7",
        people: ["https://swapi.info/api/people/30"],
      ),
      Species(
        name: "Sullustan",
        classification: "mammal",
        designation: "sentient",
        averageHeight: "180",
        skinColors: "pale",
        hairColors: "none",
        eyeColors: "black",
        averageLifespan: "unknown",
        language: "Sullutese",
        homeworld: "https://swapi.info/api/planets/33",
        people: ["https://swapi.info/api/people/31"],
      ),
    ];

    print('\n✅ ${mockSpecies.length} Spezies erfolgreich geladen!');
    return mockSpecies;
  }

  /// Wählt eine zufällige Spezies aus
  Species getRandomSpecies(List<Species> species) {
    if (species.isEmpty) {
      throw Exception('Keine Spezies verfügbar');
    }

    final random = DateTime.now().millisecondsSinceEpoch % species.length;
    return species[random];
  }
}
