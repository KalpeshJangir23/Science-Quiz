// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:quiz_science_app/data/model/evaluate_result_model.dart';

abstract class GameState {}

class GameStart extends GameState {
  final int score;
  final int correct_answer;
  
  final int wrong_answer;

  GameStart({
    required this.score,
    required this.correct_answer,
    required this.wrong_answer,
  });
}

class GameEnd extends GameState {
  final EvaluateResultModel evaluateResultModel;
  GameEnd({
    required this.evaluateResultModel,
  });
}
