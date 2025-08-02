import 'package:test/test.dart';
import 'package:swapi_cli/models/vehicle.dart';

void main() {
  group('Vehicle Model Tests', () {
    late Map<String, dynamic> testJson;
    late Vehicle testVehicle;

    setUp(() {
      testJson = {
        'name': 'Sand Crawler',
        'model': 'Digger Crawler',
        'manufacturer': 'Corellia Mining Corporation',
        'cost_in_credits': '150000',
        'length': '36.8',
        'max_atmosphering_speed': '30',
        'crew': '46',
        'passengers': '30',
        'cargo_capacity': '50000',
        'consumables': '2 months',
        'vehicle_class': 'wheeled',
        'pilots': [],
        'films': [
          'https://swapi.info/api/films/1/',
        ],
      };

      testVehicle = Vehicle(
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
        films: [
          'https://swapi.info/api/films/1/',
        ],
      );
    });

    test('should create Vehicle from JSON correctly', () {
      final vehicle = Vehicle.fromJson(testJson);

      expect(vehicle.name, equals('Sand Crawler'));
      expect(vehicle.model, equals('Digger Crawler'));
      expect(vehicle.manufacturer, equals('Corellia Mining Corporation'));
      expect(vehicle.costInCredits, equals('150000'));
      expect(vehicle.length, equals('36.8'));
      expect(vehicle.maxAtmospheringSpeed, equals('30'));
      expect(vehicle.crew, equals('46'));
      expect(vehicle.passengers, equals('30'));
      expect(vehicle.cargoCapacity, equals('50000'));
      expect(vehicle.consumables, equals('2 months'));
      expect(vehicle.vehicleClass, equals('wheeled'));
      expect(vehicle.pilots.length, equals(0));
      expect(vehicle.films.length, equals(1));
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
        'vehicle_class': null,
        'pilots': null,
        'films': null,
      };

      final vehicle = Vehicle.fromJson(incompleteJson);

      expect(vehicle.name, equals('Unbekannt'));
      expect(vehicle.model, equals('Unbekannt'));
      expect(vehicle.manufacturer, equals('Unbekannt'));
      expect(vehicle.costInCredits, equals('Unbekannt'));
      expect(vehicle.length, equals('Unbekannt'));
      expect(vehicle.maxAtmospheringSpeed, equals('Unbekannt'));
      expect(vehicle.crew, equals('Unbekannt'));
      expect(vehicle.passengers, equals('Unbekannt'));
      expect(vehicle.cargoCapacity, equals('Unbekannt'));
      expect(vehicle.consumables, equals('Unbekannt'));
      expect(vehicle.vehicleClass, equals('Unbekannt'));
      expect(vehicle.pilots, isEmpty);
      expect(vehicle.films, isEmpty);
    });

    test('should create Vehicle with constructor correctly', () {
      expect(testVehicle.name, equals('Sand Crawler'));
      expect(testVehicle.vehicleClass, equals('wheeled'));
      expect(testVehicle.manufacturer, equals('Corellia Mining Corporation'));
      expect(testVehicle.pilots.length, equals(0));
      expect(testVehicle.films.length, equals(1));
    });
  });
}
