import 'package:flutter/material.dart';

class BubblePage extends StatefulWidget {
  const BubblePage({super.key});

  @override
  State<BubblePage> createState() => _BubblePageState();
}

class _BubblePageState extends State<BubblePage> with TickerProviderStateMixin {
  final _controller = TextEditingController();

  FocusNode numberInput = FocusNode();

  List<int> numbers = [];

  void _filterNumber() {
    final String text = _controller.text.replaceAll(RegExp(r'[\D]'), '');
    _controller.value = _controller.value.copyWith(
      text: text,
      selection:
          TextSelection(baseOffset: text.length, extentOffset: text.length),
      composing: TextRange.empty,
    );
  }

  void bubbleSort() {
    setState(() {
      for (var i = 0; i < numbers.length; i++) {
        for (var j = 0; j < numbers.length - 1; j++) {
          if (numbers[j] > numbers[j + 1]) {
            var temp = numbers[j + 1];
            numbers[j + 1] = numbers[j];
            numbers[j] = temp;
          }
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(_filterNumber);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) currentFocus.unfocus();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 8,
              children: numbers
                  .map((number) => Container(
                      margin: const EdgeInsets.all(4),
                      alignment: Alignment.center,
                      color: Colors.amber[200],
                      child: Text(number.toString())))
                  .toList(),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(bottom: 16),
            child: ElevatedButton(
              onPressed: () => {bubbleSort()},
              child: const Text('開始排序'),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 36),
            padding: const EdgeInsets.all(16.0),
            child: TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                focusNode: numberInput,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '輸入數字',
                ),
                onSubmitted: (value) {
                  setState(() {
                    numbers.add(int.parse(value));
                    _controller.clear();
                    numberInput.requestFocus();
                  });
                }),
          ),
        ],
      ),
    );
  }
}
