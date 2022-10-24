import 'package:flutter/material.dart';
import 'package:mobflix/models/video.dart';
import 'package:mobflix/services/api_service.dart';
import 'package:mobflix/ui/shared/action_button.dart';
import 'package:mobflix/ui/shared/video_card.dart';
import 'package:mobflix/utils/tag_colors.dart';

class RegisterVideo extends StatefulWidget {
  const RegisterVideo({super.key});

  @override
  State<RegisterVideo> createState() => _RegisterVideoState();
}

final List<String> tagOptions =
    ["Selecione uma Categoria"] + TagColors.tagColors.keys.toList();

class _RegisterVideoState extends State<RegisterVideo> {
  ApiService service = ApiService();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _videoUrl = TextEditingController();
  String _dropDownValue = tagOptions.first;

  String? _videoThumbnailUrl;
  String? _videoCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(36, 36, 36, 0),
        child: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildSectionTitle("Cadastre um vídeo"),
                const SizedBox(height: 32),
                _buildInput(inputName: "URL:", hintText: "Ex: N3h5A0oAzsk"),
                _buildCategoryDropDownButton(),
                const SizedBox(height: 32),
                _buildSectionTitle("Preview"),
                const SizedBox(height: 8),

                // Adicionar condicao aqui

                (_videoCategory != null) && (_videoThumbnailUrl != null)
                    ? VideoCard(
                        video: Video(_videoCategory, _videoThumbnailUrl))
                    : Image.asset("images/default_preview.png"),
                const SizedBox(height: 32),
                ActionButton(
                    buttonText: "Cadastrar",
                    buttonColor: const Color(0xFF2478DF),
                    formKey: _formKey),
              ],
            ),
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
          controller: _videoUrl,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Campo Obrigatório';
            } else if (value.length < 11) {
              return 'A url de um vídeo possui 11 caracteres';
            }

            return null;
          },
          maxLength: 11,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(hintText: hintText),
          onChanged: (value) {
            if (value.length == 11) {
              Future<String> futureVideoThumbURL =
                  service.fetchThumbnailUrl(value);

              futureVideoThumbURL.then((value) {
                setState(() {
                  _videoThumbnailUrl = value;
                });
              });
            } else {
              setState(() {
                _videoThumbnailUrl = null;
              });
            }
          },
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildCategoryDropDownButton() {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xFF275FA3),
          borderRadius: BorderRadius.circular(8)),
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButtonFormField(
            validator: (value) {
              return value == "Selecione uma Categoria"
                  ? 'Selecione uma categoria válida'
                  : null;
            },
            value: _dropDownValue,
            isExpanded: true,
            items: tagOptions
                .map((String value) =>
                    DropdownMenuItem(value: value, child: Text(value)))
                .toList(),
            onChanged: (value) {
              if (value != "Selecione uma Categoria") {
                setState(() {
                  _dropDownValue = value!;
                  _videoCategory = value;
                });
              } else {
                setState(() {
                  _dropDownValue = value!;
                  _videoCategory = null;
                });
              }
            },
            dropdownColor: const Color(0xFF275FA3),
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
