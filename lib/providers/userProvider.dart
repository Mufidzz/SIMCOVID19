import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:simcovid19id/config/globalConfig.dart';
import 'package:simcovid19id/model/User.dart';

class UserProvider extends ChangeNotifier{
  Future<User> fetchUser(String id) async{
    String url = CONFIG.API_URL+'/user/$id';
    print(url);
    final response = await http.get(url);

    if(response.statusCode == 200){
      print(response.body);
      return User.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load user');
    }

  }
}