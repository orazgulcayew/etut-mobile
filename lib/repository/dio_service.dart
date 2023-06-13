import 'package:dio/dio.dart';
import 'package:etut_mobile/repository/models/news.dart';
import 'package:etut_mobile/repository/models/research.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'models/faculty.dart';

class DioService {
  static const receiveTimeout = 2 * 60 * 1000;
  static const connectTimeout = 2 * 60 * 1000;

  static String getImage(String link) => "${AppEndpoints.url}$link";

  DioService()
      : _dio = Dio(BaseOptions(
            baseUrl: AppEndpoints.url,
            connectTimeout: const Duration(milliseconds: connectTimeout),
            receiveTimeout: const Duration(milliseconds: receiveTimeout)));

  late final Dio _dio;

  Future<List<News>?> getNews(
      {toHome = "Unknown", category, int? page, q}) async {
    try {
      final List<News> news = [];
      late Response response;
      if (toHome != null) {
        response = await _dio.get(AppEndpoints.news,
            queryParameters: {"to_home": toHome, "q": q});
      } else {
        response = await _dio.get(AppEndpoints.news,
            queryParameters: {"news_category": category, "page_size": page});
      }

      if (response.statusCode != 200) {
        return null;
      }

      if (response.data["results"] != null) {
        for (var data in response.data["results"]) {
          news.add(News.fromJson(data));
        }
      }

      return news;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<List<Research>?> getResearch({categoryId, page}) async {
    try {
      final List<Research> news = [];

      final Response response = await _dio.get(AppEndpoints.research,
          queryParameters: {
            "research_category": categoryId,
            "page_size": page
          });

      if (response.statusCode != 200) {
        return null;
      }

      for (var data in response.data["results"]) {
        news.add(Research.fromJson(data));
      }

      return news;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<List<Faculty>?> getFaculties() async {
    try {
      final List<Faculty> news = [];

      final Response response = await _dio.get(AppEndpoints.faculty);

      if (response.statusCode != 200) {
        return null;
      }

      for (var data in response.data) {
        news.add(Faculty.fromJson(data));
      }

      return news;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<List<NewsCategory>?> getNewsCategories() async {
    try {
      final List<NewsCategory> news = [];

      final Response response = await _dio.get(AppEndpoints.newsCat);

      if (response.statusCode != 200) {
        return null;
      }

      for (var data in response.data) {
        news.add(NewsCategory.fromJson(data));
      }

      return news;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<List<dynamic>?> getTeachers() async {
    try {
      final Response response = await _dio.get(AppEndpoints.teachers);

      if (response.statusCode != 200) {
        return null;
      }

      return response.data;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<List<dynamic>?> getStudents() async {
    try {
      final Response response = await _dio.get("/graduates/students/");

      if (response.statusCode != 200) {
        return null;
      }

      return response.data;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<List<dynamic>?> getGraduates() async {
    try {
      final Response response = await _dio.get("/graduates/graduates/");

      if (response.statusCode != 200) {
        return null;
      }

      return response.data;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<List<dynamic>?> getCourses() async {
    try {
      final Response response = await _dio.get("/course/courses/");

      if (response.statusCode != 200) {
        return null;
      }

      return response.data;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<List<dynamic>?> getBooks() async {
    try {
      final Response response = await _dio.get("/course/books/");

      if (response.statusCode != 200) {
        return null;
      }

      return response.data;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<List<ResearchCategory>?> getResearchCategories() async {
    try {
      final List<ResearchCategory> news = [];

      final Response response = await _dio.get(AppEndpoints.researchCat);

      if (response.statusCode != 200) {
        return null;
      }

      for (var data in response.data) {
        news.add(ResearchCategory.fromJson(data));
      }

      return news;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
