import 'package:fitness_app/models/enum_types.dart';

class Exercise {
  final String name;
  final String description;
  final TypeTraining typeTraining;
  final String pathImage;

  Exercise({
    required this.name,
    required this.description,
    required this.typeTraining,
    required this.pathImage,
  });
}
