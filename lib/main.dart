import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/features/main_screen/view/main_screen.dart';
import 'package:todo_app/features/main_screen/view_model/add_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context)  =>AddProvider(),
      child: const MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          home: MainScreen()
      ),
    );
  }
}


