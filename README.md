# Star Wars CLI 🌟

[![CI/CD Pipeline](https://github.com/dnl-jst/swapi-cli/actions/workflows/ci.yml/badge.svg)](https://github.com/dnl-jst/swapi-cli/actions/workflows/ci.yml)
[![Release](https://github.com/dnl-jst/swapi-cli/actions/workflows/release.yml/badge.svg)](https://github.com/dnl-jst/swapi-cli/actions/workflows/release.yml)
[![Dart Version](https://img.shields.io/badge/Dart-3.0%2B-blue.svg)](https://dart.dev/get-dart)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Code Coverage](https://codecov.io/gh/dnl-jst/swapi-cli/branch/main/graph/badge.svg)](https://codecov.io/gh/dnl-jst/swapi-cli)

Ein universelles CLI-Tool in Dart, das zufällige Elemente aus der Star Wars API (SWAPI) lädt und sie wunderschön formatiert auf der Konsole anzeigt.

## Features ✨

- 🚀 Lädt alle verfügbaren Daten aus der offiziellen Star Wars API
- 🎲 Wählt zufällig ein Element aus dem gewählten Endpunkt aus
- � **Vollständig zufällig:** Ohne Parameter wird auch der Endpunkt zufällig gewählt
- �🎨 Zeigt alle Informationen schön formatiert mit Emojis an
- 🔄 Möglichkeit, weitere zufällige Elemente anzuzeigen
- 💻 Einfache Kommandozeilen-Interface mit mehreren Endpunkten
- 📋 Unterstützt alle SWAPI-Endpunkte: Filme, Personen, Planeten, Spezies, Fahrzeuge, Raumschiffe

## Verfügbare Endpunkte 🎯

| Endpunkt   | Beschreibung | Beispiel |
|------------|--------------|----------|
| `films`    | Star Wars Filme | Episode IV, V, VI, etc. |
| `people`   | Charaktere | Luke Skywalker, Darth Vader, etc. |
| `planets`  | Planeten | Tatooine, Coruscant, etc. |
| `species`  | Spezies | Human, Wookiee, Droid, etc. |
| `vehicles` | Fahrzeuge | Speeder, AT-AT, etc. |
| `starships`| Raumschiffe | Millennium Falcon, Star Destroyer, etc. |

## Installation

### Option 1: Homebrew (macOS - Empfohlen) 🍺

```bash
# Einfachste Installation für macOS Nutzer
brew install dnl-jst/tap/swapi-cli

# Dann direkt verwendbar als:
swapi --help
swapi people
```

### Option 2: Vorgefertigte Executables

1. Lade die passende Executable von den [GitHub Releases](https://github.com/dnl-jst/swapi-cli/releases) herunter:
   - **Linux:** `swapi-cli-linux`
   - **Windows:** `swapi-cli-windows.exe`
   - **macOS:** `swapi-cli-macos`

2. **macOS Nutzer:** Führe diese Befehle aus, um Gatekeeper zu umgehen:
   ```bash
   chmod +x swapi-cli-macos
   xattr -d com.apple.quarantine swapi-cli-macos
   ```

3. Führe die Anwendung aus:
   ```bash
   ./swapi-cli-linux      # Linux
   ./swapi-cli-macos      # macOS
   swapi-cli-windows.exe  # Windows
   ```

### Option 3: Aus Quellcode

1. Stelle sicher, dass Dart SDK installiert ist (>=3.0.0)
2. Klone oder lade dieses Projekt herunter
3. Installiere die Dependencies:

```bash
dart pub get
```

## Verwendung

### Direkt ausführen:
```bash
dart run bin/swapi_cli.dart [endpunkt]
```

### Als globales CLI-Tool installieren:
```bash
dart pub global activate -s path .
swapi [endpunkt]
```

### Verfügbare Optionen:
```bash
swapi --help           # Zeigt die Hilfe an
swapi --version        # Zeigt die Version an
swapi --list           # Zeigt alle verfügbaren Endpunkte an
```

### Beispiele:
```bash
swapi                  # Wählt zufällig einen Endpunkt und zeigt ein Element an
swapi people           # Zeigt eine zufällige Person an
swapi films            # Zeigt einen zufälligen Film an
swapi planets          # Zeigt einen zufälligen Planeten an
swapi vehicles         # Zeigt ein zufälliges Fahrzeug an
swapi starships        # Zeigt ein zufälliges Raumschiff an
```

## Beispielausgaben

### Spezies
```
👽 ZUFÄLLIGE STAR WARS SPEZIES 👽

🧬 Name: Wookiee
🐾 Klassifikation: mammal
🏷️  Bezeichnung: sentient
📏 Durchschnittliche Größe: 210 cm
🎨 Hautfarben: gray
💇 Haarfarben: black, brown
👁️  Augenfarben: blue, green, yellow, brown, golden, red
⏰ Durchschnittliche Lebensdauer: 400 Jahre
🗣️  Sprache: Shyriiwook
👥 Bekannte Charaktere: 2
```

### Person
```
👤 ZUFÄLLIGE STAR WARS PERSON 👤

🧑 Name: Luke Skywalker
📏 Größe: 172 cm
⚖️  Gewicht: 77 kg
🎂 Geburtsjahr: 19BBY
♂️ Geschlecht: Männlich
💇 Haarfarbe: blond
🎨 Hautfarbe: fair
👁️  Augenfarbe: blue
🎬 Anzahl Filme: 5
```

### Film
```
🎬 ZUFÄLLIGER STAR WARS FILM 🎬

🎭 Titel: The Empire Strikes Back
📺 Episode: 5
🎬 Regisseur: Irvin Kershner
🎞️  Produzent: Gary Kurtz, Rick McCallum
📅 Veröffentlicht: 1980-05-17
👥 Anzahl Charaktere: 16
🌍 Anzahl Planeten: 4
🚀 Anzahl Raumschiffe: 15
```

## API

Dieses Tool nutzt die [Star Wars API (SWAPI)](https://swapi.info/) um Informationen über das Star Wars Universum zu erhalten.

## Dependencies

- `http`: Für API-Aufrufe
- `args`: Für Kommandozeilen-Argumente

## Projektstruktur

```
lib/
├── models/
│   └── all_models.dart       # Alle Datenmodelle (Film, Person, Planet, Spezies, etc.)
├── services/
│   ├── generic_swapi_service.dart  # Generischer API-Service für alle Endpunkte
│   └── mock_swapi_service.dart     # Mock-Service für Tests/Fallback
└── utils/
    └── generic_displayer.dart      # Generischer Displayer für alle Datentypen
```

## Lizenz

MIT License
