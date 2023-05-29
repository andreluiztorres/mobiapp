// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, unused_local_variable, file_names, depend_on_referenced_packages

import 'dart:convert';

import '../components/global.dart' as global;
import 'package:http/http.dart' as http;

class Logar {
  static Future<dynamic> postLogar(
      {required String senha, required String email}) async {
    var url = global.url;
    var body = json.encode({"email": email, "password": senha});

    final response = await http.post(
      Uri.parse('${url}auth/login'),
      headers: {
        "Content-Type": "application/json",
      },
      body: body,
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      global.email = data['user_data']['email'].toString();
      global.nome = data['user_data']['name'].toString();

      return data;
    } else {
      var data = json.decode(response.body);

      return null;
      //throw Exception(data);
    }
  }
}
