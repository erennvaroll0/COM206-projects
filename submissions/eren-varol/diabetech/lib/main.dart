import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const DiabetechApp());
}

class DiabetechApp extends StatelessWidget {
  const DiabetechApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DiabeTech',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.amber,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
