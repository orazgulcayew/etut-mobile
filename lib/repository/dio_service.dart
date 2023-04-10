import 'package:dio/dio.dart';
import 'package:etut_mobile/repository/models/news.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

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
}
