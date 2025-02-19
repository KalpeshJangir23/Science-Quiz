import 'package:quiz_science_app/data/model/base_course_model.dart';

abstract class HomeState {}

// initial , loading , loaded  , error

class HomeInitial extends HomeState {}
// as soon as we come to this page i want to show the test detail of which the user will give. as a card with the detail but we can user detail like name and course taken in the appbar
// so load screen would fetch the data and card will display
//  in the body of the screen it would be like loading then card for the test detail and start button to start the test

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final BaseCourseModel baseCourseModel;
  HomeLoaded(this.baseCourseModel);
}

class HomeError extends HomeState {
  final String message;

  HomeError({required this.message});
}
