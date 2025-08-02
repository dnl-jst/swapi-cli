import 'package:test/test.dart';
import 'package:swapi_cli/services/generic_swapi_service.dart';

void main() {
  group('GenericSwapiService Tests', () {
    late GenericSwapiService service;

    setUp(() {
      service = GenericSwapiService();
    });

    group('Static Methods Tests', () {
      test('should return all available endpoints', () {
        final endpoints = GenericSwapiService.getAvailableEndpoints();

        expect(endpoints, contains('films'));
        expect(endpoints, contains('people'));
        expect(endpoints, contains('planets'));
        expect(endpoints, contains('species'));
        expect(endpoints, contains('vehicles'));
        expect(endpoints, contains('starships'));
        expect(endpoints.length, equals(6));
      });

      test('should return correct display names for endpoints', () {
        expect(GenericSwapiService.getEndpointDisplayName('films'),
            equals('Filme'));
        expect(GenericSwapiService.getEndpointDisplayName('people'),
            equals('Personen'));
        expect(GenericSwapiService.getEndpointDisplayName('planets'),
            equals('Planeten'));
        expect(GenericSwapiService.getEndpointDisplayName('species'),
            equals('Spezies'));
        expect(GenericSwapiService.getEndpointDisplayName('vehicles'),
            equals('Fahrzeuge'));
        expect(GenericSwapiService.getEndpointDisplayName('starships'),
            equals('Raumschiffe'));
      });

      test('should return original name for unknown endpoint', () {
        expect(GenericSwapiService.getEndpointDisplayName('unknown'),
            equals('unknown'));
      });
    });

    group('Random Item Selection Tests', () {
      test('should return random item from list', () {
        final testList = ['item1', 'item2', 'item3', 'item4', 'item5'];

        final randomItem = service.getRandomItem(testList);

        expect(testList, contains(randomItem));
      });

      test('should throw exception for empty list', () {
        final emptyList = <String>[];

        expect(
            () => service.getRandomItem(emptyList), throwsA(isA<Exception>()));
      });

      test('should return the only item from single-item list', () {
        final singleItemList = ['onlyItem'];

        final result = service.getRandomItem(singleItemList);

        expect(result, equals('onlyItem'));
      });

      test('should work with different data types', () {
        final numberList = [1, 2, 3, 4, 5];

        final randomNumber = service.getRandomItem(numberList);

        expect(numberList, contains(randomNumber));
        expect(randomNumber, isA<int>());
      });
    });

    group('Endpoint Validation Tests', () {
      test('should throw exception for invalid endpoint', () async {
        expect(() => service.getAllFromEndpoint('invalid_endpoint'),
            throwsA(isA<Exception>()));
      });

      test('should accept all valid endpoints', () {
        final validEndpoints = [
          'films',
          'people',
          'planets',
          'species',
          'vehicles',
          'starships'
        ];

        for (final endpoint in validEndpoints) {
          // We're just testing that it doesn't throw an exception for valid endpoints
          // The actual API call test would require mocking
          expect(() => service.getAllFromEndpoint(endpoint), returnsNormally);
        }
      });
    });

    group('Base URL Tests', () {
      test('should use correct base URL', () {
        expect(GenericSwapiService.baseUrl, equals('https://swapi.info/api'));
      });
    });

    group('Endpoint Names Tests', () {
      test('should contain all required endpoints', () {
        final endpointNames = GenericSwapiService.endpointNames;

        expect(
            endpointNames.keys,
            containsAll([
              'films',
              'people',
              'planets',
              'species',
              'vehicles',
              'starships'
            ]));
        expect(endpointNames.length, equals(6));
      });

      test('should have German translations', () {
        final endpointNames = GenericSwapiService.endpointNames;

        expect(endpointNames['films'], equals('Filme'));
        expect(endpointNames['people'], equals('Personen'));
        expect(endpointNames['planets'], equals('Planeten'));
        expect(endpointNames['species'], equals('Spezies'));
        expect(endpointNames['vehicles'], equals('Fahrzeuge'));
        expect(endpointNames['starships'], equals('Raumschiffe'));
      });
    });
  });
}
