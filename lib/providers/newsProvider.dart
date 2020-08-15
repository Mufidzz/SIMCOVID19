
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:simcovid19id/config/globalConfig.dart';
import 'package:simcovid19id/model/News.dart';
import 'package:http/http.dart' as http;


class NewsProvider extends ChangeNotifier{
  News newsModel;

  Future<News> fetchNews() async{
    String url = CONFIG.NEWS_URL;
    final response = await http.get(url);

    if(response.statusCode == 200){

      newsModel = News.fromJson(json.decode(response.body));

      return newsModel;
    }else{
      throw Exception('Failed to load user');
    }

  }
}