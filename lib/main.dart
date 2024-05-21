import 'package:bookly/core/functions/init_main_method_app.dart';
import 'package:bookly/core/presentation/my_app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initMainMethodApp();
  runApp(MyApp());
}
