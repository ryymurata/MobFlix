import 'package:flutter/material.dart';
import 'package:mobflix/models/video.dart';
import 'package:mobflix/services/api_service.dart';
import 'package:mobflix/ui/pages/VideoForm/widgets/category_selection.dart';
import 'package:mobflix/ui/pages/VideoForm/widgets/section_title.dart';
import 'package:mobflix/ui/pages/VideoForm/widgets/url_input.dart';
import 'package:mobflix/ui/shared/action_button.dart';
import 'package:mobflix/ui/shared/video_card.dart';
import 'package:mobflix/utils/tag_colors.dart';

class VideoForm extends StatefulWidget {
  const VideoForm({super.key});

  @override
  State<VideoForm> createState() => _VideoFormState();
}

final List<String> categories =
    ["Selecione uma Categoria"] + TagColors.tagColors.keys.toList();

class _VideoFormState extends State<VideoForm> {
  ApiService service = ApiService();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _videoUrlController = TextEditingController();
  String _dropDownValue = categories.first;

  String? _videoThumbnailUrl;
  String? _videoCategory;
  bool isValidUrl = false;

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
                const SectionTitle(title: "Cadastre um vídeo"),
                const SizedBox(height: 32),
                VideoUrlInput(
                  inputTitle: "URL:",
                  hintText: "Ex: N3h5A0oAzsk",
                  controller: _videoUrlController,
                  onChanged: _getVideoThumb,
                  isValidUrl: isValidUrl,
                ),
                const SizedBox(height: 32),
                CategorySelection(
                    dropDownValue: _dropDownValue,
                    categories: categories,
                    onChanged: _selectCategory),
                const SizedBox(height: 32),
                const SectionTitle(title: "Preview"),
                const SizedBox(height: 8),
                (_videoCategory != null) && (_videoThumbnailUrl != null)
                    ? VideoCard(
                        video: Video(_videoCategory, _videoThumbnailUrl))
                    : Image.asset("images/default_preview.png"),
                const SizedBox(height: 32),
                ActionButton(
                  formKey: _formKey,
                  buttonTitle: "Cadastrar",
                  buttonColor: const Color(0xFF2478DF),
                  onPressed: saveVideo,
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  void _getVideoThumb(value) {
    if (value.length == 11) {
      Future<String?> futureVideoThumbURL = service.fetchThumbnailUrl(value);

      futureVideoThumbURL.then((value) {
        if (value != null) {
          setState(() {
            _videoThumbnailUrl = value;
            isValidUrl = true;
          });
        } else {
          setState(() {
            isValidUrl = false;
          });
        }
      });
    } else {
      setState(() {
        _videoThumbnailUrl = null;
      });
    }
  }

  void _selectCategory(value) {
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
  }

  void saveVideo() {
    if (_formKey.currentState!.validate()) {
      if (_videoCategory != null && _videoCategory != null) {
        final video = Video(_videoCategory, _videoThumbnailUrl);
        Navigator.pop(context, video);
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vídeo adicionado!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Falha ao adicionar vídeo')),
      );
    }
  }
}
