class Video {
  String? videoThumbnailUrl;
  String? videoCategory;

  Video(this.videoCategory, this.videoThumbnailUrl);

  @override
  String toString() {
    return 'URL: $videoThumbnailUrl Categoria: $videoCategory';
  }
}
