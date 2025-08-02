# Star Wars CLI 🌟

[![CI/CD Pipeline](https://github.com/dnl-jst/swapi-cli/actions/workflows/ci.yml/badge.svg)](https://github.com/dnl-jst/swapi-cli/actions/workflows/ci.yml)
[![Release](https://github.com/dnl-jst/swapi-cli/actions/workflows/release.yml/badge.svg)](https://github.com/dnl-jst/swapi-cli/actions/workflows/release.yml)
[![Dart Version](https://img.shields.io/badge/Dart-3.0%2B-blue.svg)](https://dart.dev/get-dart)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)

A universal CLI tool written in Dart that loads random elements from the Star Wars API (SWAPI) and displays them beautifully formatted in the console.

## Features ✨

- 🚀 Loads all available data from the official Star Wars API
- 🎲 Randomly selects an element from the chosen endpoint
- 🔀 **Completely random:** Without parameters, the endpoint is also randomly chosen
- 🎨 Displays all information beautifully formatted with emojis
- 🔄 Option to display additional random elements
- 💻 Simple command-line interface with multiple endpoints
- 📋 Supports all SWAPI endpoints: films, people, planets, species, vehicles, starships

## Available Endpoints 🎯

| Endpoint   | Description | Example |
|------------|-------------|---------|
| `films`    | Star Wars films | Episode IV, V, VI, etc. |
| `people`   | Characters | Luke Skywalker, Darth Vader, etc. |
| `planets`  | Planets | Tatooine, Coruscant, etc. |
| `species`  | Species | Human, Wookiee, Droid, etc. |
| `vehicles` | Vehicles | Speeder, AT-AT, etc. |
| `starships`| Starships | Millennium Falcon, Star Destroyer, etc. |

## Installation

### Option 1: Homebrew (macOS - Recommended) 🍺

```bash
# Easiest installation for macOS users
brew install dnl-jst/tap/swapi-cli

# Then directly usable as:
swapi --help
swapi people
```

### Option 2: Pre-built Executables

1. Download the appropriate executable from the [GitHub Releases](https://github.com/dnl-jst/swapi-cli/releases):
   - **Linux:** `swapi-cli-linux`
   - **Windows:** `swapi-cli-windows.exe`
   - **macOS:** `swapi-cli-macos`

2. Make the file executable (Linux/macOS):
   ```bash
   chmod +x swapi-cli-macos  # macOS
   chmod +x swapi-cli-linux  # Linux
   ```

3. Run the application:
   ```bash
   ./swapi-cli-linux      # Linux
   ./swapi-cli-macos      # macOS
   swapi-cli-windows.exe  # Windows
   ```

### Option 3: From Source Code

1. Ensure Dart SDK is installed (>=3.0.0)
2. Clone or download this project
3. Install dependencies:

```bash
dart pub get
```

## Usage

### Run directly:
```bash
dart run bin/swapi_cli.dart [endpoint]
```

### Install as global CLI tool:
```bash
dart pub global activate -s path .
swapi [endpoint]
```

### Available options:
```bash
swapi --help           # Shows help message
swapi --version        # Shows version information
swapi --list           # Shows all available endpoints
```

### Examples:
```bash
swapi                  # Randomly selects an endpoint and shows an element
swapi people           # Shows a random person
swapi films            # Shows a random film
swapi planets          # Shows a random planet
swapi vehicles         # Shows a random vehicle
swapi starships        # Shows a random starship
```

## Example Output

### Species
```
👽 RANDOM STAR WARS SPECIES 👽

🧬 Name: Wookiee
🐾 Classification: mammal
🏷️  Designation: sentient
📏 Average Height: 210 cm
🎨 Skin Colors: gray
💇 Hair Colors: black, brown
👁️  Eye Colors: blue, green, yellow, brown, golden, red
⏰ Average Lifespan: 400 years
🗣️  Language: Shyriiwook
👥 Known Characters: 2
```

### Person
```
👤 RANDOM STAR WARS PERSON 👤

🧑 Name: Luke Skywalker
📏 Height: 172 cm
⚖️  Mass: 77 kg
🎂 Birth Year: 19BBY
♂️ Gender: Male
💇 Hair Color: blond
🎨 Skin Color: fair
👁️  Eye Color: blue
🎬 Number of Films: 5
```

### Film
```
🎬 RANDOM STAR WARS FILM 🎬

🎭 Title: The Empire Strikes Back
📺 Episode: 5
🎬 Director: Irvin Kershner
🎞️  Producer: Gary Kurtz, Rick McCallum
📅 Release Date: 1980-05-17
👥 Number of Characters: 16
🌍 Number of Planets: 4
🚀 Number of Starships: 15
```

## API

This tool uses the [Star Wars API (SWAPI)](https://swapi.info/) to get information about the Star Wars universe.

## Dependencies

- `http`: For API calls
- `args`: For command-line arguments
- `pubspec_parse`: For reading version information from pubspec.yaml

## Project Structure

```
lib/
├── models/
│   └── all_models.dart       # All data models (Film, Person, Planet, Species, etc.)
├── services/
│   ├── generic_swapi_service.dart  # Generic API service for all endpoints
│   └── mock_swapi_service.dart     # Mock service for tests/fallback
└── utils/
    └── generic_displayer.dart      # Generic displayer for all data types
```

## License

MIT License
