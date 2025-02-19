import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:quiz_science_app/data/model/user_info_model.dart';
import 'package:quiz_science_app/screens/home_screen.dart';
import 'package:quiz_science_app/theme/app_color.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({super.key});

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  final _nameController = TextEditingController();
  String _selectedStudentType = 'Medical'; // Default value

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _navigateToHome() async {
    Box<UserInfoModel> userInfo = Hive.box<UserInfoModel>('user_info');
    var userInfoModel = UserInfoModel(
      course_taken: _selectedStudentType,
      name: _nameController.text.trim(),
    );
    await userInfo.put(userInfoModel.name, userInfoModel);
    await userInfo.put(userInfoModel.course_taken, userInfoModel);
    if (_nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your name'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var texttheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Welcome!',
                style: Theme.of(context).textTheme.displayMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              // Name Input Field
              TextField(
                controller: _nameController,
                style: texttheme.displayMedium,
                decoration: const InputDecoration(
                  labelText: 'Your Name',
                  hintText: 'Enter your full name',
                ),
              ),
              const SizedBox(height: 24),
              // Student Type Selection
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: AppColor.smallContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedStudentType,
                    isExpanded: true,
                    dropdownColor: AppColor.smallContainer,
                    style: texttheme.bodyLarge,
                    items: ['Medical', 'Engineering'].map((String type) {
                      return DropdownMenuItem<String>(
                        value: type,
                        child: Text(type),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          _selectedStudentType = newValue;
                        });
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(height: 40),
              // Continue Button
              ElevatedButton(
                onPressed: _navigateToHome,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    'Continue',
                    style:
                        texttheme.bodyLarge!.copyWith(color: AppColor.offshade),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
