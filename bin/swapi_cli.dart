#!/usr/bin/env dart

import 'dart:io';
import 'package:args/args.dart';
import 'package:pubspec_parse/pubspec_parse.dart';
import '../lib/services/generic_swapi_service.dart';
import '../lib/utils/generic_displayer.dart';

String _getVersionFromPubspec() {
  try {
    final pubspecFile = File('pubspec.yaml');
    if (!pubspecFile.existsSync()) {
      return 'Unknown version';
    }

    final pubspecContent = pubspecFile.readAsStringSync();
    final pubspec = Pubspec.parse(pubspecContent);

    return pubspec.version?.toString() ?? 'Unknown version';
  } catch (e) {
    return 'Unknown version';
  }
}

void main(List<String> arguments) async {
  final parser = ArgParser()
    ..addFlag(
      'help',
      abbr: 'h',
      help: 'Show this help message',
      negatable: false,
    )
    ..addFlag(
      'version',
      abbr: 'v',
      help: 'Show version information',
      negatable: false,
    )
    ..addFlag(
      'list',
      abbr: 'l',
      help: 'List all available endpoints',
      negatable: false,
    );

  try {
    final argResults = parser.parse(arguments);

    if (argResults['help']) {
      _showHelp(parser);
      return;
    }

    if (argResults['version']) {
      final version = _getVersionFromPubspec();
      print('Star Wars CLI v$version');
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
      // If no parameter was given, randomly choose an endpoint
      final availableEndpoints = GenericSwapiService.getAvailableEndpoints();
      final random =
          DateTime.now().millisecondsSinceEpoch % availableEndpoints.length;
      endpoint = availableEndpoints[random];
      print(
          '🎲 Random endpoint selected: ${GenericSwapiService.getEndpointDisplayName(endpoint)}\n');
    }

    await _runCli(endpoint);
  } catch (e) {
    print('❌ Error processing arguments: $e');
    _showHelp(parser);
    exit(1);
  }
}

Future<void> _runCli(String endpoint) async {
  print('🌌 Star Wars CLI 🌌');
  print(
      'A tool that displays random elements from the Star Wars universe\n');

  try {
    final swapiService = GenericSwapiService();
    final displayer = GenericDisplayer();

    // Load all data from the desired endpoint
    final allItems = await swapiService.getAllFromEndpoint(endpoint);

    if (allItems.isEmpty) {
      print(
          '❌ No ${GenericSwapiService.getEndpointDisplayName(endpoint)} found!');
      exit(1);
    }

    // Select random element
    final randomItem = swapiService.getRandomItem(allItems);

    // Display element
    displayer.displayItem(randomItem, endpoint);

    // Ask if another element should be displayed
    while (true) {
      stdout.write(
          '🎲 Would you like to see another random element? (y/n): ');
      final input = stdin.readLineSync()?.toLowerCase().trim();

      if (input == 'y' || input == 'yes' || input == 'j' || input == 'ja') {
        final anotherItem = swapiService.getRandomItem(allItems);
        displayer.displayItem(anotherItem, endpoint);
      } else if (input == 'n' || input == 'no' || input == 'nein') {
        print('\n👋 Goodbye! May the Force be with you! ⭐');
        break;
      } else {
        print('❓ Please answer with "y" for yes or "n" for no.');
      }
    }
  } catch (e) {
    print('❌ An error occurred: $e');
    exit(1);
  }
}

void _showEndpoints() {
  print('📋 Available Star Wars API endpoints:');
  print('');
  final endpoints = GenericSwapiService.getAvailableEndpoints();
  for (String endpoint in endpoints) {
    final displayName = GenericSwapiService.getEndpointDisplayName(endpoint);
    print('  • $endpoint - $displayName');
  }
  print('');
  print('Usage: swapi <endpoint>');
  print('Example: swapi people');
  print('         swapi films');
  print('         swapi planets');
}

void _showHelp(ArgParser parser) {
  print(
      'Star Wars CLI - Discover random elements from the Star Wars universe!');
  print('');
  print('Usage: swapi [endpoint] [options]');
  print('');
  print('Available endpoints:');
  final endpoints = GenericSwapiService.getAvailableEndpoints();
  for (String endpoint in endpoints) {
    final displayName = GenericSwapiService.getEndpointDisplayName(endpoint);
    print('  $endpoint\t- $displayName');
  }
  print('');
  print('Options:');
  print(parser.usage);
  print('');
  print('Examples:');
  print(
      '  swapi               # Randomly selects an endpoint and shows an element');
  print('  swapi species       # Shows a random species');
  print('  swapi people        # Shows a random person');
  print('  swapi films         # Shows a random film');
  print('  swapi planets       # Shows a random planet');
  print('  swapi vehicles      # Shows a random vehicle');
  print('  swapi starships     # Shows a random starship');
  print('  swapi --list        # Lists all available endpoints');
  print('  swapi --help        # Shows this help message');
  print('  swapi --version     # Shows the version number');
}
