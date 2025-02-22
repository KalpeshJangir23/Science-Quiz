// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:quiz_science_app/data/model/evaluate_result_model.dart';

abstract class GameState {}

class GameStart extends GameState {
  final int score;
  final int correct_answer;
  final int wrong_answer;
  final Map<int, int> selectedAnswers; // Add this to track selected answers

  GameStart({
    required this.score,
    required this.correct_answer,
    required this.wrong_answer,
    this.selectedAnswers = const {}, // Default to empty map
  });

  GameStart copyWith({
    int? score,
    int? correct_answer,
    int? wrong_answer,
    Map<int, int>? selectedAnswers,
  }) {
    return GameStart(
      score: score ?? this.score,
      correct_answer: correct_answer ?? this.correct_answer,
      wrong_answer: wrong_answer ?? this.wrong_answer,
      selectedAnswers: selectedAnswers ?? this.selectedAnswers,
    );
  }
}

class GameEnd extends GameState {
  final EvaluateResultModel evaluateResultModel;
  GameEnd({
    required this.evaluateResultModel,
  });
}
