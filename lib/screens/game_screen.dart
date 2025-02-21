import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_science_app/bloc/home_screen/home_bloc.dart';
import 'package:quiz_science_app/bloc/home_screen/home_state.dart';
import 'package:quiz_science_app/screens/widget/question_display_card.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;
  int _remainingSeconds = 0;
  bool _isTimerStarted = false;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      if (_pageController.positions.isNotEmpty) {
        setState(() {
          _currentPage = _pageController.page?.round() ?? 0;
        });
      }
    });
  }

  void _startTimer(int durationInMinutes) {
    if (_isTimerStarted) return; // Prevent multiple timer starts
    
    _isTimerStarted = true;
    _remainingSeconds = durationInMinutes * 60; // Convert minutes to seconds
    
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          _timer?.cancel();
          _showTimeUpDialog();
        }
      });
    });
  }

  void _showTimeUpDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Time\'s Up!'),
        content: const Text('You\'ve run out of time.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog
              Navigator.of(context).pop(); // Return to previous screen
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  String _formatTime(int totalSeconds) {
    int minutes = totalSeconds ~/ 60;
    int seconds = totalSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ATB"),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: Text(
                _formatTime(_remainingSeconds),
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: _remainingSeconds < 60 ? Colors.red : null, // Red color for last minute
                ),
              ),
            ),
          ),
        ],
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
            final data = state.baseCourseModel;
            // Start timer only once when data is loaded
            if (!_isTimerStarted) {
              _startTimer(data.duration);
            }
            
            return Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: data.questions.length,
                    itemBuilder: (context, index) {
                      final question = data.questions[index];
                      return QuestionDisplayCard(
                        description: question.description,
                        options: question.options,
                        onOptionSelected: (selectedOptionId) {
                          // Handle option selection
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Question ${_currentPage + 1} of ${data.questions.length}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: _currentPage > 0
                                ? () {
                                    _pageController.previousPage(
                                      duration: const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                : null,
                            child: const Text('Previous'),
                          ),
                          const SizedBox(width: 16),
                          ElevatedButton(
                            onPressed: _currentPage < data.questions.length - 1
                                ? () {
                                    _pageController.nextPage(
                                      duration: const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                : null,
                            child: const Text('Next'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
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
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }
}