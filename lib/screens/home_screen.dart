import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quiz_science_app/bloc/home_screen/home_bloc.dart';
import 'package:quiz_science_app/bloc/home_screen/home_event.dart';
import 'package:quiz_science_app/bloc/home_screen/home_state.dart';
import 'package:quiz_science_app/data/model/user_info_model.dart';
import 'package:quiz_science_app/screens/widget/test_display_card.dart';
import 'package:quiz_science_app/screens/game_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(FetchDetails());
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<UserInfoModel>>(
      valueListenable: Hive.box<UserInfoModel>('user_info').listenable(),
      builder: (context, box, _) {
        final userInfo = box.values.first;
        return Scaffold(
            appBar: AppBar(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userInfo.name,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    'Course: ${userInfo.course_taken}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            body: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  );
                }
                if (state is HomeLoaded) {
                  var data = state.baseCourseModel;
                  return TestDisplayCard(
                    title: data.title,
                    topic: data.topic,
                    duration: data.duration,
                    negative_marks: data.negative_marks,
                    correct_answer_marks: data.correct_answer_marks,
                    live_count: data.live_count,
                    questions_count: data.questions_count.toString(),
                    max_mistake_count: data.max_mistake_count,
                    onStartPressed: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircularProgressIndicator(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'Starting in...',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onBackground,
                                      ),
                                ),
                                TweenAnimationBuilder(
                                  tween: Tween(begin: 5.0, end: 0.0),
                                  duration: const Duration(seconds: 5),
                                  builder: (context, value, child) {
                                    return Text(
                                      '${value.ceil()}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge
                                          ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                    );
                                  },
                                  onEnd: () {
                                    Navigator.pop(context); // Close the dialog
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const GameScreen(),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  );
                }
                if (state is HomeError) {
                  return Center(
                    child: Text(
                      state.message,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).colorScheme.error,
                          ),
                    ),
                  );
                }
                return Container();
              },
            ));
      },
    );
  }
}
