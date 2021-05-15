import 'dart:convert';
import 'package:http/http.dart' as http;
class Networking{
  Future<dynamic> signin(username,password) async{
    String url = "https://ayushbisht200121.pythonanywhere.com/api/staff/login/";
    var response = await http.post( Uri.parse(url),headers: {
      'content-type':'application/json',
    },
      body:jsonEncode({'username': username , 'password': password}),
    );
    var dec = jsonDecode(response.body);

    if(dec['status']!=200)
      {
        var list = [dec['status'],dec['message']];
        return list;
      }
    var list =[dec['status'],dec['data']['staff_category'],dec['data']['username'],dec['data']['token']];
    print(list);
    return list;
  }

  Future<Map> getBedStatus() async{
    String url = "https://ayushbisht200121.pythonanywhere.com/api/patient/get_alloted_beds/";
    var response = await http.get(Uri.parse(url));
    var dec = jsonDecode(response.body);
    var data = {
      "allotedTotal" : dec['alloted_beds']['total'],
      "totalBeds" : dec['total_beds']['total'],
      "generalBeds" : dec['total_beds']['general'],
      "oxygenBeds" : dec['total_beds']['oxygen'],
      "icuBeds" : dec['total_beds']['icu'],
      "ventilatorBeds" : dec['total_beds']['ventillator'],
      "statusCode" : dec['status'],
      "allotedGenBeds" : dec['alloted_beds']['general'],
      "allotedOxyBeds" : dec['alloted_beds']['oxygen'],
      "allotedVenBeds" : dec['alloted_beds']['ventillator'],
      "allotedIcuBeds" : dec['alloted_beds']['icu'],
    };
    return data;
  }

  Future<dynamic> getPatientList(_token) async{
    String url = "https://ayushbisht200121.pythonanywhere.com/api/patient/admit/";
    var response = await http.get(Uri.parse(url),headers: {
      'content-type':'application/json','Authorization' : "Token $_token"});
    var val = jsonDecode(response.body);
    print(val);

    return val;
  }


}