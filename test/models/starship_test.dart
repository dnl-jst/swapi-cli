import 'package:test/test.dart';
import 'package:swapi_cli/models/starship.dart';

void main() {
  group('Starship Model Tests', () {
    late Map<String, dynamic> testJson;
    late Starship testStarship;

    setUp(() {
      testJson = {
        'name': 'Death Star',
        'model': 'DS-1 Orbital Battle Station',
        'manufacturer': 'Imperial Department of Military Research',
        'cost_in_credits': '1000000000000',
        'length': '120000',
        'max_atmosphering_speed': 'n/a',
        'crew': '342953',
        'passengers': '843342',
        'cargo_capacity': '1000000000000',
        'consumables': '3 years',
        'hyperdrive_rating': 'n/a',
        'MGLT': '10',
        'starship_class': 'Deep Space Mobile Battlestation',
        'pilots': [],
        'films': [
          'https://swapi.info/api/films/1/',
        ],
      };

      testStarship = Starship(
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
        films: [
          'https://swapi.info/api/films/1/',
        ],
      );
    });

    test('should create Starship from JSON correctly', () {
      final starship = Starship.fromJson(testJson);

      expect(starship.name, equals('Death Star'));
      expect(starship.model, equals('DS-1 Orbital Battle Station'));
      expect(starship.manufacturer,
          equals('Imperial Department of Military Research'));
      expect(starship.costInCredits, equals('1000000000000'));
      expect(starship.length, equals('120000'));
      expect(starship.maxAtmospheringSpeed, equals('n/a'));
      expect(starship.crew, equals('342953'));
      expect(starship.passengers, equals('843342'));
      expect(starship.cargoCapacity, equals('1000000000000'));
      expect(starship.consumables, equals('3 years'));
      expect(starship.hyperdriveRating, equals('n/a'));
      expect(starship.mglt, equals('10'));
      expect(starship.starshipClass, equals('Deep Space Mobile Battlestation'));
      expect(starship.pilots.length, equals(0));
      expect(starship.films.length, equals(1));
    });

    test('should handle null values in JSON gracefully', () {
      final incompleteJson = {
        'name': null,
        'model': null,
        'manufacturer': null,
        'cost_in_credits': null,
        'length': null,
        'max_atmosphering_speed': null,
        'crew': null,
        'passengers': null,
        'cargo_capacity': null,
        'consumables': null,
        'hyperdrive_rating': null,
        'MGLT': null,
        'starship_class': null,
        'pilots': null,
        'films': null,
      };

      final starship = Starship.fromJson(incompleteJson);

      expect(starship.name, equals('Unbekannt'));
      expect(starship.model, equals('Unbekannt'));
      expect(starship.manufacturer, equals('Unbekannt'));
      expect(starship.costInCredits, equals('Unbekannt'));
      expect(starship.length, equals('Unbekannt'));
      expect(starship.maxAtmospheringSpeed, equals('Unbekannt'));
      expect(starship.crew, equals('Unbekannt'));
      expect(starship.passengers, equals('Unbekannt'));
      expect(starship.cargoCapacity, equals('Unbekannt'));
      expect(starship.consumables, equals('Unbekannt'));
      expect(starship.hyperdriveRating, equals('Unbekannt'));
      expect(starship.mglt, equals('Unbekannt'));
      expect(starship.starshipClass, equals('Unbekannt'));
      expect(starship.pilots, isEmpty);
      expect(starship.films, isEmpty);
    });

    test('should create Starship with constructor correctly', () {
      expect(testStarship.name, equals('Death Star'));
      expect(testStarship.starshipClass,
          equals('Deep Space Mobile Battlestation'));
      expect(testStarship.manufacturer,
          equals('Imperial Department of Military Research'));
      expect(testStarship.pilots.length, equals(0));
      expect(testStarship.films.length, equals(1));
    });
  });
}
