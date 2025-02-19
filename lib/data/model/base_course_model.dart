// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:quiz_science_app/data/model/question_model.dart';

class BaseCourseModel {
  final int id;
  final String title;
  final String topic;
  final int duration;
  final String negative_marks;
  final String correct_answer_marks;
  final String live_count;
  final int coin_count;
  final int questions_count;
  final int max_mistake_count;
  final List<QuestionCourseModel> questions;

  BaseCourseModel({
    required this.id,
    required this.title,
    required this.topic,
    required this.duration,
    required this.negative_marks,
    required this.correct_answer_marks,
    required this.live_count,
    required this.coin_count,
    required this.questions_count,
    required this.max_mistake_count,
    required this.questions,
  });

  factory BaseCourseModel.fromJson(Map<String, dynamic> map) {
    return BaseCourseModel(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      topic: map['topic'] ?? '',
      duration: map['duration'] ?? 0,
      negative_marks: map['negative_marks']?.toString() ?? '0',
      correct_answer_marks: map['correct_answer_marks']?.toString() ?? '0',
      live_count: map['live_count']?.toString() ?? '0',
      coin_count: map['coin_count'] ?? 0,
      questions_count: map['questions_count'] ?? 0,
      max_mistake_count: map['max_mistake_count'] ?? 0,
      questions: (map['questions'] as List<dynamic>?)
              ?.map((x) =>
                  QuestionCourseModel.fromJson(x as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}
