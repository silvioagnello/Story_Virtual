import 'package:eggs/models/choice_model.dart';
import 'package:flutter/material.dart';

List<Choices> choices = [
  Choices('Maíusculas', false),
  Choices('Minúsculas', false),
  Choices('Especiais', false),
  Choices('Números', false)
];

class ChoicesWidget extends StatefulWidget {
  const ChoicesWidget({super.key});

  @override
  State<ChoicesWidget> createState() => _ChoicesWidgetState();
}

class _ChoicesWidgetState extends State<ChoicesWidget> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      clipBehavior: Clip.none,
      spacing: 5.0,
      children: choices.map((c) {
        return FilterChip(
          backgroundColor: Colors.cyan,
          label: Text(
            c.choice,
            style: const TextStyle(fontSize: 12),
          ),
          selected: !c.isSelected,
          onSelected: (bool selected) {
            setState(() {
              c.isSelected = !c.isSelected;
            });
          },
        );
      }).toList(),
    );
  }
}
