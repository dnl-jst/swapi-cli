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
        print('❌ Unknown data type: ${item.runtimeType}');
    }
  }

  void _displayFilm(Film film) {
    print('\n' + '=' * 60);
    print('🎬 RANDOM STAR WARS FILM 🎬'.padLeft(40));
    print('=' * 60);

    print('\n🎭 ${_bold('Title:')} ${film.title}');
    print('📺 ${_bold('Episode:')} ${film.episodeId}');
    print('🎬 ${_bold('Director:')} ${film.director}');
    print('🎞️  ${_bold('Producer:')} ${film.producer}');
    print('📅 ${_bold('Released:')} ${film.releaseDate}');

    if (film.characters.isNotEmpty) {
      print('👥 ${_bold('Number of Characters:')} ${film.characters.length}');
    }
    if (film.planets.isNotEmpty) {
      print('🌍 ${_bold('Number of Planets:')} ${film.planets.length}');
    }
    if (film.starships.isNotEmpty) {
      print('🚀 ${_bold('Number of Starships:')} ${film.starships.length}');
    }

    print('\n📖 ${_bold('Opening Crawl:')}');
    print(_wrapText(film.openingCrawl, 55));

    _printFooter();
  }

  void _displayPerson(Person person) {
    print('\n' + '=' * 60);
    print('👤 RANDOM STAR WARS PERSON 👤'.padLeft(40));
    print('=' * 60);

    print('\n🧑 ${_bold('Name:')} ${person.name}');

    if (person.height != 'Unknown' && person.height != 'unknown') {
      print('📏 ${_bold('Height:')} ${person.height} cm');
    }
    if (person.mass != 'Unknown' && person.mass != 'unknown') {
      print('⚖️  ${_bold('Mass:')} ${person.mass} kg');
    }
    if (person.birthYear != 'Unknown' && person.birthYear != 'unknown') {
      print('🎂 ${_bold('Birth Year:')} ${person.birthYear}');
    }
    if (person.gender != 'Unknown' && person.gender != 'n/a') {
      String genderEmoji = person.gender == 'male'
          ? '♂️'
          : person.gender == 'female'
              ? '♀️'
              : '⚧️';
      print(
          '$genderEmoji ${_bold('Gender:')} ${_translateGender(person.gender)}');
    }
    if (person.hairColor != 'Unknown' && person.hairColor != 'n/a') {
      print('💇 ${_bold('Hair Color:')} ${person.hairColor}');
    }
    if (person.skinColor != 'Unknown' && person.skinColor != 'n/a') {
      print('🎨 ${_bold('Skin Color:')} ${person.skinColor}');
    }
    if (person.eyeColor != 'Unknown' && person.eyeColor != 'n/a') {
      print('👁️  ${_bold('Eye Color:')} ${person.eyeColor}');
    }

    if (person.films.isNotEmpty) {
      print('🎬 ${_bold('Number of Films:')} ${person.films.length}');
    }

    _printFooter();
  }

  void _displayPlanet(Planet planet) {
    print('\n' + '=' * 60);
    print('🌍 RANDOM STAR WARS PLANET 🌍'.padLeft(40));
    print('=' * 60);

    print('\n🪐 ${_bold('Name:')} ${planet.name}');

    if (planet.diameter != 'Unknown' && planet.diameter != 'unknown') {
      print('📏 ${_bold('Diameter:')} ${planet.diameter} km');
    }
    if (planet.climate != 'Unknown' && planet.climate != 'unknown') {
      print('🌤️  ${_bold('Climate:')} ${planet.climate}');
    }
    if (planet.terrain != 'Unknown' && planet.terrain != 'unknown') {
      print('🏔️  ${_bold('Terrain:')} ${planet.terrain}');
    }
    if (planet.gravity != 'Unknown' && planet.gravity != 'unknown') {
      print('🌍 ${_bold('Gravity:')} ${planet.gravity}');
    }
    if (planet.population != 'Unknown' && planet.population != 'unknown') {
      print('👥 ${_bold('Population:')} ${planet.population}');
    }
    if (planet.rotationPeriod != 'Unknown' &&
        planet.rotationPeriod != 'unknown') {
      print(
          '🔄 ${_bold('Rotation Period:')} ${planet.rotationPeriod} hours');
    }
    if (planet.orbitalPeriod != 'Unknown' &&
        planet.orbitalPeriod != 'unknown') {
      print('🌀 ${_bold('Orbital Period:')} ${planet.orbitalPeriod} days');
    }

    if (planet.residents.isNotEmpty) {
      print('🏠 ${_bold('Number of Residents:')} ${planet.residents.length}');
    }

    _printFooter();
  }

  void _displaySpecies(Species species) {
    print('\n' + '=' * 60);
    print('👽 RANDOM STAR WARS SPECIES 👽'.padLeft(40));
    print('=' * 60);

    print('\n🧬 ${_bold('Name:')} ${species.name}');

    String classificationEmoji =
        _getClassificationEmoji(species.classification);
    print(
        '$classificationEmoji ${_bold('Classification:')} ${species.classification}');
    print('🏷️  ${_bold('Designation:')} ${species.designation}');

    if (species.averageHeight != 'Unknown' &&
        species.averageHeight != 'n/a') {
      print(
          '📏 ${_bold('Average Height:')} ${species.averageHeight} cm');
    }
    if (species.skinColors.isNotEmpty && species.skinColors != 'n/a') {
      print('🎨 ${_bold('Skin Colors:')} ${species.skinColors}');
    }
    if (species.hairColors.isNotEmpty && species.hairColors != 'n/a') {
      print('💇 ${_bold('Hair Colors:')} ${species.hairColors}');
    }
    if (species.eyeColors.isNotEmpty && species.eyeColors != 'n/a') {
      print('👁️  ${_bold('Eye Colors:')} ${species.eyeColors}');
    }
    if (species.averageLifespan != 'Unknown' &&
        species.averageLifespan != 'n/a') {
      String lifespanText = species.averageLifespan == 'indefinite'
          ? 'Indefinite'
          : '${species.averageLifespan} years';
      print('⏰ ${_bold('Average Lifespan:')} $lifespanText');
    }
    if (species.language.isNotEmpty && species.language != 'n/a') {
      print('🗣️  ${_bold('Language:')} ${species.language}');
    }
    if (species.people.isNotEmpty) {
      print('👥 ${_bold('Known Characters:')} ${species.people.length}');
    }

    _printFooter();
  }

  void _displayVehicle(Vehicle vehicle) {
    print('\n' + '=' * 60);
    print('🚗 RANDOM STAR WARS VEHICLE 🚗'.padLeft(40));
    print('=' * 60);

    print('\n🚙 ${_bold('Name:')} ${vehicle.name}');
    print('🏷️  ${_bold('Model:')} ${vehicle.model}');
    print('🏭 ${_bold('Manufacturer:')} ${vehicle.manufacturer}');
    print('📂 ${_bold('Vehicle Class:')} ${vehicle.vehicleClass}');

    if (vehicle.length != 'Unknown' && vehicle.length != 'unknown') {
      print('📏 ${_bold('Length:')} ${vehicle.length} m');
    }
    if (vehicle.maxAtmospheringSpeed != 'Unknown' &&
        vehicle.maxAtmospheringSpeed != 'unknown') {
      print(
          '💨 ${_bold('Max Speed:')} ${vehicle.maxAtmospheringSpeed} km/h');
    }
    if (vehicle.crew != 'Unknown' && vehicle.crew != 'unknown') {
      print('👨‍✈️ ${_bold('Crew:')} ${vehicle.crew}');
    }
    if (vehicle.passengers != 'Unknown' && vehicle.passengers != 'unknown') {
      print('🧳 ${_bold('Passengers:')} ${vehicle.passengers}');
    }
    if (vehicle.costInCredits != 'Unknown' &&
        vehicle.costInCredits != 'unknown') {
      print('💰 ${_bold('Cost:')} ${vehicle.costInCredits} Credits');
    }

    if (vehicle.pilots.isNotEmpty) {
      print('👨‍✈️ ${_bold('Number of Pilots:')} ${vehicle.pilots.length}');
    }

    _printFooter();
  }

  void _displayStarship(Starship starship) {
    print('\n' + '=' * 60);
    print('🚀 RANDOM STAR WARS STARSHIP 🚀'.padLeft(40));
    print('=' * 60);

    print('\n🛸 ${_bold('Name:')} ${starship.name}');
    print('🏷️  ${_bold('Model:')} ${starship.model}');
    print('🏭 ${_bold('Manufacturer:')} ${starship.manufacturer}');
    print('📂 ${_bold('Starship Class:')} ${starship.starshipClass}');

    if (starship.length != 'Unknown' && starship.length != 'unknown') {
      print('📏 ${_bold('Length:')} ${starship.length} m');
    }
    if (starship.hyperdriveRating != 'Unknown' &&
        starship.hyperdriveRating != 'unknown') {
      print('⚡ ${_bold('Hyperdrive Rating:')} ${starship.hyperdriveRating}');
    }
    if (starship.mglt != 'Unknown' && starship.mglt != 'unknown') {
      print('🌌 ${_bold('MGLT:')} ${starship.mglt}');
    }
    if (starship.crew != 'Unknown' && starship.crew != 'unknown') {
      print('👨‍✈️ ${_bold('Crew:')} ${starship.crew}');
    }
    if (starship.passengers != 'Unknown' &&
        starship.passengers != 'unknown') {
      print('🧳 ${_bold('Passengers:')} ${starship.passengers}');
    }
    if (starship.costInCredits != 'Unknown' &&
        starship.costInCredits != 'unknown') {
      print('💰 ${_bold('Cost:')} ${starship.costInCredits} Credits');
    }

    if (starship.pilots.isNotEmpty) {
      print('👨‍✈️ ${_bold('Number of Pilots:')} ${starship.pilots.length}');
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
        return 'Male';
      case 'female':
        return 'Female';
      case 'hermaphrodite':
        return 'Hermaphrodite';
      case 'none':
        return 'None';
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
