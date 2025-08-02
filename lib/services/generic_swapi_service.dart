import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import '../models/species.dart';
import '../models/film.dart';
import '../models/person.dart';
import '../models/planet.dart';
import '../models/vehicle.dart';
import '../models/starship.dart';

class GenericSwapiService {
  static const String baseUrl = 'https://swapi.info/api';

  static const Map<String, String> endpointNames = {
    'films': 'Films',
    'people': 'People',
    'planets': 'Planets',
    'species': 'Species',
    'vehicles': 'Vehicles',
    'starships': 'Starships',
  };

  /// Loads all data from a SWAPI endpoint
  Future<List<dynamic>> getAllFromEndpoint(String endpoint) async {
    if (!endpointNames.containsKey(endpoint)) {
      throw Exception(
          'Unknown endpoint: $endpoint\nAvailable endpoints: ${endpointNames.keys.join(', ')}');
    }

    print('🚀 Loading ${endpointNames[endpoint]} from the Star Wars API...');

    try {
      final client = http.Client();
      final response = await client.get(
        Uri.parse('$baseUrl/$endpoint/'),
        headers: {
          'User-Agent': 'Star Wars CLI/1.0.0',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        List<dynamic> allItems = [];
        if (jsonData is List) {
          // Konvertiere JSON zu entsprechenden Objekten
          for (var item in jsonData) {
            switch (endpoint) {
              case 'films':
                allItems.add(Film.fromJson(item));
                break;
              case 'people':
                allItems.add(Person.fromJson(item));
                break;
              case 'planets':
                allItems.add(Planet.fromJson(item));
                break;
              case 'species':
                allItems.add(Species.fromJson(item));
                break;
              case 'vehicles':
                allItems.add(Vehicle.fromJson(item));
                break;
              case 'starships':
                allItems.add(Starship.fromJson(item));
                break;
            }
          }
        } else {
          throw Exception('Unexpected JSON format');
        }

        print(
            '✅ ${allItems.length} ${endpointNames[endpoint]} successfully loaded!');
        client.close();
        return allItems;
      } else {
        throw Exception('Error loading data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  /// Selects a random element from a list
  T getRandomItem<T>(List<T> items) {
    if (items.isEmpty) {
      throw Exception('No elements available');
    }

    final random = Random();
    return items[random.nextInt(items.length)];
  }

  /// Returns all available endpoints
  static List<String> getAvailableEndpoints() {
    return endpointNames.keys.toList();
  }

  /// Returns the display name for an endpoint
  static String getEndpointDisplayName(String endpoint) {
    return endpointNames[endpoint] ?? endpoint;
  }
}
