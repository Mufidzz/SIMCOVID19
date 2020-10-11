import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:simcovid19id/config/globalConfig.dart';
import 'package:simcovid19id/model/News.dart';
import 'package:http/http.dart' as http;

class NewsProvider extends ChangeNotifier {
  News newsModel;
  News newsModelLimit;

  Future<News> fetchNews(String token) async {
    String url = CONFIG.NEWS_URL;
    final response = await http.get(url, headers: {
      "token": token
    });

    if (response.statusCode == 200) {
      newsModel = News.fromJson(json.decode(response.body));

      return newsModel;
    } else {
      throw Exception('Failed to load user');
    }
  }

  Future<News> fetchNewsLimit(String token) async {
    String url = CONFIG.NEWS_LIMIT_URL;
    final response = await http.get(url, headers: {
      "token": token
    });

    if (response.statusCode == 200) {
      newsModelLimit = News.fromJson(json.decode(response.body));

      return newsModel;
    } else {
      throw Exception('Failed to load user');
    }
  }
}
