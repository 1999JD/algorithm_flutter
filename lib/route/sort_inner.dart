import 'package:algorithm/ux/pages/error.dart';
import 'package:algorithm/ux/pages/sort/2-way-merge.dart';
import 'package:algorithm/ux/pages/sort/bubble.dart';
import 'package:algorithm/ux/pages/sort/bucket.dart';
import 'package:algorithm/ux/pages/sort/counting.dart';
import 'package:algorithm/ux/pages/sort/insertion.dart';
import 'package:algorithm/ux/pages/sort/k-way-merge.dart';
import 'package:algorithm/ux/pages/sort/quick.dart';
import 'package:algorithm/ux/pages/sort/radix.dart';
import 'package:algorithm/ux/pages/sort/selection.dart';
import 'package:algorithm/ux/pages/sort/shell.dart';
import 'package:flutter/material.dart';

class SortInner extends StatefulWidget {
  const SortInner({
    super.key,
    required this.setupPageRoute,
  });

  final String setupPageRoute;

  @override
  SortInnerState createState() => SortInnerState();
}

class SortInnerState extends State<SortInner> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildFlowAppBar(),
      body: Navigator(
        key: _navigatorKey,
        initialRoute: widget.setupPageRoute,
        onGenerateRoute: _onGenerateRoute,
      ),
    );
  }

// preferredsizeWidget => 可以的話，請使用這個尺寸的資訊，作為佈局的參考依據
  PreferredSizeWidget _buildFlowAppBar() {
    return AppBar(
      title: const Text('內頁'),
    );
  }

  Route<dynamic> _onGenerateRoute(RouteSettings settings) {
    late Widget page = ErrorPage(
      message: settings.name ?? '錯誤',
    );
    List<Map<String, dynamic>> sortRoutesList = [
      {"name": '/bubble', "page": const BubblePage()},
      {"name": '/insertion', "page": const InsertionPage()},
      {"name": '/selection', "page": const SelectionPage()},
      {"name": '/shell', "page": const ShellPage()},
      {"name": '/quick', "page": const QuickPage()},
      {"name": '/2-way-merge', "page": const TwoWayMergePage()},
      {"name": '/k-way-merge', "page": const KWayMergePage()},
      {"name": '/counting', "page": const CountingPage()},
      {"name": '/bucket', "page": const BucketPage()},
      {"name": '/radix', "page": const RadixPage()}
    ];

    for (var i = 0; i < sortRoutesList.length; i++) {
      if (settings.name == sortRoutesList[i]["name"]) {
        page = sortRoutesList[i]["page"];
        break;
      }
    }

    return MaterialPageRoute<dynamic>(
      builder: (context) {
        return page;
      },
      settings: settings,
    );
  }
}
