abstract class GameEvent {}

class CalculateScore extends GameEvent {
  int correct_count = 0;
  int wrong_count = 0;
}

class DisplayScore extends GameEvent {}

class DisplayDetailView extends GameEvent {}

// Add new event for answer selection
class AnswerSelected extends GameEvent {
  final int questionId;
  final int optionId;

  AnswerSelected({
    required this.questionId,
    required this.optionId,
  });
}
