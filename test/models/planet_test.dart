import 'package:test/test.dart';
import 'package:swapi_cli/models/planet.dart';

void main() {
  group('Planet Model Tests', () {
    late Map<String, dynamic> testJson;
    late Planet testPlanet;

    setUp(() {
      testJson = {
        'name': 'Tatooine',
        'rotation_period': '23',
        'orbital_period': '304',
        'diameter': '10465',
        'climate': 'arid',
        'gravity': '1 standard',
        'terrain': 'desert',
        'surface_water': '1',
        'population': '200000',
        'residents': [
          'https://swapi.info/api/people/1/',
          'https://swapi.info/api/people/2/',
        ],
        'films': [
          'https://swapi.info/api/films/1/',
          'https://swapi.info/api/films/3/',
        ],
      };

      testPlanet = Planet(
        name: 'Tatooine',
        rotationPeriod: '23',
        orbitalPeriod: '304',
        diameter: '10465',
        climate: 'arid',
        gravity: '1 standard',
        terrain: 'desert',
        surfaceWater: '1',
        population: '200000',
        residents: [
          'https://swapi.info/api/people/1/',
          'https://swapi.info/api/people/2/',
        ],
        films: [
          'https://swapi.info/api/films/1/',
          'https://swapi.info/api/films/3/',
        ],
      );
    });

    test('should create Planet from JSON correctly', () {
      final planet = Planet.fromJson(testJson);

      expect(planet.name, equals('Tatooine'));
      expect(planet.rotationPeriod, equals('23'));
      expect(planet.orbitalPeriod, equals('304'));
      expect(planet.diameter, equals('10465'));
      expect(planet.climate, equals('arid'));
      expect(planet.gravity, equals('1 standard'));
      expect(planet.terrain, equals('desert'));
      expect(planet.surfaceWater, equals('1'));
      expect(planet.population, equals('200000'));
      expect(planet.residents.length, equals(2));
      expect(planet.films.length, equals(2));
    });

    test('should handle null values in JSON gracefully', () {
      final incompleteJson = {
        'name': null,
        'rotation_period': null,
        'orbital_period': null,
        'diameter': null,
        'climate': null,
        'gravity': null,
        'terrain': null,
        'surface_water': null,
        'population': null,
        'residents': null,
        'films': null,
      };

      final planet = Planet.fromJson(incompleteJson);

      expect(planet.name, equals('Unbekannt'));
      expect(planet.rotationPeriod, equals('Unbekannt'));
      expect(planet.orbitalPeriod, equals('Unbekannt'));
      expect(planet.diameter, equals('Unbekannt'));
      expect(planet.climate, equals('Unbekannt'));
      expect(planet.gravity, equals('Unbekannt'));
      expect(planet.terrain, equals('Unbekannt'));
      expect(planet.surfaceWater, equals('Unbekannt'));
      expect(planet.population, equals('Unbekannt'));
      expect(planet.residents, isEmpty);
      expect(planet.films, isEmpty);
    });

    test('should create Planet with constructor correctly', () {
      expect(testPlanet.name, equals('Tatooine'));
      expect(testPlanet.climate, equals('arid'));
      expect(testPlanet.terrain, equals('desert'));
      expect(testPlanet.residents.length, equals(2));
      expect(testPlanet.films.length, equals(2));
    });
  });
}
