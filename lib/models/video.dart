class Video {
  String videoId;
  String? videoThumbnailUrl;
  String? videoCategory;

  set setVideoId(videoId) => this.videoId = videoId;

  set setVideoThumbnailUrl(videoThumbnailUrl) =>
      this.videoThumbnailUrl = videoThumbnailUrl;

  set setVideoCategory(videoCategory) => this.videoCategory = videoCategory;

  Video(this.videoId, this.videoCategory, this.videoThumbnailUrl);

  @override
  String toString() {
    return 'ID: $videoId URL: $videoThumbnailUrl Categoria: $videoCategory';
  }
}
