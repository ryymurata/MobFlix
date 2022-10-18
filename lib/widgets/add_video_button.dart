import 'package:flutter/material.dart';

class AddVideoButton extends StatefulWidget {
  final void Function()? onPressed;
  const AddVideoButton({super.key, required this.onPressed});

  @override
  State<AddVideoButton> createState() => _AddVideoButtonState();
}

class _AddVideoButtonState extends State<AddVideoButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18, bottom: 18),
      child: SizedBox(
        width: 52,
        height: 52,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: const Color(0xFF7B61FF),
            onPressed: widget.onPressed,
            child: const Icon(
              Icons.add,
              size: 39,
            ),
          ),
        ),
      ),
    );
  }
}
