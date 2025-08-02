import 'package:test/test.dart';
import 'package:swapi_cli/models/person.dart';

void main() {
  group('Person Model Tests', () {
    late Map<String, dynamic> testJson;
    late Person testPerson;

    setUp(() {
      testJson = {
        'name': 'Luke Skywalker',
        'height': '172',
        'mass': '77',
        'hair_color': 'blond',
        'skin_color': 'fair',
        'eye_color': 'blue',
        'birth_year': '19BBY',
        'gender': 'male',
        'homeworld': 'https://swapi.info/api/planets/1/',
        'films': [
          'https://swapi.info/api/films/1/',
          'https://swapi.info/api/films/2/',
        ],
        'species': [],
        'vehicles': [
          'https://swapi.info/api/vehicles/14/',
          'https://swapi.info/api/vehicles/30/',
        ],
        'starships': [
          'https://swapi.info/api/starships/12/',
          'https://swapi.info/api/starships/22/',
        ],
      };

      testPerson = Person(
        name: 'Luke Skywalker',
        height: '172',
        mass: '77',
        hairColor: 'blond',
        skinColor: 'fair',
        eyeColor: 'blue',
        birthYear: '19BBY',
        gender: 'male',
        homeworld: 'https://swapi.info/api/planets/1/',
        films: [
          'https://swapi.info/api/films/1/',
          'https://swapi.info/api/films/2/',
        ],
        species: [],
        vehicles: [
          'https://swapi.info/api/vehicles/14/',
          'https://swapi.info/api/vehicles/30/',
        ],
        starships: [
          'https://swapi.info/api/starships/12/',
          'https://swapi.info/api/starships/22/',
        ],
      );
    });

    test('should create Person from JSON correctly', () {
      final person = Person.fromJson(testJson);

      expect(person.name, equals('Luke Skywalker'));
      expect(person.height, equals('172'));
      expect(person.mass, equals('77'));
      expect(person.hairColor, equals('blond'));
      expect(person.skinColor, equals('fair'));
      expect(person.eyeColor, equals('blue'));
      expect(person.birthYear, equals('19BBY'));
      expect(person.gender, equals('male'));
      expect(person.homeworld, equals('https://swapi.info/api/planets/1/'));
      expect(person.films.length, equals(2));
      expect(person.species.length, equals(0));
      expect(person.vehicles.length, equals(2));
      expect(person.starships.length, equals(2));
    });

    test('should handle null values in JSON gracefully', () {
      final incompleteJson = {
        'name': null,
        'height': null,
        'mass': null,
        'hair_color': null,
        'skin_color': null,
        'eye_color': null,
        'birth_year': null,
        'gender': null,
        'homeworld': null,
        'films': null,
        'species': null,
        'vehicles': null,
        'starships': null,
      };

      final person = Person.fromJson(incompleteJson);

      expect(person.name, equals('Unbekannt'));
      expect(person.height, equals('Unbekannt'));
      expect(person.mass, equals('Unbekannt'));
      expect(person.hairColor, equals('Unbekannt'));
      expect(person.skinColor, equals('Unbekannt'));
      expect(person.eyeColor, equals('Unbekannt'));
      expect(person.birthYear, equals('Unbekannt'));
      expect(person.gender, equals('Unbekannt'));
      expect(person.homeworld, equals('Unbekannt'));
      expect(person.films, isEmpty);
      expect(person.species, isEmpty);
      expect(person.vehicles, isEmpty);
      expect(person.starships, isEmpty);
    });

    test('should create Person with constructor correctly', () {
      expect(testPerson.name, equals('Luke Skywalker'));
      expect(testPerson.height, equals('172'));
      expect(testPerson.gender, equals('male'));
      expect(testPerson.films.length, equals(2));
      expect(testPerson.starships.length, equals(2));
    });
  });
}
