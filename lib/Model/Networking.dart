import 'dart:convert';
import 'package:http/http.dart' as http;
class Networking{
  Future<List> signin(username,password) async{
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
    return val['data'];
  }
  Future<dynamic>lastStat(id)async{
    String url = "https://ayushbisht200121.pythonanywhere.com/api/health/details/$id/";
    var res = await http.get(Uri.parse(url));
    var stat = jsonDecode(res.body);
     print(stat['data']);
    return stat['data'][0];
  }

  Future<dynamic> HealthUpdate(_token,pat_id,sys,dia,pulse,temp,spo2,condition) async
  {  String cond;
    if(condition == 'Asymptomatic') { cond = "1"; }
    else if(condition == 'Mild') {cond = "2";}
    else if(condition == 'Moderate') {cond = "3";}
    else if(condition == 'Severe') {cond = "4";}
    String url = "https://ayushbisht200121.pythonanywhere.com/api/health/update/";
    var response = await http.post(Uri.parse(url),
      headers: {'content-type':'application/json','Authorization' : "Token $_token"},
      body: jsonEncode({"username":pat_id ,"patient_condition": cond,"oxy_level":spo2,"pulse_rate":pulse
        ,"blood_pres_systolic":sys , "blood_pres_diastolic" : dia ,"temperature" : temp}),);
    var res = jsonDecode(response.body);
    print(res);
    return res['status'];
  }
  Future<dynamic> AddPatient(_token,name,age,gender,bed_cat,bedNo,phno,condition,address) async
  {
    String cond;
    if(condition == 'Asymptomatic') { cond = "1"; }
    else if(condition == 'Mild') {cond = "2";}
    else if(condition == 'Moderate') {cond = "3";}
    else if(condition == 'Severe') {cond = "4";}
    String bedCat;
    if(bed_cat == 'General Bed') { bedCat = "1"; }
    else if(bed_cat == 'Oxygen Bed') {bedCat = "2";}
    else if(bed_cat == 'ICU Bed') {bedCat = "3";}
    else if(bed_cat == 'Ventilators') {bedCat = "4";}
    
    String url = "https://ayushbisht200121.pythonanywhere.com/api/patient/admit/";
    
    var response = await http.post(Uri.parse(url),
    headers:{'content-type':'application/json','Authorization' : "Token $_token"},
    body: jsonEncode({"name":name,"age":age, "gender": gender, "bed_category": bedCat,
      "bed_number":bedNo,"contact_number":phno,"health_condition":cond,"address":address}));
    var res = jsonDecode(response.body);
    print("this ${res}");
    return res['status'];

  }
}