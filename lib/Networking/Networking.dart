import 'dart:convert';
import 'package:http/http.dart' as http;
class Networking{
  Future<int> signin(username,password) async{
    String url = "https://ayushbisht200121.pythonanywhere.com/api/staff/login/";
    var response = await http.post( Uri.parse(url),headers: {
      'content-type':'application/json',
    },
      body:jsonEncode({'username': username , 'password': password}),
    );

    var dec = jsonDecode(response.body);
    print(dec['status']);

    return dec['status'];
  }
}