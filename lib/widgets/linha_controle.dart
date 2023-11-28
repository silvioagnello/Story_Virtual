import 'package:eggs/models/todo_model.dart';
import 'package:flutter/material.dart';

class LinhaControle extends StatelessWidget {
  List<Todo> td;
  final Function() deleteTODOS;

  LinhaControle(List<Todo> this.td, this.deleteTODOS, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('${td.length} tarefa(s) pendente(s)'),
        const SizedBox(width: 8),
        Container(
          decoration:
          BoxDecoration(color: Color.fromARGB(0, 45, 7, 115)),
          child: ElevatedButton(
            onPressed: deleteTODOS,
            style: TextButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              padding: const EdgeInsets.all(16.0),
            ),
            child: const Text(
              'Limpar tudo',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
