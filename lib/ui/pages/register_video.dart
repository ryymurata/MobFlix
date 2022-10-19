import 'package:flutter/material.dart';
import 'package:mobflix/ui/shared/action_button.dart';

class RegisterVideo extends StatefulWidget {
  const RegisterVideo({super.key});

  @override
  State<RegisterVideo> createState() => _RegisterVideoState();
}

class _RegisterVideoState extends State<RegisterVideo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(36, 36, 36, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildSectionTitle("Cadastre um vídeo"),
              const SizedBox(height: 32),
              _buildInput(inputName: "URL:", hintText: "Ex: N3h5A0oAzsk"),
              _buildInput(
                  inputName: "Categoria:", hintText: "Mobile, Front-end..."),
              _buildSectionTitle("Preview"),
              const SizedBox(height: 8),
              Image.asset("images/default_preview.png"),
              const SizedBox(height: 32),
              const ActionButton(
                  buttonText: "Cadastrar", buttonColor: Color(0xFF2478DF)),
            ],
          ),
        ),
      ),
    ));
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
          color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildInput({required String inputName, required String hintText}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              inputName,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            )),
        TextFormField(
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(hintText: hintText),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
