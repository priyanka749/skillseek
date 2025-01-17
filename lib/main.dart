import 'package:flutter/material.dart';
import 'package:skillseek/app/app.dart';
import 'package:skillseek/app/di/di.dart';
import 'package:skillseek/core/network/hive_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Hive Database
  await HiveService.init();

  // Initialize Dependencies

  // await HiveService().clearStudentBox();

  await initDependencies();

  runApp(
    const MyApp(),
  );
}
