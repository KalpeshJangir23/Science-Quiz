import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_science_app/bloc/game_screen.dart/game_bloc.dart';
import 'package:quiz_science_app/bloc/game_screen.dart/game_event.dart';
import 'package:quiz_science_app/data/model/option_model.dart';

class QuestionDisplayCard extends StatefulWidget {
  final String description;
  final List<OptionModel> options;
  final Function(int) onOptionSelected;
  final int questionId;
  final int? selectedOptionId;

  const QuestionDisplayCard({
    super.key,
    required this.description,
    required this.options,
    required this.onOptionSelected,
    required this.questionId,
    this.selectedOptionId,
  });
  @override
  State<QuestionDisplayCard> createState() => _QuestionDisplayCardState();
}

class _QuestionDisplayCardState extends State<QuestionDisplayCard> {
  int? selectedOptionId;

  @override
  void initState() {
    super.initState();
    // Initialize with the passed selectedOptionId
    selectedOptionId = widget.selectedOptionId;
  }

  @override
  void didUpdateWidget(QuestionDisplayCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update local state if the prop changes
    if (widget.selectedOptionId != oldWidget.selectedOptionId) {
      selectedOptionId = widget.selectedOptionId;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.description,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 24),
            ...widget.options.map((option) {
              final isSelected = selectedOptionId == option.id;
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selectedOptionId = option.id;
                    });
                    context.read<GameBloc>().add(AnswerSelected(
                          questionId: widget.questionId,
                          optionId: option.id,
                        ));
                    widget.onOptionSelected(option.id);
                  },
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? theme.colorScheme.primary.withOpacity(0.1)
                          : theme.colorScheme.secondary,
                      border: Border.all(
                        color: isSelected
                            ? theme.colorScheme.primary
                            : Colors.transparent,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected
                                  ? theme.colorScheme.primary
                                  : theme.colorScheme.onSecondary
                                      .withOpacity(0.6),
                              width: 2,
                            ),
                            color: isSelected
                                ? theme.colorScheme.primary
                                : Colors.transparent,
                          ),
                          child: isSelected
                              ? Icon(
                                  Icons.check,
                                  size: 16,
                                  color: theme.colorScheme.onPrimary,
                                )
                              : null,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            option.description,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: isSelected
                                  ? theme.colorScheme.primary
                                  : theme.colorScheme.onSecondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
