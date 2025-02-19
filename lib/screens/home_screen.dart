import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quiz_science_app/data/model/user_info_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ValueListenableBuilder<Box<UserInfoModel>>(
        valueListenable: Hive.box<UserInfoModel>('user_info').listenable(),
        builder: (context, box, _) {
          if (box.isEmpty) {
            return const Center(
              child: Text('No user information found'),
            );
          }

          // Get the first user info entry
          final userInfo = box.values.first;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome, ${userInfo.name}!',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  'Course: ${userInfo.course_taken}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}