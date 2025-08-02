class Vehicle {
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
  final String vehicleClass;
  final List<String> pilots;
  final List<String> films;

  Vehicle({
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
    required this.vehicleClass,
    required this.pilots,
    required this.films,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
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
      vehicleClass: json['vehicle_class'] ?? 'Unbekannt',
      pilots: List<String>.from(json['pilots'] ?? []),
      films: List<String>.from(json['films'] ?? []),
    );
  }
}
