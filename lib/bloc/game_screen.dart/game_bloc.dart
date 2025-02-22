import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_science_app/bloc/game_screen.dart/game_event.dart';
import 'package:quiz_science_app/bloc/game_screen.dart/game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc()
      : super(GameStart(
          score: 0,
          correct_answer: 0,
          wrong_answer: 0,
        )) {
    on<CalculateScore>((event, emit) {
      int right_marks = event.correct_count * 4;
      int totalMarks = right_marks + (event.wrong_count * -1);
      emit(GameStart(
          score: totalMarks,
          correct_answer: event.correct_count,
          wrong_answer: event.wrong_count));
    });
  }
}
