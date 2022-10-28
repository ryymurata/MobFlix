import 'package:flutter/material.dart';

class VideoUrlInput extends StatefulWidget {
  final String inputTitle;
  final String hintText;
  final TextEditingController controller;
  final void Function(String) onChanged;

  const VideoUrlInput(
      {super.key,
      required this.inputTitle,
      required this.hintText,
      required this.controller,
      required this.onChanged});

  @override
  State<VideoUrlInput> createState() => _VideoUrlInputState();
}

class _VideoUrlInputState extends State<VideoUrlInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              widget.inputTitle,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            )),
        TextFormField(
          controller: widget.controller,
          validator: _validateVideoUrl,
          maxLength: 11,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(hintText: widget.hintText),
          onChanged: widget.onChanged,
        ),
      ],
    );
  }

  String? _validateVideoUrl(value) {
    if (value!.isEmpty) {
      return 'Campo Obrigatório';
    } else if (value.length < 11) {
      return 'A url de um vídeo possui 11 caracteres';
    }

    return null;
  }
}
