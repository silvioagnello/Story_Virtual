import 'package:eggs/models/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoListItem extends StatelessWidget {
  final Todo todo;
  final Function(Todo) onDelete;

  const TodoListItem({super.key, required this.todo, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Slidable(
          actionExtentRatio: 0.20,
          actionPane: const SlidableDrawerActionPane(),
          secondaryActions: [
            IconSlideAction(
              caption: 'Deletar',
              color: Colors.red,
              icon: Icons.delete,
              onTap: () {
                onDelete(todo);
              },
            )
          ],
          child: Container(
            padding: const EdgeInsets.all(6.0),
            //margin: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Color(0xffeadaf9),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      todo.title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w900),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: SelectableText(
                      todo.key,
                      style: const TextStyle(fontSize: 26),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
