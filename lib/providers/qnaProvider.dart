import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:simcovid19id/config/globalConfig.dart';
import 'package:simcovid19id/model/Qna.dart';
import 'package:http/http.dart' as http;

class QnaProvider extends ChangeNotifier {
  Qna QnaModel;

  Future<Qna> fetchQna() async {
    String url = CONFIG.QNA_URL;
    final response = await http.get(url);
    if (response.statusCode == 200) {
      QnaModel = Qna.fromJson(json.decode(response.body));

      return QnaModel;
    } else {
      throw Exception('Failed to load user');
    }
  }
}
