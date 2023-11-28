import 'package:eggs/widgets/linha_controle.dart';
import 'package:flutter/material.dart';
import 'package:eggs/models/choice_model.dart';
import 'package:eggs/models/todo_model.dart';
import 'package:eggs/repositories/todo_repository.dart';
import 'package:eggs/widgets/todo_list_item.dart';
import 'package:random_password_generator/random_password_generator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String newPassword = '';
  String digito = '8';
  String? errorText;
  List<Todo> todos = [];
  Todo? deletedTodo;
  int? deletedPos;
  bool _uppercase = true;
  bool _letters = true;
  bool _specialChar = true;
  bool _numbers = true;

  final password = RandomPasswordGenerator();
  final TodoRepository todoRepository = TodoRepository();
  final TextEditingController todoController = TextEditingController();

  List<Choices> choices = [
    Choices('Especiais', true),
    Choices('Números', true)
  ];

  double digits = 8;

  void _decrement() {
    if (digits >= 8) {
      setState(() {
        digits--;
      });
    }
  }

  void _increment() {
    if (digits <= 12) {
      setState(() {
        digits++;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    todoRepository.getTodoList().then((value) {
      setState(() {
        todos = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Wrap(
                  clipBehavior: Clip.none,
                  spacing: 5.0,
                  children: choices.map((c) {
                    return FilterChip(
                      backgroundColor: Color(0xffeadaf9),
                      label: Text(
                        c.choice,
                        style: const TextStyle(fontSize: 12),
                      ),
                      selected: c.isSelected,
                      onSelected: (bool selected) {
                        setState(() {
                          c.isSelected = !c.isSelected;
                        });
                      },
                    );
                  }).toList(),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Theme.of(context).primaryColor,
                  ),
                  width: 250,
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
                            )),
                        Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                            ),
                            width: 75,
                            height: 30,
                            child: Text(
                              digits.toString(),
                              style: const TextStyle(fontSize: 20),
                            )),
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
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextField(
                          autofocus: true,
                          controller: todoController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Adicione um ID',
                              hintText: 'Ex.:Flutter',
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent, width: 2)),
                              labelStyle:
                                  TextStyle(color: Colors.blueAccent)),
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          newPassword = getPassword(choices, _uppercase,
                              _letters, _specialChar, _numbers, digits);

                          String text = todoController.text;
                          if (text.isNotEmpty) {
                            Todo newTodo =
                                Todo(title: text, key: newPassword);
                            setState(() {
                              todos.add(newTodo);
                              errorText = '';
                            });
                          } else {
                            setState(() {
                              errorText = 'Deve digitar algo';
                            });
                            return;
                          }
                          todoController.clear();
                          todoRepository.saveTodoList(todos);
                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(30, 60),
                            backgroundColor: Theme.of(context).primaryColor),
                        child: const Icon(Icons.add,
                            color: Colors.white, size: 35),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Flexible(
                  child: ListView(
                    reverse: false,
                    shrinkWrap: true,
                    children: [
                      for (Todo todo in todos)
                        TodoListItem(todo: todo, onDelete: onDelete),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                LinhaControle(todos, deleteAll),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void deleteAll() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cuidado!!!'),
        content: const Text('Está certo disto???'),
        actions: [
          TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.grey),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancelar'),
          ),
          TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.grey),
            onPressed: () {
              Navigator.of(context).pop();
              deleteAllTodos();
            },
            child: const Text('Limpar tudo'),
          ),
        ],
      ),
    );
  }

  void deleteAllTodos() {
    setState(() {
      todos.clear();
    });
    todoRepository.saveTodoList(todos);
  }

  void onDelete(Todo todo) {
    deletedTodo = todo;
    deletedPos = todos.indexOf(todo);

    setState(() {
      todos.removeAt(deletedPos!);
    });
    todoRepository.saveTodoList(todos);

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Item removido'),
        action: SnackBarAction(
          label: 'Desfazer',
          onPressed: () {
            setState(() {
              todos.insert(deletedPos!, deletedTodo!);
            });
          },
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}

String getPassword(List<Choices> c, u, l, s, a, d) {
  String np;
  for (var n in c) {
    switch (n.choice) {
      case 'Maiúsculas':
        u = n.isSelected;
        break;
      case 'Minúsculas':
        l = n.isSelected;
        break;
      case 'Especiais':
        s = n.isSelected;
        break;
      case 'Números':
        a = n.isSelected;
        break;
    }
  }

  final exp1 = RegExp(r"[0-9]");
  final exp2 = RegExp(r"[\W|_]");
  final exp3 = RegExp(r"[a-z]");
  final exp4 = RegExp(r"[A-Z]");

  bool? valid1;
  bool? valid2;
  bool? valid3;
  bool? valid4;

  np = '';
  final pass = RandomPasswordGenerator();
  valid1 = a;
  valid2 = s;
  valid3 = l;
  valid4 = u;

  for (var i = 0; i < 200; i++) {
    np = pass.randomPassword(
        letters: l,
        numbers: a,
        passwordLength: d,
        specialChar: s,
        uppercase: u);

    if (exp1.hasMatch(np) != valid1 ||
        exp2.hasMatch(np) != valid2 ||
        exp3.hasMatch(np) != valid3 ||
        exp4.hasMatch(np) != valid4) {
      continue;
    } else {
      break;
    }
  }

  return np;
}
