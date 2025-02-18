// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:quiz_science_app/data/model/question_model.dart';

class BaseCourseModel {
  final int id;
  final String title;
  final String topic;
  final int duration;
  final String negative_marks;
  final String correct_answer_marks;
  final String live_count;
  final String coin_count;
  final String questions_count;
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
      id: map['id'] as int,
      title: map['title'] as String,
      topic: map['topic'] as String,
      duration: map['duration'] as int,
      negative_marks: map['negative_marks'] as String,
      correct_answer_marks: map['correct_answer_marks'] as String,
      live_count: map['live_count'] as String,
      coin_count: map['coin_count'] as String,
      questions_count: map['questions_count'] as String,
      max_mistake_count: map['max_mistake_count'] as int,
      questions: List<QuestionCourseModel>.from(
        (map['questions'] as List<int>).map<QuestionCourseModel>(
          (x) => QuestionCourseModel.fromJson(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
