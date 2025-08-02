import 'lib/models/all_models.dart';

void main() {
  final species = Species(
    name: 'Test',
    classification: 'test',
    designation: 'test',
    averageHeight: 'test',
    skinColors: 'test',
    hairColors: 'test',
    eyeColors: 'test',
    averageLifespan: 'test',
    language: 'test',
    homeworld: 'test',
    people: [],
  );

  print('Species: ${species.name}');
}
