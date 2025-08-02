import 'package:test/test.dart';

// Model Tests
import 'models/species_test.dart' as species_tests;
import 'models/film_test.dart' as film_tests;
import 'models/person_test.dart' as person_tests;
import 'models/planet_test.dart' as planet_tests;
import 'models/vehicle_test.dart' as vehicle_tests;
import 'models/starship_test.dart' as starship_tests;

// Service Tests
import 'services/generic_swapi_service_test.dart' as service_tests;

// Utils Tests
import 'utils/generic_displayer_test.dart' as displayer_tests;

// Integration Tests
import 'integration_test.dart' as integration_tests;

void main() {
  group('SWAPI CLI Tests', () {
    group('Model Tests', () {
      species_tests.main();
      film_tests.main();
      person_tests.main();
      planet_tests.main();
      vehicle_tests.main();
      starship_tests.main();
    });

    group('Service Tests', () {
      service_tests.main();
    });

    group('Utils Tests', () {
      displayer_tests.main();
    });

    group('Integration Tests', () {
      integration_tests.main();
    });
  });
}
