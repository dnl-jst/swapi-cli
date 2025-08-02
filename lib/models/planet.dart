class Planet {
  final String name;
  final String rotationPeriod;
  final String orbitalPeriod;
  final String diameter;
  final String climate;
  final String gravity;
  final String terrain;
  final String surfaceWater;
  final String population;
  final List<String> residents;
  final List<String> films;

  Planet({
    required this.name,
    required this.rotationPeriod,
    required this.orbitalPeriod,
    required this.diameter,
    required this.climate,
    required this.gravity,
    required this.terrain,
    required this.surfaceWater,
    required this.population,
    required this.residents,
    required this.films,
  });

  factory Planet.fromJson(Map<String, dynamic> json) {
    return Planet(
      name: json['name'] ?? 'Unbekannt',
      rotationPeriod: json['rotation_period'] ?? 'Unbekannt',
      orbitalPeriod: json['orbital_period'] ?? 'Unbekannt',
      diameter: json['diameter'] ?? 'Unbekannt',
      climate: json['climate'] ?? 'Unbekannt',
      gravity: json['gravity'] ?? 'Unbekannt',
      terrain: json['terrain'] ?? 'Unbekannt',
      surfaceWater: json['surface_water'] ?? 'Unbekannt',
      population: json['population'] ?? 'Unbekannt',
      residents: List<String>.from(json['residents'] ?? []),
      films: List<String>.from(json['films'] ?? []),
    );
  }
}
