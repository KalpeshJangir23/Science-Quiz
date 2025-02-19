import 'package:flutter/material.dart';
import 'package:quiz_science_app/theme/app_color.dart';

class TestDisplayCard extends StatelessWidget {
  final String title;
  final String topic;
  final int duration;
  final String negative_marks;
  final String correct_answer_marks;
  final String live_count;
  final String questions_count;
  final int max_mistake_count;
  final VoidCallback onStartPressed;

  const TestDisplayCard({
    super.key,
    required this.title,
    required this.topic,
    required this.duration,
    required this.negative_marks,
    required this.correct_answer_marks,
    required this.live_count,
    required this.questions_count,
    required this.max_mistake_count,
    required this.onStartPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.displaySmall,
                  ),
                  const SizedBox(height: 16),
                  _buildDetailRow(
                    Icons.topic,
                    'Topic',
                    topic,
                    theme,
                  ),
                  _buildDetailRow(
                    Icons.timer,
                    'Duration',
                    '$duration minutes',
                    theme,
                  ),
                  _buildDetailRow(
                    Icons.remove_circle_outline,
                    'Negative Marks',
                    negative_marks,
                    theme,
                  ),
                  _buildDetailRow(
                    Icons.check_circle_outline,
                    'Correct Answer Marks',
                    correct_answer_marks,
                    theme,
                  ),
                  _buildDetailRow(
                    Icons.favorite,
                    'Lives',
                    live_count,
                    theme,
                  ),
                  _buildDetailRow(
                    Icons.quiz,
                    'Questions',
                    questions_count,
                    theme,
                  ),
                  _buildDetailRow(
                    Icons.error_outline,
                    'Max Mistakes Allowed',
                    max_mistake_count.toString(),
                    theme,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton.icon(
              onPressed: onStartPressed,
              icon: const Icon(
                Icons.play_arrow_rounded,
                color: AppColor.whiteShade,
                size: 28,
              ),
              label: Text(
                'Start Quiz',
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: AppColor.whiteShade,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(
      IconData icon, String label, String value, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: theme.colorScheme.onSurface.withOpacity(0.7),
          ),
          const SizedBox(width: 12),
          Text(
            '$label: ',
            style: theme.textTheme.bodyLarge!.copyWith(
              color: theme.colorScheme.onSurface.withOpacity(0.7),
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            value,
            style: theme.textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
