#!/usr/bin/env dart

import 'dart:io';
import 'package:args/args.dart';
import '../lib/services/generic_swapi_service.dart';
import '../lib/utils/generic_displayer.dart';

void main(List<String> arguments) async {
  final parser = ArgParser()
    ..addFlag(
      'help',
      abbr: 'h',
      help: 'Zeigt diese Hilfe an',
      negatable: false,
    )
    ..addFlag(
      'version',
      abbr: 'v',
      help: 'Zeigt die Version an',
      negatable: false,
    )
    ..addFlag(
      'list',
      abbr: 'l',
      help: 'Zeigt alle verfügbaren Endpunkte an',
      negatable: false,
    );

  try {
    final argResults = parser.parse(arguments);

    if (argResults['help']) {
      _showHelp(parser);
      return;
    }

    if (argResults['version']) {
      print('Star Wars CLI v1.0.0');
      return;
    }

    if (argResults['list']) {
      _showEndpoints();
      return;
    }

    // Ermittle den gewünschten Endpunkt
    String endpoint;
    if (argResults.rest.isNotEmpty) {
      endpoint = argResults.rest.first.toLowerCase();
    } else {
      // Wenn kein Parameter angegeben wurde, wähle zufällig einen Endpunkt
      final availableEndpoints = GenericSwapiService.getAvailableEndpoints();
      final random =
          DateTime.now().millisecondsSinceEpoch % availableEndpoints.length;
      endpoint = availableEndpoints[random];
      print(
          '🎲 Zufälliger Endpunkt gewählt: ${GenericSwapiService.getEndpointDisplayName(endpoint)}\n');
    }

    await _runCli(endpoint);
  } catch (e) {
    print('❌ Fehler beim Verarbeiten der Argumente: $e');
    _showHelp(parser);
    exit(1);
  }
}

Future<void> _runCli(String endpoint) async {
  print('🌌 Star Wars CLI 🌌');
  print(
      'Ein Tool, das zufällige Elemente aus dem Star Wars Universum anzeigt\n');

  try {
    final swapiService = GenericSwapiService();
    final displayer = GenericDisplayer();

    // Alle Daten vom gewünschten Endpunkt laden
    final allItems = await swapiService.getAllFromEndpoint(endpoint);

    if (allItems.isEmpty) {
      print(
          '❌ Keine ${GenericSwapiService.getEndpointDisplayName(endpoint)} gefunden!');
      exit(1);
    }

    // Zufälliges Element auswählen
    final randomItem = swapiService.getRandomItem(allItems);

    // Element anzeigen
    displayer.displayItem(randomItem, endpoint);

    // Fragen, ob noch ein Element angezeigt werden soll
    while (true) {
      stdout.write(
          '🎲 Möchtest du ein weiteres zufälliges Element sehen? (j/n): ');
      final input = stdin.readLineSync()?.toLowerCase().trim();

      if (input == 'j' || input == 'ja' || input == 'y' || input == 'yes') {
        final anotherItem = swapiService.getRandomItem(allItems);
        displayer.displayItem(anotherItem, endpoint);
      } else if (input == 'n' || input == 'nein' || input == 'no') {
        print('\n👋 Auf Wiedersehen! May the Force be with you! ⭐');
        break;
      } else {
        print('❓ Bitte antworte mit "j" für ja oder "n" für nein.');
      }
    }
  } catch (e) {
    print('❌ Ein Fehler ist aufgetreten: $e');
    exit(1);
  }
}

void _showEndpoints() {
  print('📋 Verfügbare Star Wars API Endpunkte:');
  print('');
  final endpoints = GenericSwapiService.getAvailableEndpoints();
  for (String endpoint in endpoints) {
    final displayName = GenericSwapiService.getEndpointDisplayName(endpoint);
    print('  • $endpoint - $displayName');
  }
  print('');
  print('Verwendung: swapi <endpunkt>');
  print('Beispiel: swapi people');
  print('         swapi films');
  print('         swapi planets');
}

void _showHelp(ArgParser parser) {
  print(
      'Star Wars CLI - Entdecke zufällige Elemente aus dem Star Wars Universum!');
  print('');
  print('Verwendung: swapi [Endpunkt] [Optionen]');
  print('');
  print('Verfügbare Endpunkte:');
  final endpoints = GenericSwapiService.getAvailableEndpoints();
  for (String endpoint in endpoints) {
    final displayName = GenericSwapiService.getEndpointDisplayName(endpoint);
    print('  $endpoint\t- $displayName');
  }
  print('');
  print('Optionen:');
  print(parser.usage);
  print('');
  print('Beispiele:');
  print(
      '  swapi               # Wählt zufällig einen Endpunkt und zeigt ein Element an');
  print('  swapi species       # Zeigt eine zufällige Spezies an');
  print('  swapi people        # Zeigt eine zufällige Person an');
  print('  swapi films         # Zeigt einen zufälligen Film an');
  print('  swapi planets       # Zeigt einen zufälligen Planeten an');
  print('  swapi vehicles      # Zeigt ein zufälliges Fahrzeug an');
  print('  swapi starships     # Zeigt ein zufälliges Raumschiff an');
  print('  swapi --list        # Zeigt alle verfügbaren Endpunkte an');
  print('  swapi --help        # Zeigt diese Hilfe an');
  print('  swapi --version     # Zeigt die Versionsnummer an');
}
