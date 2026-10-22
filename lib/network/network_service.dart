import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app/common/app_colors.dart';
import 'package:news_app/common/app_consts.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/source_model.dart';
import 'package:news_app/network/endpoints.dart';

class NetworkService {
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: AppConsts.baseUrl,
      queryParameters: {"apiKey": AppConsts.apiKey},
    ),
  );
  static Future<List<Sources>?> getSources(String category) async {
    Response response = await dio.get(
      Endpoints.sourcesEndpoint,
      queryParameters: {"category": category},
    );
    log(
      'Api--->${AppConsts.baseUrl}+${Endpoints.sourcesEndpoint}---\nqueryParameters:${{"category": category}}\nMethod:--->Get',
    );

    if (response.statusCode == 200 &&
        response.data != null &&
        response.data['status'].toString().toLowerCase() == 'ok') {
      log('---SUCCESS---');
      SourceModel sourceModel = SourceModel.fromJson(response.data);
      return sourceModel.sources;
    }
  }

  static Future<List<Articles>?> gerArticles(String sourceId) async {
    Response response = await dio.get(
      Endpoints.articlesEndpoint,
      queryParameters: {"sources": sourceId},
    );
    log(
      'Api--->${AppConsts.baseUrl}+${Endpoints.articlesEndpoint}---\nqueryParameters:${{"sources": sourceId}}\nMethod:--->Get',
    );
    if (response.statusCode == 200 &&
        response.data != null &&
        response.data['status'].toString().toLowerCase() == 'ok') {
      log('---SUCCESS---');
      ArticleModel articleModel=  ArticleModel.fromJson(response.data);
      return articleModel.articles;
    }
  }
}
