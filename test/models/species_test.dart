import 'package:test/test.dart';
import 'package:swapi_cli/models/species.dart';

void main() {
  group('Species Model Tests', () {
    late Map<String, dynamic> testJson;
    late Species testSpecies;

    setUp(() {
      testJson = {
        'name': 'Human',
        'classification': 'mammal',
        'designation': 'sentient',
        'average_height': '180',
        'skin_colors': 'caucasian, black, asian, hispanic',
        'hair_colors': 'blonde, brown, black, red',
        'eye_colors': 'brown, blue, green, hazel, grey, amber',
        'average_lifespan': '120',
        'homeworld': 'https://swapi.info/api/planets/9/',
        'language': 'Galactic Basic',
        'people': [
          'https://swapi.info/api/people/66/',
          'https://swapi.info/api/people/67/',
        ],
        'films': [
          'https://swapi.info/api/films/1/',
          'https://swapi.info/api/films/2/',
        ],
        'created': '2014-12-10T13:52:11.567000Z',
        'edited': '2014-12-20T21:36:42.136000Z',
        'url': 'https://swapi.info/api/species/1/',
      };

      testSpecies = Species(
        name: 'Human',
        classification: 'mammal',
        designation: 'sentient',
        averageHeight: '180',
        skinColors: 'caucasian, black, asian, hispanic',
        hairColors: 'blonde, brown, black, red',
        eyeColors: 'brown, blue, green, hazel, grey, amber',
        averageLifespan: '120',
        homeworld: 'https://swapi.info/api/planets/9/',
        language: 'Galactic Basic',
        people: [
          'https://swapi.info/api/people/66/',
          'https://swapi.info/api/people/67/',
        ],
        films: [
          'https://swapi.info/api/films/1/',
          'https://swapi.info/api/films/2/',
        ],
        created: DateTime.parse('2014-12-10T13:52:11.567000Z'),
        edited: DateTime.parse('2014-12-20T21:36:42.136000Z'),
        url: 'https://swapi.info/api/species/1/',
      );
    });

    test('should create Species from JSON correctly', () {
      final species = Species.fromJson(testJson);

      expect(species.name, equals('Human'));
      expect(species.classification, equals('mammal'));
      expect(species.designation, equals('sentient'));
      expect(species.averageHeight, equals('180'));
      expect(species.skinColors, equals('caucasian, black, asian, hispanic'));
      expect(species.hairColors, equals('blonde, brown, black, red'));
      expect(
          species.eyeColors, equals('brown, blue, green, hazel, grey, amber'));
      expect(species.averageLifespan, equals('120'));
      expect(species.homeworld, equals('https://swapi.info/api/planets/9/'));
      expect(species.language, equals('Galactic Basic'));
      expect(species.people.length, equals(2));
      expect(species.films.length, equals(2));
      expect(species.url, equals('https://swapi.info/api/species/1/'));
    });

    test('should handle null values in JSON gracefully', () {
      final incompleteJson = {
        'name': null,
        'classification': null,
        'designation': null,
        'average_height': null,
        'skin_colors': null,
        'hair_colors': null,
        'eye_colors': null,
        'average_lifespan': null,
        'homeworld': null,
        'language': null,
        'people': null,
        'films': null,
        'created': null,
        'edited': null,
        'url': null,
      };

      final species = Species.fromJson(incompleteJson);

      expect(species.name, equals(''));
      expect(species.classification, equals(''));
      expect(species.designation, equals(''));
      expect(species.averageHeight, equals(''));
      expect(species.skinColors, equals(''));
      expect(species.hairColors, equals(''));
      expect(species.eyeColors, equals(''));
      expect(species.averageLifespan, equals(''));
      expect(species.homeworld, equals(''));
      expect(species.language, equals(''));
      expect(species.people, isEmpty);
      expect(species.films, isEmpty);
      expect(species.url, equals(''));
    });

    test('should convert Species to JSON correctly', () {
      final json = testSpecies.toJson();

      expect(json['name'], equals('Human'));
      expect(json['classification'], equals('mammal'));
      expect(json['designation'], equals('sentient'));
      expect(json['average_height'], equals('180'));
      expect(json['skin_colors'], equals('caucasian, black, asian, hispanic'));
      expect(json['hair_colors'], equals('blonde, brown, black, red'));
      expect(
          json['eye_colors'], equals('brown, blue, green, hazel, grey, amber'));
      expect(json['average_lifespan'], equals('120'));
      expect(json['homeworld'], equals('https://swapi.info/api/planets/9/'));
      expect(json['language'], equals('Galactic Basic'));
      expect(json['people'], isA<List<String>>());
      expect(json['films'], isA<List<String>>());
      expect(json['created'], equals('2014-12-10T13:52:11.567Z'));
      expect(json['edited'], equals('2014-12-20T21:36:42.136Z'));
      expect(json['url'], equals('https://swapi.info/api/species/1/'));
    });

    test('should create Species with constructor correctly', () {
      expect(testSpecies.name, equals('Human'));
      expect(testSpecies.classification, equals('mammal'));
      expect(testSpecies.designation, equals('sentient'));
      expect(testSpecies.averageHeight, equals('180'));
      expect(testSpecies.people.length, equals(2));
      expect(testSpecies.films.length, equals(2));
    });
  });
}
