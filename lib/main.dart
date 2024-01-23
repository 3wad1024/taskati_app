import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskati_app/core/storage/task_model.dart';
import 'package:taskati_app/core/utils/app_colors.dart';
import 'package:taskati_app/core/utils/styles.dart';
import 'package:taskati_app/splash_view.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Task>('task');
  await Hive.openBox('user');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        darkTheme: ThemeData(
            appBarTheme: AppBarTheme(
                backgroundColor: AppColors.darkscaffoldbg,
                elevation: 0.0,
                titleTextStyle: getTiteleStyle(
                    color: AppColors.primarycolor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500)),
            inputDecorationTheme: InputDecorationTheme(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primarycolor),
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primarycolor),
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.redcolor),
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.redcolor),
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
            )),
        theme: ThemeData(
            scaffoldBackgroundColor: AppColors.whitecolor,
            appBarTheme: AppBarTheme(
                backgroundColor: AppColors.whitecolor,
                elevation: 0.0,
                titleTextStyle: getTiteleStyle(
                    color: AppColors.primarycolor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600)),
            inputDecorationTheme: InputDecorationTheme(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primarycolor),
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primarycolor),
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.redcolor),
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.redcolor),
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
            )),
        
        
        debugShowCheckedModeBanner: false,
        home: const SplashView());
  }
}