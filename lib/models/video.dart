class Video {
  String videoId;
  String? videoThumbnailUrl;
  String? videoCategory;

  Video(this.videoId, this.videoCategory, this.videoThumbnailUrl);

  @override
  String toString() {
    return 'ID: $videoId URL: $videoThumbnailUrl Categoria: $videoCategory';
  }
}
