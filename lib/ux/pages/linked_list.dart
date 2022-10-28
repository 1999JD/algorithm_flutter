import 'package:algorithm/models/linked_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LinkedList extends StatefulWidget {
  const LinkedList({super.key});

  @override
  State<LinkedList> createState() => _LinkedListState();
}

class _LinkedListState extends State<LinkedList> {
  final inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<int> nodes = [1, 2, 3, 4, 5];
    return Scaffold(
      appBar: AppBar(
        title: const Text('鏈結串列'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              padding: const EdgeInsets.all(4),
              children: [
                for (var i in nodes)
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.amber,
                    alignment: Alignment.center,
                    child: (Text(i.toString())),
                  )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: TextField(
              obscureText: false,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '請輸入插入值',
              ),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              controller: inputController,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 24),
            child: ElevatedButton(
              onPressed: () {
                final list = LinkedListModel<int>();
                list.push(3);
                list.push(2);
                list.push(5);
                print(list);
                // final node1 = Node(value: 1);
                // final node2 = Node(value: 2);
                // node1.next = node2;
                // print('查看值');
                // print(inputController.text);
                // print(node1);
              },
              child: const Text('插入'),
            ),
          )
        ],
      ),
    );
  }
}
