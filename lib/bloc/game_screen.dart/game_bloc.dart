import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_science_app/bloc/game_screen.dart/game_event.dart';
import 'package:quiz_science_app/bloc/game_screen.dart/game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc()
      : super(GameStart(
          score: 0,
          correct_answer: 0,
          wrong_answer: 0,
          selectedAnswers: {}, // Initialize empty map
        )) {
    on<CalculateScore>((event, emit) {
      int right_marks = event.correct_count * 4;
      int totalMarks = right_marks + (event.wrong_count * -1);

      if (state is GameStart) {
        final currentState = state as GameStart;
        emit(currentState.copyWith(
          score: totalMarks,
          correct_answer: event.correct_count,
          wrong_answer: event.wrong_count,
        ));
      }
    });

    // Add handler for answer selection
    on<AnswerSelected>((event, emit) {
      if (state is GameStart) {
        final currentState = state as GameStart;
        final updatedAnswers = Map<int, int>.from(currentState.selectedAnswers);
        updatedAnswers[event.questionId] = event.optionId;

        emit(currentState.copyWith(
          selectedAnswers: updatedAnswers,
        ));
      }
    });
  }
}
