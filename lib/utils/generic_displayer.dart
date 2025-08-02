import '../models/species.dart';
import '../models/film.dart';
import '../models/person.dart';
import '../models/planet.dart';
import '../models/vehicle.dart';
import '../models/starship.dart';

class GenericDisplayer {
  /// Zeigt ein Element formatiert auf der Konsole an
  void displayItem(dynamic item, String type) {
    switch (item.runtimeType) {
      case const (Film):
        _displayFilm(item as Film);
        break;
      case const (Person):
        _displayPerson(item as Person);
        break;
      case const (Planet):
        _displayPlanet(item as Planet);
        break;
      case const (Species):
        _displaySpecies(item as Species);
        break;
      case const (Vehicle):
        _displayVehicle(item as Vehicle);
        break;
      case const (Starship):
        _displayStarship(item as Starship);
        break;
      default:
        print('❌ Unbekannter Datentyp: ${item.runtimeType}');
    }
  }

  void _displayFilm(Film film) {
    print('\n' + '=' * 60);
    print('🎬 ZUFÄLLIGER STAR WARS FILM 🎬'.padLeft(40));
    print('=' * 60);

    print('\n🎭 ${_bold('Titel:')} ${film.title}');
    print('📺 ${_bold('Episode:')} ${film.episodeId}');
    print('🎬 ${_bold('Regisseur:')} ${film.director}');
    print('🎞️  ${_bold('Produzent:')} ${film.producer}');
    print('📅 ${_bold('Veröffentlicht:')} ${film.releaseDate}');

    if (film.characters.isNotEmpty) {
      print('👥 ${_bold('Anzahl Charaktere:')} ${film.characters.length}');
    }
    if (film.planets.isNotEmpty) {
      print('🌍 ${_bold('Anzahl Planeten:')} ${film.planets.length}');
    }
    if (film.starships.isNotEmpty) {
      print('🚀 ${_bold('Anzahl Raumschiffe:')} ${film.starships.length}');
    }

    print('\n📖 ${_bold('Vorspann:')}');
    print(_wrapText(film.openingCrawl, 55));

    _printFooter();
  }

  void _displayPerson(Person person) {
    print('\n' + '=' * 60);
    print('👤 ZUFÄLLIGE STAR WARS PERSON 👤'.padLeft(40));
    print('=' * 60);

    print('\n🧑 ${_bold('Name:')} ${person.name}');

    if (person.height != 'Unbekannt' && person.height != 'unknown') {
      print('📏 ${_bold('Größe:')} ${person.height} cm');
    }
    if (person.mass != 'Unbekannt' && person.mass != 'unknown') {
      print('⚖️  ${_bold('Gewicht:')} ${person.mass} kg');
    }
    if (person.birthYear != 'Unbekannt' && person.birthYear != 'unknown') {
      print('🎂 ${_bold('Geburtsjahr:')} ${person.birthYear}');
    }
    if (person.gender != 'Unbekannt' && person.gender != 'n/a') {
      String genderEmoji = person.gender == 'male'
          ? '♂️'
          : person.gender == 'female'
              ? '♀️'
              : '⚧️';
      print(
          '$genderEmoji ${_bold('Geschlecht:')} ${_translateGender(person.gender)}');
    }
    if (person.hairColor != 'Unbekannt' && person.hairColor != 'n/a') {
      print('💇 ${_bold('Haarfarbe:')} ${person.hairColor}');
    }
    if (person.skinColor != 'Unbekannt' && person.skinColor != 'n/a') {
      print('🎨 ${_bold('Hautfarbe:')} ${person.skinColor}');
    }
    if (person.eyeColor != 'Unbekannt' && person.eyeColor != 'n/a') {
      print('👁️  ${_bold('Augenfarbe:')} ${person.eyeColor}');
    }

    if (person.films.isNotEmpty) {
      print('🎬 ${_bold('Anzahl Filme:')} ${person.films.length}');
    }

    _printFooter();
  }

