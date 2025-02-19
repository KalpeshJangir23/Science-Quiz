import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_science_app/bloc/home_screen/home_event.dart';
import 'package:quiz_science_app/bloc/home_screen/home_state.dart';
import 'package:quiz_science_app/data/repositories/get_data_from_api.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ApiService apiService;

  HomeBloc({required this.apiService}) : super(HomeInitial()) {
    on<FetchDetails>((event, emit) async {
      try {
        emit(HomeLoading());
        final data = await apiService.getCourseData();
        emit(HomeLoaded(data));
      } catch (e) {
        emit(HomeError(message: e.toString()));
      }
    });
  }
}
