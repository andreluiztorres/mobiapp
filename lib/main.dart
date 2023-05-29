import 'package:flutter/material.dart';
import 'package:mobi/pages/home/home.dart';
import 'package:mobi/pages/login/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Mobi',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 34, 34, 44)),
          useMaterial3: true,
        ),
        routes: {
          '/': (context) => const Login(),
          '/home': (context) => const Home(),
        });
  }
}
