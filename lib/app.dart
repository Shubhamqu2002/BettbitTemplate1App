import 'package:flutter/material.dart';
// import 'pages/auth/auth_page.dart';
import 'pages/main/main_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Template 1',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const MainPage(),
    );
  }
}