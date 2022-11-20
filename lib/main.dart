import 'package:flutter/material.dart';
import 'package:algorithm/route/path.dart';
import 'package:algorithm/ux/pages/home.dart';

void main() {
  runApp(const MyApp()
      // MultiProvider(
      //   providers: [],
      //   child: const MyApp(),
      // ),
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Algorithms',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      onGenerateRoute: Path.generateRoute,
      initialRoute: '/',
    );
  }
}
