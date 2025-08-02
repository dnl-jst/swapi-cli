# SWAPI CLI Test Suite

## 📋 Übersicht

Dieses Projekt enthält eine umfassende Test-Suite für das Star Wars CLI Tool mit **48 Tests** die alle Funktionalitäten abdecken.

## 🧪 Test-Struktur

### Model Tests (6 Dateien)
- **`species_test.dart`** - Tests für Species Model (JSON-Parsing, Constructor, toJson)
- **`film_test.dart`** - Tests für Film Model (JSON-Parsing, Constructor)
- **`person_test.dart`** - Tests für Person Model (JSON-Parsing, Constructor)
- **`planet_test.dart`** - Tests für Planet Model (JSON-Parsing, Constructor)
- **`vehicle_test.dart`** - Tests für Vehicle Model (JSON-Parsing, Constructor)
- **`starship_test.dart`** - Tests für Starship Model (JSON-Parsing, Constructor)

### Service Tests (1 Datei)
- **`generic_swapi_service_test.dart`** - Tests für GenericSwapiService
  - Static Methods (Endpunkt-Namen, Display-Namen)
  - Random Item Selection
  - Endpunkt-Validierung
  - Base URL Tests
  - Deutsche Übersetzungen

### Utils Tests (1 Datei)
- **`generic_displayer_test.dart`** - Tests für GenericDisplayer
  - Display-Funktionen für alle Model-Typen
  - Error-Handling für unbekannte Typen
  - Private Method Validation

### Integration Tests (1 Datei)
- **`integration_test.dart`** - End-to-End Integration Tests
  - Service und Displayer Integration
  - Kompletter Workflow für alle Endpunkte
  - Random Item Selection
  - Error Scenarios
  - Daten-Konsistenz
  - CLI-Kompatibilität

### Test Runner (1 Datei)
- **`all_tests.dart`** - Haupt-Test-Runner der alle Tests organisiert

## 🚀 Test-Ausführung

### Alle Tests ausführen
```bash
dart test
```

### Spezifische Test-Kategorien
```bash
# Model Tests
dart test test/models/

# Service Tests
dart test test/services/

# Utils Tests
dart test test/utils/

# Integration Tests
dart test test/integration_test.dart
```

### Test-Optionen
```bash
# Kompakte Ausgabe
dart test --reporter compact

# Erweiterte Ausgabe
dart test --reporter expanded

# Parallel ausführen (schneller)
dart test -j 4

# Spezifische Test-Datei
dart test test/models/species_test.dart
```

## ✅ Test-Abdeckung

### Funktionalitäten getestet:
- ✅ **JSON-Parsing** - Alle 6 Model-Klassen
- ✅ **Constructor-Validierung** - Alle Models
- ✅ **Null-Value-Handling** - Graceful Degradation
- ✅ **Service-Methoden** - API-Service Funktionalitäten
- ✅ **Display-Logic** - Formatierte Ausgabe für alle Typen
- ✅ **Error-Handling** - Ungültige Endpunkte und leere Listen
- ✅ **Random Selection** - Zufällige Element-Auswahl
- ✅ **Endpunkt-Validierung** - Alle 6 Star Wars Endpunkte
- ✅ **Deutsche Übersetzungen** - UI-Texte
- ✅ **Integration** - Zusammenspiel aller Komponenten
- ✅ **CLI-Kompatibilität** - Kommandozeilen-Funktionalitäten

### Model-Tests Details:
- **Species**: JSON ↔ Object Konvertierung, Null-Handling, Constructor
- **Film**: JSON ↔ Object Konvertierung, Null-Handling, Constructor
- **Person**: JSON ↔ Object Konvertierung, Null-Handling, Constructor
- **Planet**: JSON ↔ Object Konvertierung, Null-Handling, Constructor
- **Vehicle**: JSON ↔ Object Konvertierung, Null-Handling, Constructor
- **Starship**: JSON ↔ Object Konvertierung, Null-Handling, Constructor

### Service-Tests Details:
- Endpunkt-Verfügbarkeit (6 Endpunkte)
- Deutsche Display-Namen
- Random Item Selection aus Listen
- Error-Handling für ungültige Endpunkte
- Base URL Validierung (HTTPS, swapi.info)

### Integration-Tests Details:
- Kompletter Workflow für alle Endpunkte
- Service ↔ Displayer Integration
- Statistical Tests für Random Selection
- Error Scenario Handling
- Daten-Konsistenz zwischen Komponenten
- CLI-Funktionalitäts-Validierung

## 📊 Test-Ergebnisse

**Alle 48 Tests bestanden!** ✅

```
00:00 +48: All tests passed!
```

## 🔧 Dependencies

Die Tests verwenden folgende Abhängigkeiten:
- `test: ^1.24.0` - Dart Test Framework
- `mockito: ^5.4.2` - Mocking (falls erweitert wird)
- `build_runner: ^2.4.7` - Code Generation Support

## 📝 Test-Wartung

### Neue Tests hinzufügen:
1. Erstelle neue Test-Datei in entsprechendem Verzeichnis
2. Importiere in `all_tests.dart`
3. Führe `dart test` aus

### Test-Pattern:
- Verwende `group()` für Test-Kategorien
- Verwende `setUp()` für Test-Daten-Initialisierung
- Verwende `test()` für individuelle Test-Cases
- Verwende aussagekräftige Test-Namen

## 🎯 Testqualität

- **Vollständige Abdeckung** aller öffentlichen APIs
- **Edge-Case Testing** (null values, empty lists, invalid inputs)
- **Integration Testing** zwischen Komponenten
- **Error Scenario Testing** für robuste Anwendung
- **Statistical Testing** für Random-Funktionalitäten
- **Konsistenz-Validierung** zwischen verwandten Komponenten

Die Test-Suite stellt sicher, dass das Star Wars CLI Tool zuverlässig und fehlerfrei funktioniert! 🌟
