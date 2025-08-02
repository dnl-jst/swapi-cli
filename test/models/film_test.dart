import 'package:test/test.dart';
import 'package:swapi_cli/models/film.dart';

void main() {
  group('Film Model Tests', () {
    late Map<String, dynamic> testJson;
    late Film testFilm;

    setUp(() {
      testJson = {
        'title': 'A New Hope',
        'episode_id': 4,
        'opening_crawl': 'It is a period of civil war...',
        'director': 'George Lucas',
        'producer': 'Gary Kurtz, Rick McCallum',
        'release_date': '1977-05-25',
        'characters': [
          'https://swapi.info/api/people/1/',
          'https://swapi.info/api/people/2/',
        ],
        'planets': [
          'https://swapi.info/api/planets/1/',
          'https://swapi.info/api/planets/2/',
        ],
        'starships': [
          'https://swapi.info/api/starships/2/',
          'https://swapi.info/api/starships/3/',
        ],
        'vehicles': [
          'https://swapi.info/api/vehicles/4/',
          'https://swapi.info/api/vehicles/6/',
        ],
        'species': [
          'https://swapi.info/api/species/1/',
          'https://swapi.info/api/species/2/',
        ],
        'created': '2014-12-10T14:23:31.880000Z',
        'edited': '2014-12-20T19:49:45.256000Z',
        'url': 'https://swapi.info/api/films/1/',
      };

      testFilm = Film(
        title: 'A New Hope',
        episodeId: 4,
        openingCrawl: 'It is a period of civil war...',
        director: 'George Lucas',
        producer: 'Gary Kurtz, Rick McCallum',
        releaseDate: '1977-05-25',
        characters: [
          'https://swapi.info/api/people/1/',
          'https://swapi.info/api/people/2/',
        ],
        planets: [
          'https://swapi.info/api/planets/1/',
          'https://swapi.info/api/planets/2/',
        ],
        starships: [
          'https://swapi.info/api/starships/2/',
          'https://swapi.info/api/starships/3/',
        ],
        vehicles: [
          'https://swapi.info/api/vehicles/4/',
          'https://swapi.info/api/vehicles/6/',
        ],
        species: [
          'https://swapi.info/api/species/1/',
          'https://swapi.info/api/species/2/',
        ],
      );
    });

    test('should create Film from JSON correctly', () {
      final film = Film.fromJson(testJson);

      expect(film.title, equals('A New Hope'));
      expect(film.episodeId, equals(4));
      expect(film.openingCrawl, equals('It is a period of civil war...'));
      expect(film.director, equals('George Lucas'));
      expect(film.producer, equals('Gary Kurtz, Rick McCallum'));
      expect(film.releaseDate, equals('1977-05-25'));
      expect(film.characters.length, equals(2));
      expect(film.planets.length, equals(2));
      expect(film.starships.length, equals(2));
      expect(film.vehicles.length, equals(2));
      expect(film.species.length, equals(2));
    });

    test('should handle null values in JSON gracefully', () {
      final incompleteJson = {
        'title': null,
        'episode_id': null,
        'opening_crawl': null,
        'director': null,
        'producer': null,
        'release_date': null,
        'characters': null,
        'planets': null,
        'starships': null,
        'vehicles': null,
        'species': null,
        'created': null,
        'edited': null,
        'url': null,
      };

      final film = Film.fromJson(incompleteJson);

      expect(film.title, equals('Unbekannt'));
      expect(film.episodeId, equals(0));
      expect(film.openingCrawl, equals(''));
      expect(film.director, equals('Unbekannt'));
      expect(film.producer, equals('Unbekannt'));
      expect(film.releaseDate, equals('Unbekannt'));
      expect(film.characters, isEmpty);
      expect(film.planets, isEmpty);
      expect(film.starships, isEmpty);
      expect(film.vehicles, isEmpty);
      expect(film.species, isEmpty);
    });

    test('should create Film with constructor correctly', () {
      expect(testFilm.title, equals('A New Hope'));
      expect(testFilm.episodeId, equals(4));
      expect(testFilm.director, equals('George Lucas'));
      expect(testFilm.characters.length, equals(2));
      expect(testFilm.planets.length, equals(2));
    });
  });
}
