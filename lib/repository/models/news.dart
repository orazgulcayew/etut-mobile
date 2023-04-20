class News {
  final int id;
  final String title;
  final String body;
  final String linkTitle;
  final String link;
  final dynamic views;
  final NewsCategory newsCategory;
  final List<ImageFile> images;
  final List<Video> videos;
  final List<File> files;

  News({
    required this.id,
    required this.title,
    required this.body,
    required this.linkTitle,
    required this.link,
    required this.views,
    required this.newsCategory,
    required this.images,
    required this.videos,
    required this.files,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    List<dynamic> imageList = json['images'];
    List<dynamic> videoList = json['videos'];
    List<dynamic> fileList = json['files'];
    return News(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      linkTitle: json['link_title'],
      link: json['link'],
      views: json['views'],
      newsCategory: NewsCategory.fromJson(json['news_category']),
      images:
          imageList.map((imageJson) => ImageFile.fromJson(imageJson)).toList(),
      videos: videoList.map((videoJson) => Video.fromJson(videoJson)).toList(),
      files: fileList.map((fileJson) => File.fromJson(fileJson)).toList(),
    );
  }
}

class NewsCategory {
  final int id;
  final String title;

  NewsCategory({
    required this.id,
    required this.title,
  });

  factory NewsCategory.fromJson(Map<String, dynamic> json) {
    return NewsCategory(
      id: json['id'],
      title: json['title'],
    );
  }
}

class ImageFile {
  final int id;
  final String title;
  final String source;
  final int news;

  ImageFile({
    required this.id,
    required this.title,
    required this.source,
    required this.news,
  });

  factory ImageFile.fromJson(Map<String, dynamic> json) {
    return ImageFile(
      id: json['id'],
      title: json['title'],
      source: json['source'],
      news: json['news'],
    );
  }
}

class Video {
  final int id;
  final String title;
  final String source;
  final int news;

  Video({
    required this.id,
    required this.title,
    required this.source,
    required this.news,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json['id'],
      title: json['title'],
      source: json['source'],
      news: json['news'],
    );
  }
}

class File {
  final int id;
  final String title;
  final String source;
  final int news;

  File({
    required this.id,
    required this.title,
    required this.source,
    required this.news,
  });

  factory File.fromJson(Map<String, dynamic> json) {
    return File(
      id: json['id'],
      title: json['title'],
      source: json['source'],
      news: json['news'],
    );
  }
}
