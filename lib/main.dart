import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:quiz_science_app/bloc/game_screen.dart/game_bloc.dart';
import 'package:quiz_science_app/bloc/home_screen/home_bloc.dart';
import 'package:quiz_science_app/data/model/user_info_model.dart';
import 'package:quiz_science_app/data/repositories/get_data_from_api.dart';
import 'package:quiz_science_app/screens/splash_screen.dart';
import 'package:quiz_science_app/theme/app_theme.dart';

//https://api.jsonserve.com/Uw5CrX
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserInfoModelAdapter());
  Hive.openBox<UserInfoModel>('user_info');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(apiService: ApiService()),
        ),
        BlocProvider(
          create: (context) => GameBloc (),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.darkTheme,
        home: const SplashScreen(),
      ),
    );
  }
}
