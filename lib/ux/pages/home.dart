import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('這裡是首頁'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('linked list'),
            onTap: () {
              Navigator.of(context).pushNamed('/linked-list');
            },
          ),
        ],
      ),
    );
  }
}
