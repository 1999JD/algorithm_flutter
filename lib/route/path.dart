import 'package:flutter/material.dart';
import 'package:algorithm/ux/pages/home.dart';
import 'package:algorithm/ux/pages/sort/sort.dart';
import 'package:algorithm/ux/pages/search.dart';
import 'package:algorithm/ux/pages/error.dart';
import 'sort_inner.dart';

class Path {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    late Widget page;
    if (settings.name == '/') {
      page = const MyHomePage();
    } else if (settings.name == '/sort') {
      page = const SortPage();
    } else if (settings.name!.startsWith('/sort/')) {
      final subRoute = settings.name!.substring('/sort'.length);
      page = SortInner(
        setupPageRoute: subRoute,
      );
    } else if (settings.name == '/search') {
      page = const SearchPage();
    } else {
      final String msg = settings.name ?? '';
      page = ErrorPage(message: msg);
    }

    return MaterialPageRoute<dynamic>(
      builder: (context) {
        return page;
      },
      settings: settings,
    );
  }
}
