import 'package:eggs/pages/home_page.dart';
import 'package:flutter/material.dart';

class FieldWidget extends StatefulWidget {
  const FieldWidget({super.key});

  @override
  State<FieldWidget> createState() => _FieldWidgetState();
}

class _FieldWidgetState extends State<FieldWidget> {
  final TextEditingController todoController = TextEditingController();
  // var _errorText = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              controller: todoController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Adicione um ID',
                  //errorText: _errorText,
                  //hintText: 'Ex.:Flutter',
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blueAccent, width: 2),
                  ),
                  labelStyle: TextStyle(color: Colors.blueAccent)),
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: () {
              //data = todoController.text;
              // if (text.isEmpty) {
              //   // _errorText = 'Texto não digitado!!!';
              // } else {
              //   // _errorText = '';
              // }
              // setState(() {
              //   // _errorText;
              //   return;
              // });
            },
            style: ElevatedButton.styleFrom(
                shape:
                    const BeveledRectangleBorder(side: BorderSide.none),
                //padding: EdgeInsets.all(22),
                minimumSize: const Size(30, 60),
                backgroundColor: Colors.blueAccent),
            child: const Icon(Icons.add, color: Colors.white, size: 35),
          )
        ],
      ),
    );
  }
}
