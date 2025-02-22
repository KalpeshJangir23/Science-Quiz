// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:quiz_science_app/data/model/question_model.dart';
import 'package:quiz_science_app/data/model/score.dart';

class EvaluateResultModel {
  final Score score;
  final List<QuestionCourseModel> questionsAnswer;
  final int corrected_option;
  final int selected_option;

  EvaluateResultModel({
    required this.score,
    required this.questionsAnswer,
    required this.corrected_option,
    required this.selected_option,
  });
}
