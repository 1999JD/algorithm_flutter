import 'package:flutter/material.dart';
import 'package:algorithm/ux/pages/home.dart';
import 'package:algorithm/ux/pages/linked_list.dart';

class Path {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const MyHomePage());
      case '/linked-list':
        return MaterialPageRoute(builder: (_) => const LinkedList());
      default: // error page
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
