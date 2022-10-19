import 'package:flutter/material.dart';

class ActionButton extends StatefulWidget {
  final String buttonText;
  final Color buttonColor;
  const ActionButton(
      {super.key, required this.buttonText, required this.buttonColor});

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 48,
        child: ElevatedButton(
            onPressed: () {},
            style:
                ElevatedButton.styleFrom(backgroundColor: widget.buttonColor),
            child: Text(
              widget.buttonText,
              style: const TextStyle(fontSize: 18),
            )));
  }
}
