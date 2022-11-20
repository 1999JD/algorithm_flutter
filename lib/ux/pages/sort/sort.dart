import 'package:flutter/material.dart';
import 'package:algorithm/route/sort_inner.dart';

class SortPage extends StatefulWidget {
  const SortPage({super.key});

  @override
  State<SortPage> createState() => _SortPageState();
}

class _SortPageState extends State<SortPage> {
  final List<Map<String, dynamic>> sortRoutesList = [
    {"name": "氣泡排序法", "path": '/bubble'},
    {"name": "插入排序法", "path": '/insertion'},
    {"name": "選擇排序法", "path": '/selection'},
    {"name": "謝爾排序法", "path": '/shell'},
    {"name": "快速排序法", "path": '/quick'},
    {"name": "2路融合排序法", "path": '/2-way-merge'},
    {"name": "k路融合排序法", "path": '/k-way-merge'},
    {"name": "計算排序法", "path": '/counting'},
    {"name": "桶子排序法", "path": '/bucket'},
    {"name": "基底排序法", "path": '/radix'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('sortPage'),
        ),
        body: ListView(
          children: sortRoutesList.map((route) {
            return ListTile(
              title: Text(route["name"]),
              onTap: () {
                Navigator.of(context).pushNamed('/sort${route["path"]}');
              },
            );
          }).toList(),
        ));
  }
}
