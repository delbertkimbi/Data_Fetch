import 'dart:convert';

import 'package:data_fetch/models/user.dart';
import 'package:http/http.dart' as http;

class DataService {
  Future<List<User>> getUsers() async {
    String url = "https://reqres.in/api/users";
    try{    var response = await http.get(Uri.parse(url));
    final json = jsonDecode(response.body) as List;
    final post = json.map((postJson) => User.fromJson(postJson)).toList();
    return post;
    } catch(e){
      (e);
      rethrow;
    }
  }
}
