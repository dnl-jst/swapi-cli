# Test configuration for SWAPI CLI

# Run all tests
dart test

# Run specific test suites
dart test test/models/
dart test test/services/
dart test test/utils/
dart test test/integration_test.dart

# Run tests with coverage (requires additional setup)
# dart test --coverage=coverage
# genhtml coverage/lcov.info -o coverage/html

# Run tests with verbose output
dart test --reporter expanded

# Run tests in parallel (faster)
dart test -j 4

# Run specific test file
dart test test/models/species_test.dart

# Run tests with debugging
dart test --pause-after-load
