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
    'films': 'Filme',
    'people': 'Personen',
    'planets': 'Planeten',
    'species': 'Spezies',
    'vehicles': 'Fahrzeuge',
    'starships': 'Raumschiffe',
  };

  /// Lädt alle Daten von einem SWAPI-Endpunkt
  Future<List<dynamic>> getAllFromEndpoint(String endpoint) async {
    if (!endpointNames.containsKey(endpoint)) {
      throw Exception(
          'Unbekannter Endpunkt: $endpoint\nVerfügbare Endpunkte: ${endpointNames.keys.join(', ')}');
    }

    print('🚀 Lade ${endpointNames[endpoint]} aus der Star Wars API...');

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
          throw Exception('Unerwartetes JSON-Format');
        }

        print(
            '✅ ${allItems.length} ${endpointNames[endpoint]} erfolgreich geladen!');
        client.close();
        return allItems;
      } else {
        throw Exception('Fehler beim Laden der Daten: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Netzwerkfehler: $e');
    }
  }

  /// Wählt ein zufälliges Element aus einer Liste
  T getRandomItem<T>(List<T> items) {
    if (items.isEmpty) {
      throw Exception('Keine Elemente verfügbar');
    }

    final random = Random();
    return items[random.nextInt(items.length)];
  }

  /// Gibt alle verfügbaren Endpunkte zurück
  static List<String> getAvailableEndpoints() {
    return endpointNames.keys.toList();
  }

  /// Gibt die deutsche Bezeichnung für einen Endpunkt zurück
  static String getEndpointDisplayName(String endpoint) {
    return endpointNames[endpoint] ?? endpoint;
  }
}
