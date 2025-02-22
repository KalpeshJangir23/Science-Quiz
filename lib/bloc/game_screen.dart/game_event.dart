abstract class GameEvent {}

class CalculateScore extends GameEvent {
  int correct_count = 0;
  int wrong_count = 0;
}

class DisplayScore extends GameEvent {}

class DisplayDetailView extends GameEvent {}
