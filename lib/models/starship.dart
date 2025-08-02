class Starship {
  final String name;
  final String model;
  final String manufacturer;
  final String costInCredits;
  final String length;
  final String maxAtmospheringSpeed;
  final String crew;
  final String passengers;
  final String cargoCapacity;
  final String consumables;
  final String hyperdriveRating;
  final String mglt;
  final String starshipClass;
  final List<String> pilots;
  final List<String> films;

  Starship({
    required this.name,
    required this.model,
    required this.manufacturer,
    required this.costInCredits,
    required this.length,
    required this.maxAtmospheringSpeed,
    required this.crew,
    required this.passengers,
    required this.cargoCapacity,
    required this.consumables,
    required this.hyperdriveRating,
    required this.mglt,
    required this.starshipClass,
    required this.pilots,
    required this.films,
  });

  factory Starship.fromJson(Map<String, dynamic> json) {
    return Starship(
      name: json['name'] ?? 'Unbekannt',
      model: json['model'] ?? 'Unbekannt',
      manufacturer: json['manufacturer'] ?? 'Unbekannt',
      costInCredits: json['cost_in_credits'] ?? 'Unbekannt',
      length: json['length'] ?? 'Unbekannt',
      maxAtmospheringSpeed: json['max_atmosphering_speed'] ?? 'Unbekannt',
      crew: json['crew'] ?? 'Unbekannt',
      passengers: json['passengers'] ?? 'Unbekannt',
      cargoCapacity: json['cargo_capacity'] ?? 'Unbekannt',
      consumables: json['consumables'] ?? 'Unbekannt',
      hyperdriveRating: json['hyperdrive_rating'] ?? 'Unbekannt',
      mglt: json['MGLT'] ?? 'Unbekannt',
      starshipClass: json['starship_class'] ?? 'Unbekannt',
      pilots: List<String>.from(json['pilots'] ?? []),
      films: List<String>.from(json['films'] ?? []),
    );
  }
}
