import 'package:test/test.dart';
import 'package:swapi_cli/services/generic_swapi_service.dart';
import 'package:swapi_cli/utils/generic_displayer.dart';

void main() {
  group('Integration Tests', () {
    late GenericSwapiService service;
    late GenericDisplayer displayer;

    setUp(() {
      service = GenericSwapiService();
      displayer = GenericDisplayer();
    });

    group('Service and Displayer Integration', () {
      test('should handle complete workflow for all endpoints', () async {
        final endpoints = GenericSwapiService.getAvailableEndpoints();

        for (final endpoint in endpoints) {
          // Test service can handle endpoint
          expect(() => service.getAllFromEndpoint(endpoint), returnsNormally);

          // Test displayer can display German endpoint name
          final displayName =
              GenericSwapiService.getEndpointDisplayName(endpoint);
          expect(displayName, isNotEmpty);
          expect(displayName, isNot(equals(endpoint))); // Should be translated
        }
      });

      test('should work with random item selection', () {
        final testData = ['item1', 'item2', 'item3', 'item4', 'item5'];

        // Test random selection multiple times
        final results = <String>{};
        for (int i = 0; i < 20; i++) {
          final randomItem = service.getRandomItem(testData);
          results.add(randomItem);
          expect(testData, contains(randomItem));
        }

        // With 20 attempts, we should get some variety (statistical test)
        // This test might occasionally fail due to randomness, but very unlikely
        expect(results.length, greaterThan(1));
      });

      test('should validate all endpoint names are properly mapped', () {
        final endpoints = GenericSwapiService.getAvailableEndpoints();
        final expectedTranslations = {
          'films': 'Filme',
          'people': 'Personen',
          'planets': 'Planeten',
          'species': 'Spezies',
          'vehicles': 'Fahrzeuge',
          'starships': 'Raumschiffe',
        };

        for (final endpoint in endpoints) {
          final translation =
              GenericSwapiService.getEndpointDisplayName(endpoint);
          expect(translation, equals(expectedTranslations[endpoint]));
        }
      });

      test('should handle error scenarios gracefully', () {
        // Test invalid endpoint
        expect(
            () => service.getAllFromEndpoint('invalid'),
            throwsA(predicate((e) =>
                e is Exception &&
                e.toString().contains('Unbekannter Endpunkt'))));

        // Test empty list
        expect(
            () => service.getRandomItem([]),
            throwsA(predicate((e) =>
                e is Exception &&
                e.toString().contains('Keine Elemente verfügbar'))));
      });
    });

    group('Data Consistency Tests', () {
      test('should maintain consistent endpoint count', () {
        final endpoints = GenericSwapiService.getAvailableEndpoints();
        const expectedEndpointCount = 6;

        expect(endpoints.length, equals(expectedEndpointCount));
        expect(GenericSwapiService.endpointNames.length,
            equals(expectedEndpointCount));
      });

      test('should use HTTPS for security', () {
        expect(GenericSwapiService.baseUrl, startsWith('https://'));
      });

      test('should use swapi.info domain', () {
        expect(GenericSwapiService.baseUrl, contains('swapi.info'));
      });
    });

    group('CLI Compatibility Tests', () {
      test('should provide all required CLI functionality', () {
        // Test all required CLI operations exist
        expect(GenericSwapiService.getAvailableEndpoints, isA<Function>());
        expect(GenericSwapiService.getEndpointDisplayName, isA<Function>());
        expect(service.getAllFromEndpoint, isA<Function>());
        expect(service.getRandomItem, isA<Function>());
        expect(displayer.displayItem, isA<Function>());
      });

      test('should support all Star Wars entity types', () {
        final supportedTypes = [
          'films',
          'people',
          'planets',
          'species',
          'vehicles',
          'starships'
        ];

        final availableEndpoints = GenericSwapiService.getAvailableEndpoints();

        for (final type in supportedTypes) {
          expect(availableEndpoints, contains(type));
        }
      });
    });
  });
}
