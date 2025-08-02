class Person {
  final String name;
  final String height;
  final String mass;
  final String hairColor;
  final String skinColor;
  final String eyeColor;
  final String birthYear;
  final String gender;
  final String homeworld;
  final List<String> films;
  final List<String> species;
  final List<String> vehicles;
  final List<String> starships;

  Person({
    required this.name,
    required this.height,
    required this.mass,
    required this.hairColor,
    required this.skinColor,
    required this.eyeColor,
    required this.birthYear,
    required this.gender,
    required this.homeworld,
    required this.films,
    required this.species,
    required this.vehicles,
    required this.starships,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      name: json['name'] ?? 'Unbekannt',
      height: json['height'] ?? 'Unbekannt',
      mass: json['mass'] ?? 'Unbekannt',
      hairColor: json['hair_color'] ?? 'Unbekannt',
      skinColor: json['skin_color'] ?? 'Unbekannt',
      eyeColor: json['eye_color'] ?? 'Unbekannt',
      birthYear: json['birth_year'] ?? 'Unbekannt',
      gender: json['gender'] ?? 'Unbekannt',
      homeworld: json['homeworld'] ?? 'Unbekannt',
      films: List<String>.from(json['films'] ?? []),
      species: List<String>.from(json['species'] ?? []),
      vehicles: List<String>.from(json['vehicles'] ?? []),
      starships: List<String>.from(json['starships'] ?? []),
    );
  }
}
