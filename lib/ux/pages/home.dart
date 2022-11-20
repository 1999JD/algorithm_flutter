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
            title: const Text('排序演算法'),
            onTap: () {
              Navigator.of(context).pushNamed('/sort');
            },
          ),
          ListTile(
            title: const Text('搜尋演算法'),
            onTap: () {
              final snackBar = SnackBar(
                content: const Text('暫無此頁面'),
                action: SnackBarAction(
                  label: '關閉',
                  onPressed: () {},
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          )
        ],
      ),
    );
  }
}
