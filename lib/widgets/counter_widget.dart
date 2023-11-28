import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int digits = 8;

  void _decrement() {
    setState(() {
      digits--;
    });
  }

  void _increment() {
    setState(() {
      digits++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).primaryColor,
      ),
      width: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {
              _decrement();
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(1),
              backgroundColor: Theme.of(context).primaryColor,
            ),
            child: const Icon(
              Icons.remove,
              color: Colors.white,
            ),
          ),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            width: 70,
            height: 35,
            child:
                Text(digits.toString(), style: const TextStyle(fontSize: 20)),
          ),
          ElevatedButton(
            onPressed: () {
              _increment();
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(1),
              backgroundColor: Theme.of(context).primaryColor,
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
