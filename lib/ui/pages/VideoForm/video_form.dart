import 'package:flutter/material.dart';
import 'package:mobflix/models/video.dart';
import 'package:mobflix/provider/video_provider.dart';
import 'package:mobflix/services/api_service.dart';
import 'package:mobflix/ui/pages/VideoForm/widgets/category_selection.dart';
import 'package:mobflix/ui/shared/section_title.dart';
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
  bool editMode = false; // provisório
  Video? editVideo;

  bool aux = true;

  @override
  void didChangeDependencies() {
    if (aux) {
      if (ModalRoute.of(context)!.settings.arguments != null) {
        editVideo = ModalRoute.of(context)!.settings.arguments as Video;
        setState(() {
          editMode = true;
        });
      } else {
        editVideo = null;
      }

      if (editMode && editVideo != null) {
        _videoUrlController.text = editVideo!.videoId;
        _dropDownValue =
            categories[categories.indexOf(editVideo!.videoCategory as String)];
      } else {
        _dropDownValue = categories.first;
      }

      aux = false;
    }
    super.didChangeDependencies();
  }

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
                        video: Video(_videoUrlController.text, _videoCategory,
                            _videoThumbnailUrl))
                    : Image.asset("images/default_preview.png"),
                const SizedBox(height: 32),
                editMode
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ActionButton(
                            buttonTitle: "Alterar",
                            buttonColor: const Color(0xFF2478DF),
                            onPressed: () => saveVideo(
                                'Vídeo Alterado!', 'Falha ao alterar vídeo'),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          ActionButton(
                            buttonTitle: "Remover",
                            buttonColor: const Color(0xFFD82D2D),
                            onPressed: () => deleteVideo(editVideo!.videoId),
                          ),
                        ],
                      )
                    : ActionButton(
                        buttonTitle: "Cadastrar",
                        buttonColor: const Color(0xFF2478DF),
                        onPressed: () => saveVideo(
                            'Vídeo Adicionado!', 'Falha ao adicionar vídeo'),
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

  void saveVideo(String succcessMessage, String errorMessage) {
    if (_formKey.currentState!.validate()) {
      if (_videoCategory != null && _videoCategory != null) {
        final video =
            Video(_videoUrlController.text, _videoCategory, _videoThumbnailUrl);
        Navigator.pop(context, video);
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(succcessMessage)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    }
  }

  void deleteVideo(videoId) {
    final videoProvider = VideoProvider.of(context);

    setState(() {
      videoProvider!.videos
          .removeWhere((element) => element.videoId == videoId);
    });
    Navigator.pop(context);
  }
}