  void _displayPlanet(Planet planet) {
    print('\n' + '=' * 60);
    print('🌍 ZUFÄLLIGER STAR WARS PLANET 🌍'.padLeft(40));
    print('=' * 60);

    print('\n🪐 ${_bold('Name:')} ${planet.name}');

    if (planet.diameter != 'Unbekannt' && planet.diameter != 'unknown') {
      print('📏 ${_bold('Durchmesser:')} ${planet.diameter} km');
    }
    if (planet.climate != 'Unbekannt' && planet.climate != 'unknown') {
      print('🌤️  ${_bold('Klima:')} ${planet.climate}');
    }
    if (planet.terrain != 'Unbekannt' && planet.terrain != 'unknown') {
      print('🏔️  ${_bold('Terrain:')} ${planet.terrain}');
    }
    if (planet.gravity != 'Unbekannt' && planet.gravity != 'unknown') {
      print('🌍 ${_bold('Schwerkraft:')} ${planet.gravity}');
    }
    if (planet.population != 'Unbekannt' && planet.population != 'unknown') {
      print('👥 ${_bold('Bevölkerung:')} ${planet.population}');
    }
    if (planet.rotationPeriod != 'Unbekannt' &&
        planet.rotationPeriod != 'unknown') {
      print(
          '🔄 ${_bold('Rotationsperiode:')} ${planet.rotationPeriod} Stunden');
    }
    if (planet.orbitalPeriod != 'Unbekannt' &&
        planet.orbitalPeriod != 'unknown') {
      print('🌀 ${_bold('Umlaufzeit:')} ${planet.orbitalPeriod} Tage');
    }

    if (planet.residents.isNotEmpty) {
      print('🏠 ${_bold('Anzahl Bewohner:')} ${planet.residents.length}');
    }

    _printFooter();
  }

  void _displaySpecies(Species species) {
    print('\n' + '=' * 60);
    print('👽 ZUFÄLLIGE STAR WARS SPEZIES 👽'.padLeft(40));
    print('=' * 60);

    print('\n🧬 ${_bold('Name:')} ${species.name}');

    String classificationEmoji =
        _getClassificationEmoji(species.classification);
    print(
        '$classificationEmoji ${_bold('Klassifikation:')} ${species.classification}');
    print('🏷️  ${_bold('Bezeichnung:')} ${species.designation}');

    if (species.averageHeight != 'Unbekannt' &&
        species.averageHeight != 'n/a') {
      print(
          '📏 ${_bold('Durchschnittliche Größe:')} ${species.averageHeight} cm');
    }
    if (species.skinColors.isNotEmpty && species.skinColors != 'n/a') {
      print('🎨 ${_bold('Hautfarben:')} ${species.skinColors}');
    }
    if (species.hairColors.isNotEmpty && species.hairColors != 'n/a') {
      print('💇 ${_bold('Haarfarben:')} ${species.hairColors}');
    }
    if (species.eyeColors.isNotEmpty && species.eyeColors != 'n/a') {
      print('👁️  ${_bold('Augenfarben:')} ${species.eyeColors}');
    }
    if (species.averageLifespan != 'Unbekannt' &&
        species.averageLifespan != 'n/a') {
      String lifespanText = species.averageLifespan == 'indefinite'
          ? 'Unbegrenzt'
          : '${species.averageLifespan} Jahre';
      print('⏰ ${_bold('Durchschnittliche Lebensdauer:')} $lifespanText');
    }
    if (species.language.isNotEmpty && species.language != 'n/a') {
      print('🗣️  ${_bold('Sprache:')} ${species.language}');
    }
    if (species.people.isNotEmpty) {
      print('👥 ${_bold('Bekannte Charaktere:')} ${species.people.length}');
    }

    _printFooter();
  }

  void _displayVehicle(Vehicle vehicle) {
    print('\n' + '=' * 60);
    print('🚗 ZUFÄLLIGES STAR WARS FAHRZEUG 🚗'.padLeft(40));
    print('=' * 60);

    print('\n🚙 ${_bold('Name:')} ${vehicle.name}');
    print('🏷️  ${_bold('Modell:')} ${vehicle.model}');
    print('🏭 ${_bold('Hersteller:')} ${vehicle.manufacturer}');
    print('📂 ${_bold('Fahrzeugklasse:')} ${vehicle.vehicleClass}');

    if (vehicle.length != 'Unbekannt' && vehicle.length != 'unknown') {
      print('📏 ${_bold('Länge:')} ${vehicle.length} m');
    }
    if (vehicle.maxAtmospheringSpeed != 'Unbekannt' &&
        vehicle.maxAtmospheringSpeed != 'unknown') {
      print(
          '💨 ${_bold('Max. Geschwindigkeit:')} ${vehicle.maxAtmospheringSpeed} km/h');
    }
    if (vehicle.crew != 'Unbekannt' && vehicle.crew != 'unknown') {
      print('👨‍✈️ ${_bold('Besatzung:')} ${vehicle.crew}');
    }
    if (vehicle.passengers != 'Unbekannt' && vehicle.passengers != 'unknown') {
      print('🧳 ${_bold('Passagiere:')} ${vehicle.passengers}');
    }
    if (vehicle.costInCredits != 'Unbekannt' &&
        vehicle.costInCredits != 'unknown') {
      print('💰 ${_bold('Kosten:')} ${vehicle.costInCredits} Credits');
    }

    if (vehicle.pilots.isNotEmpty) {
      print('👨‍✈️ ${_bold('Anzahl Piloten:')} ${vehicle.pilots.length}');
    }

    _printFooter();
  }

