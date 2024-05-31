import 'package:flutter/material.dart';
import 'package:record_speechtotextfor_hospital/screens/historypage.dart';
import 'package:record_speechtotextfor_hospital/screens/login_page.dart';
import 'package:record_speechtotextfor_hospital/screens/profile_pasien.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
