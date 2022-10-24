import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final void Function() onPressed;
  final String buttonTitle;
  final Color buttonColor;
  const ActionButton({
    super.key,
    required this.formKey,
    required this.onPressed,
    required this.buttonTitle,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 48,
        child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
            child: Text(
              buttonTitle,
              style: const TextStyle(fontSize: 18),
            )));
  }
}
