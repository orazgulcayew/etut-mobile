import 'package:etut_mobile/repository/models/news.dart';

class Research {
  final int id;
  final String title;
  final String body;
  final String researcher;
  final ResearchCategory researchCategory;
  final List<ImageFile> images;
  final List<Video> videos;
  final List<File> files;

  Research({
    required this.id,
    required this.title,
    required this.body,
    required this.researcher,
    required this.researchCategory,
    required this.images,
    required this.videos,
    required this.files,
  });

  factory Research.fromJson(Map<String, dynamic> json) {
    final researchCategoryJson =
        json['research_category'] as Map<String, dynamic>;
    List<dynamic> imageList = json['images'];
    List<dynamic> videoList = json['videos'];
    List<dynamic> fileList = json['files'];
    return Research(
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
      researcher: json['researcher'] as String,
      researchCategory: ResearchCategory.fromJson(researchCategoryJson),
      images:
          imageList.map((imageJson) => ImageFile.fromJson(imageJson)).toList(),
      videos: videoList.map((videoJson) => Video.fromJson(videoJson)).toList(),
      files: fileList.map((fileJson) => File.fromJson(fileJson)).toList(),
    );
  }
}

class ResearchCategory {
  final int id;
  final String title;

  ResearchCategory({
    required this.id,
    required this.title,
  });

  factory ResearchCategory.fromJson(Map<String, dynamic> json) {
    return ResearchCategory(
      id: json['id'] as int,
      title: json['title'] as String,
    );
  }
}