  void _displayStarship(Starship starship) {
    print('\n' + '=' * 60);
    print('🚀 ZUFÄLLIGES STAR WARS RAUMSCHIFF 🚀'.padLeft(40));
    print('=' * 60);

    print('\n🛸 ${_bold('Name:')} ${starship.name}');
    print('🏷️  ${_bold('Modell:')} ${starship.model}');
    print('🏭 ${_bold('Hersteller:')} ${starship.manufacturer}');
    print('📂 ${_bold('Raumschiffklasse:')} ${starship.starshipClass}');

    if (starship.length != 'Unbekannt' && starship.length != 'unknown') {
      print('📏 ${_bold('Länge:')} ${starship.length} m');
    }
    if (starship.hyperdriveRating != 'Unbekannt' &&
        starship.hyperdriveRating != 'unknown') {
      print('⚡ ${_bold('Hyperantrieb-Rating:')} ${starship.hyperdriveRating}');
    }
    if (starship.mglt != 'Unbekannt' && starship.mglt != 'unknown') {
      print('🌌 ${_bold('MGLT:')} ${starship.mglt}');
    }
    if (starship.crew != 'Unbekannt' && starship.crew != 'unknown') {
      print('👨‍✈️ ${_bold('Besatzung:')} ${starship.crew}');
    }
    if (starship.passengers != 'Unbekannt' &&
        starship.passengers != 'unknown') {
      print('🧳 ${_bold('Passagiere:')} ${starship.passengers}');
    }
    if (starship.costInCredits != 'Unbekannt' &&
        starship.costInCredits != 'unknown') {
      print('💰 ${_bold('Kosten:')} ${starship.costInCredits} Credits');
    }

    if (starship.pilots.isNotEmpty) {
      print('👨‍✈️ ${_bold('Anzahl Piloten:')} ${starship.pilots.length}');
    }

    _printFooter();
  }

  String _bold(String text) {
    return '\x1B[1m$text\x1B[0m';
  }

  String _getClassificationEmoji(String classification) {
    switch (classification.toLowerCase()) {
      case 'mammal':
        return '🐾';
      case 'reptile':
        return '🦎';
      case 'amphibian':
        return '🐸';
      case 'sentient':
        return '🧠';
      case 'gastropod':
        return '🐌';
      case 'artificial':
        return '🤖';
      case 'insectoid':
        return '🐛';
      default:
        return '🔬';
    }
  }

  String _translateGender(String gender) {
    switch (gender.toLowerCase()) {
      case 'male':
        return 'Männlich';
      case 'female':
        return 'Weiblich';
      case 'hermaphrodite':
        return 'Hermaphrodit';
      case 'none':
        return 'Keines';
      default:
        return gender;
    }
  }

  String _wrapText(String text, int lineLength) {
    if (text.length <= lineLength) return text;

    List<String> words = text.split(' ');
    List<String> lines = [];
    String currentLine = '';

    for (String word in words) {
      if (currentLine.isEmpty) {
        currentLine = word;
      } else if (currentLine.length + word.length + 1 <= lineLength) {
        currentLine += ' $word';
      } else {
        lines.add(currentLine);
        currentLine = word;
      }
    }

    if (currentLine.isNotEmpty) {
      lines.add(currentLine);
    }

    return lines.join('\n');
  }

  void _printFooter() {
    print('\n' + '=' * 60);
    print('May the Force be with you! ⚡'.padLeft(45));
    print('=' * 60 + '\n');
  }
}
