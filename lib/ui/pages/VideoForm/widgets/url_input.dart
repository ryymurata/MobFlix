import 'package:flutter/material.dart';

class VideoUrlInput extends StatelessWidget {
  final String inputTitle;
  final String hintText;
  final TextEditingController controller;
  final void Function(String) onChanged;
  final bool isValidUrl;
  const VideoUrlInput(
      {super.key,
      required this.inputTitle,
      required this.hintText,
      required this.controller,
      required this.onChanged,
      required this.isValidUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              inputTitle,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            )),
        TextFormField(
          controller: controller,
          validator: _validateVideoUrl,
          maxLength: 11,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(hintText: hintText),
          onChanged: onChanged,
        ),
      ],
    );
  }

  String? _validateVideoUrl(value) {
    if (value!.isEmpty) {
      return 'Campo Obrigatório';
    } else if (value.length < 11) {
      return 'A url de um vídeo possui 11 caracteres';
    } else if (!isValidUrl) {
      return 'Url de vídeo inválida';
    }

    return null;
  }
}
