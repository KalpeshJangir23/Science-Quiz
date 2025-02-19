// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:quiz_science_app/data/model/option_model.dart';

class QuestionCourseModel {
  final int id;
  final String description;
  final String topic;
  final String detailed_solution;
  final String question_from;
  final List<OptionModel> options;
  final ReadingMaterialModel? reading_material;
  final PracticeMaterialModel? practice_material;

  QuestionCourseModel({
    required this.id,
    required this.description,
    required this.topic,
    required this.detailed_solution,
    required this.question_from,
    required this.options,
    required this.reading_material,
    required this.practice_material,
  });

  factory QuestionCourseModel.fromJson(Map<String, dynamic> map) {
    return QuestionCourseModel(
      id: map['id'] ?? 0,
      description: map['description'] ?? '',
      topic: map['topic'] ?? '',
      detailed_solution: map['detailed_solution'] ?? '',
      question_from: map['question_from'] ?? '',
      options: (map['options'] as List<dynamic>?)
              ?.map((x) => OptionModel.fromJson(x as Map<String, dynamic>))
              .toList() ??
          [],
      reading_material: map['reading_material'] == null
          ? null
          : ReadingMaterialModel.fromMap(
              map['reading_material'] as Map<String, dynamic>),
      practice_material: map['practice_material'] == null
          ? null
          : PracticeMaterialModel.fromMap(
              map['practice_material'] as Map<String, dynamic>),
    );
  }
}
