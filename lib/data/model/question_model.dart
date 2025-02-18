// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:quiz_science_app/data/model/option_model.dart';

class QuestionCourseModel {
  final int id;
  final String description;
  final String topic;
  final String detailed_solution;
  final String question_from;
  final List<OptionModel> options;
  final ReadingMaterialModel reading_material;
  final PracticeMaterialModel practice_material;

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
      id: map['id'] as int,
      description: map['description'] as String,
      topic: map['topic'] as String,
      detailed_solution: map['detailed_solution'] as String,
      question_from: map['question_from'] as String,
      options: List<OptionModel>.from(
        (map['options'] as List<int>).map<OptionModel>(
          (x) => OptionModel.fromJson(x as Map<String, dynamic>),
        ),
      ),
      reading_material: ReadingMaterialModel.fromMap(
          map['reading_material'] as Map<String, dynamic>),
      practice_material: PracticeMaterialModel.fromMap(
          map['practice_material'] as Map<String, dynamic>),
    );
  }
}
