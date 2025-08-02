class Species {
  final String name;
  final String classification;
  final String designation;
  final String averageHeight;
  final String skinColors;
  final String hairColors;
  final String eyeColors;
  final String averageLifespan;
  final String homeworld;
  final String language;
  final List<String> people;
  final List<String> films;
  final DateTime created;
  final DateTime edited;
  final String url;

  Species({
    required this.name,
    required this.classification,
    required this.designation,
    required this.averageHeight,
    required this.skinColors,
    required this.hairColors,
    required this.eyeColors,
    required this.averageLifespan,
    required this.homeworld,
    required this.language,
    required this.people,
    required this.films,
    required this.created,
    required this.edited,
    required this.url,
  });

  factory Species.fromJson(Map<String, dynamic> json) {
    return Species(
      name: json['name'] ?? '',
      classification: json['classification'] ?? '',
      designation: json['designation'] ?? '',
      averageHeight: json['average_height'] ?? '',
      skinColors: json['skin_colors'] ?? '',
      hairColors: json['hair_colors'] ?? '',
      eyeColors: json['eye_colors'] ?? '',
      averageLifespan: json['average_lifespan'] ?? '',
      homeworld: json['homeworld'] ?? '',
      language: json['language'] ?? '',
      people: List<String>.from(json['people'] ?? []),
      films: List<String>.from(json['films'] ?? []),
      created:
          DateTime.parse(json['created'] ?? DateTime.now().toIso8601String()),
      edited:
          DateTime.parse(json['edited'] ?? DateTime.now().toIso8601String()),
      url: json['url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'classification': classification,
      'designation': designation,
      'average_height': averageHeight,
      'skin_colors': skinColors,
      'hair_colors': hairColors,
      'eye_colors': eyeColors,
      'average_lifespan': averageLifespan,
      'homeworld': homeworld,
      'language': language,
      'people': people,
      'films': films,
      'created': created.toIso8601String(),
      'edited': edited.toIso8601String(),
      'url': url,
    };
  }
}
