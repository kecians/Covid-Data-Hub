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
    String url = "https://api.ukcovid19.in/api/patient/get_alloted_beds/";
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
      "active" : dec['alloted_beds']['total'],
      "migrated" : dec['patient_status']['migrated'],
      "recovered" : dec['patient_status']['recovered'],
      "death" : dec ['patient_status']['death']
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
    return stat['data'].last;
  }

  Future<dynamic>lastFiveStat(id)async{
    String url = "https://ayushbisht200121.pythonanywhere.com/api/health/details/$id/";
    var res = await http.get(Uri.parse(url));
    var stat = jsonDecode(res.body);
    print(stat['data']);
    return stat['data'];
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

  Future<dynamic>changePatientStatus(id,migratedto,migReason,deathReason,status)async {
    String url1 = 'https://ayushbisht200121.pythonanywhere.com/api/patient/change_patient_status/$id/';
    String url2 = 'https://ayushbisht200121.pythonanywhere.com/api/patient/patient_status/';

    if (status == 'Migrated')
     {
         var response1 = await http.patch(Uri.parse(url1),headers: {
           'content-type':'application/json',
         },body: jsonEncode({'patient_status': 'M' }));
         var response2 = await http.post(Uri.parse(url2),headers: {
           'content-type':'application/json',
         },
             body: jsonEncode({'patient_id': id, 'migrated_to' : migratedto , 'reason' : migReason}));
         var res = jsonDecode(response1.body);

         return res['status'];
     }

    else if(status == 'Death')
      {
        var response1 = await http.patch(Uri.parse(url1),headers: {
          'content-type':'application/json',
        },body: jsonEncode({'patient_status': 'D' }));
        var response2 = await http.post(Uri.parse(url2),headers: {
          'content-type':'application/json',
        },
            body: jsonEncode({'patient_id': id,'reason' : deathReason}));

        var res = jsonDecode(response1.body);

        return res['status'];
      }
    else if(status =='Recovered'){
      var response1 = await http.patch(Uri.parse(url1),headers: {
        'content-type':'application/json',
      },body: jsonEncode({'patient_status': 'R' }));

      var res = jsonDecode(response1.body);
      return res['status'];
    }

  }



  Future<dynamic> changePatientBed(id,bedtype,bedno) async{
    String url = "https://ayushbisht200121.pythonanywhere.com/api/patient/bed_allotment/";
    var bedtp;
    if(bedtype=='General Bed')
    {
      bedtp = '1';
    }
    else if(bedtype == 'Oxygen Bed')
    {
      bedtp = '2';
    }
    else if(bedtype == 'ICU Bed')
    {
      bedtp ='3';
    }
    else if(bedtype == 'Ventilators')
    {
      bedtp ='4';
    }
    var response = await http.post(Uri.parse(url),headers: {
      'content-type':'application/json',},body: jsonEncode({'patient_id':id,'bed_category':bedtp,'bed_number':bedno}));

    var res = jsonDecode(response.body);

    return res['status'];

  }

  Future<dynamic> getSearched(query)async{
    print('this is $query');
    String url = "https://ayushbisht200121.pythonanywhere.com/api/patient/get_searched_patients/$query/";

    var response = await http.get(Uri.parse(url));
    var res = jsonDecode(response.body);
    print(res);
    return res['data'];
  }

  Future<dynamic> getPatientProfile(id,phno)async{
    String url = "https://ayushbisht200121.pythonanywhere.com/api/patient/get_patient_profile/$id/";
    var response = await http.get(Uri.parse(url));
    var res = jsonDecode(response.body);
    if(res['status'] !=200)
      {
        return 400;
      }
    return res['data'];
  }

}

