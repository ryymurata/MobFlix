import 'package:mobflix/utils/keys.dart';
import 'package:http/http.dart';
import 'dart:convert';

class ApiService {
  final String _baseUrl = "https://www.googleapis.com/youtube/v3";

  Future<String> fetchThumbnailUrl(String videoId) async {
    Uri uri =
        Uri.parse("$_baseUrl/videos?key=$API_KEY&part=snippet&id=$videoId");

    Response response = await get(uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      if (data["pageInfo"]["totalResults"] > 0) {
        return data["items"][0]["snippet"]["thumbnails"]["medium"]["url"];
      } else {
        throw Exception("No video Found");
      }
    } else {
      throw Exception("Failed to find video: ${response.body}");
    }
  }
}
