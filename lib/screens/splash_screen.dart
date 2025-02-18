import 'package:flutter/material.dart';
import 'package:quiz_science_app/screens/login_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Trigger navigation after 5 seconds
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const UserInfoPage()), 
      );
    });

    return const Scaffold(
      body: Center(
        child: Text(
          "Welcome to process from seed to plant ❤️",
        ),
      ),
    );
  }
}
