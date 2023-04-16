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

  Future<List<News>?> getNews() async {
    try {
      final List<News> news = [];

      final Response response = await _dio.get(AppEndpoints.news);

      if (response.statusCode != 200) {
        return null;
      }

      for (var data in response.data["results"]) {
        news.add(News.fromJson(data));
      }

      return news;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<List<Research>?> getResearch() async {
    try {
      final List<Research> news = [];

      final Response response = await _dio.get(AppEndpoints.research);

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

      for (var data in response.data["results"]) {
        news.add(NewsCategory.fromJson(data));
      }

      return news;
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

      for (var data in response.data["results"]) {
        news.add(ResearchCategory.fromJson(data));
      }

      return news;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
