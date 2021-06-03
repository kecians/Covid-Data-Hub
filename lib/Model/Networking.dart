import 'dart:convert';
import 'package:http/http.dart' as http;
class Networking{


  Future<List> signin(username,password) async{
    String url = "https://api.ukcovid19.in/api/staff/login/";
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
      "death" : dec ['patient_status']['death'],
      "home_isolated" : dec['patient_status']['home_isolated']

    };
    return data;
  }


  Future<dynamic> getPatientList(_token) async{
    String url = "https://api.ukcovid19.in/api/patient/admit/";
    var response = await http.get(Uri.parse(url),headers: {
      'content-type':'application/json','Authorization' : "Token $_token"});
    var val = jsonDecode(response.body);
    return val['data'];
  }


  Future<dynamic>lastStat(id)async{
    String url = "https://api.ukcovid19.in/api/health/details/$id/";
    var res = await http.get(Uri.parse(url));
    var stat = jsonDecode(res.body);
     print(stat['data']);
    return stat['data'].last;
  }

  Future<dynamic>lastFiveStat(id)async{
    String url = "https://api.ukcovid19.in/api/health/details/$id/";
    var res = await http.get(Uri.parse(url));
    var stat = jsonDecode(res.body);
    print(stat['data']);
    return stat['data'];
  }
  Future<dynamic> HealthUpdate(_token,pat_id,sys,dia,pulse,temp,spo2,condition,resRate) async
  {  String cond;
    if(condition == 'Asymptomatic') { cond = "1"; }
    else if(condition == 'Mild') {cond = "2";}
    else if(condition == 'Moderate') {cond = "3";}
    else if(condition == 'Severe') {cond = "4";}
    String url = "https://api.ukcovid19.in/api/health/update/";
    var response = await http.post(Uri.parse(url),
      headers: {'content-type':'application/json','Authorization' : "Token $_token"},
      body: jsonEncode({"username":pat_id ,"patient_condition": cond,"oxy_level":spo2,"pulse_rate":pulse
        ,"blood_pres_systolic":sys , "blood_pres_diastolic" : dia ,"temperature" : temp,'respiration_rate':resRate}),);
    var res = jsonDecode(response.body);
    print(res);
    return res['status'];
  }


  Future<dynamic> AddPatient(_token,name,age,gender,bed_cat,bedNo,phno,condition,address,
      ward,floor,isTested,testType,testResult,isVaccinated,nameVaccine,numDose,frstDate,secDate,remark,admissionType) async
  {
    String wardSelected;
    if(ward =='A'){wardSelected = 'A';}
    else if(ward == 'B'){wardSelected = 'B';}
    else if(ward == 'Obs & Gynae'){wardSelected = 'OG';}
    else if(ward == 'Paediatric'){wardSelected = 'P';}
    else if(ward == "Select Ward"){wardSelected = 'A';}

    String admission;
    if(admissionType == 'Home Isolation'){admission = 'H';}
    else if(admissionType == 'Hospitalization'){admission = 'A';}
    String cond;
    if(condition == 'Asymptomatic') { cond = "1";}
    else if(condition == 'Mild') {cond = "2";}
    else if(condition == 'Moderate') {cond = "3";}
    else if(condition == 'Severe') {cond = "4";}
    else if(condition=="Condition"){cond = '1';}
    String bedCat;
    if(bed_cat == 'General Bed') {bedCat = "1";}
    else if(bed_cat == 'Oxygen Bed') {bedCat = "2";}
    else if(bed_cat == 'ICU Bed') {bedCat = "3";}
    else if(bed_cat == 'Ventilators') {bedCat = "4";}

    String fst = frstDate.toString().substring(0,10);
    String sec = secDate.toString().substring(0,10);
    var vaccineState;
    if(numDose == '1st Dose')
      {   if(nameVaccine == 'CoviShield')
        {
           vaccineState =[
             {
               "type" : '1',
               "vaccinated_on" :  fst
             }
           ];
        }
        else if(nameVaccine == 'Covaxin')
          {
            vaccineState =[
              {
                "type" : '2',
                "vaccinated_on" :  fst
              }
            ];
          }

      }
    else if(numDose == '1st and 2nd Dose')
      {
        if(nameVaccine == 'CoviShield')
        {
          vaccineState =[
            {
              "type" : '1',
              "vaccinated_on" :  fst
            },
            {
              "type" : '1',
              "vaccinated_on" :  sec
            }

          ];
        }
        else if(nameVaccine == 'Covaxin')
        {
          vaccineState =[
            {
              "type" : '2',
              "vaccinated_on" :  fst
            },
            {
              "type" : '2',
              "vaccinated_on" :  sec
            }
          ];
        }
      }

    String covidSta='S',result;
    if(testResult == 'Positive'){covidSta = 'P';
      result = '1';}
    else if(testResult == 'Negative'){covidSta = 'N';
    result = '2';}
    else if(testResult == 'Awaited'){covidSta = 'A';
    result = '3';}
    else if(testResult == 'Rejected'){covidSta = 'R';
    result = '4';}
    else if(testResult =="Test Result"){covidSta ='P'; result ='1';}
    String testTyp;
    if( testType == 'Rapid AntiGen'){testTyp = '1';}
    else if( testType == 'RT-PCR'){testTyp = '2';}
    else if( testType =='TrueNat'){testTyp = '3';}
    else if(testType =="Test Type"){testTyp = '1';}
    bool isTest;
    if( isTested == 'Yes'){isTest = true; }
    else if(isTested =='No'){isTest = false; testTyp='3'; result='4';}

    bool isVac;
    if( isVaccinated == 'Yes'){isVac = true;}
    else if(isVaccinated == 'No'){isVac = false; vaccineState = null;}

    var patBed;
   if(admission == 'H'){ patBed ={};}
   else if(admission == 'A'){patBed = {
     'bed_number' : bedNo, 'bed_category': bedCat, 'ward':wardSelected,'floor':floor
   };}

     var covidTest = {
  'is_tested' : isTest,
  'type' : testTyp,
  'result' : result};

    var vacStat = {
      'is_vaccinated' : isVac , 'vaccine_status' : vaccineState
    };

    var eData = {
      "name":name,"age":age, "gender": gender,"contact_number":phno,
      "health_condition":cond,"address":address,"covid_status":covidSta,"remark":remark,'patient_status' : admission,
      'patient_bed': patBed, 'patient_covid_test' : covidTest , 'patient_vaccine_status' : vacStat
    };

    String url = "https://api.ukcovid19.in/api/patient/admit/";
    
    var response = await http.post(Uri.parse(url),
    headers:{'content-type':'application/json','Authorization' : "Token $_token"},
    body: jsonEncode(eData));
    var res = jsonDecode(response.body);
    print("this is the ${res}");
    return res['status'];
  }

  Future<dynamic>changePatientStatus(id,migratedto,migReason,deathReason,status,deathDate,bed_cat,bedNo,ward,floor)async {
    String url1 = 'https://api.ukcovid19.in/api/patient/change_patient_status/$id/';
    String url2 = 'https://api.ukcovid19.in/api/patient/patient_migrate_status/';
    String url3 = 'https://api.ukcovid19.in/api/patient/patient_death_status/';

    String wardSelected;
    if(ward =='A'){wardSelected = 'A';}
    else if(ward == 'B'){wardSelected = 'B';}
    else if(ward == 'Obs & Gynae'){wardSelected = 'OG';}
    else if(ward == 'Paediatric'){wardSelected = 'P';}

    String bedCat;
    if(bed_cat == 'General Bed') {bedCat = "1";}
    else if(bed_cat == 'Oxygen Bed') {bedCat = "2";}
    else if(bed_cat == 'ICU Bed') {bedCat = "3";}
    else if(bed_cat == 'Ventilators') {bedCat = "4";}


    String deathDated = deathDate.toString().substring(0,10);
    if (status == 'Referred')
     {   var response1 = await http.patch(Uri.parse(url1),headers: {
           'content-type':'application/json',
         },body: jsonEncode({'patient_status': 'M' }));
         var response2 = await http.post(Uri.parse(url2),headers: {
           'content-type':'application/json',
         },
             body: jsonEncode({'patient_id': id, 'migrated_to' : migratedto , 'reason' : migReason}));
         var res = jsonDecode(response1.body);

         return res['status'];  }

    else if(status == 'Death')
      { var response1 = await http.patch(Uri.parse(url1),headers: {
          'content-type':'application/json',
        },body: jsonEncode({'patient_status': 'D' }));
        var response3 = await http.post(Uri.parse(url3),headers: {
          'content-type':'application/json',
        },
            body: jsonEncode({'patient_id': id,'reason' : deathReason, 'expired_on' : deathDated,'patient_bed': {}}));

        var res = jsonDecode(response1.body);
           print("Wait here ${response3.body}");
        return res['status']; }
    else if(status =='Recovered'){
      var response1 = await http.patch(Uri.parse(url1),headers: {
        'content-type':'application/json',
      },body: jsonEncode({'patient_status': 'R' ,'patient_bed': {} }));

      var res = jsonDecode(response1.body);
      return res['status'];
    }
    else if(status =='Home Isolation'){
      var response1 = await http.patch(Uri.parse(url1),headers: {
        'content-type':'application/json',
      },body: jsonEncode({'patient_status': 'H' ,'patient_bed': {}}));

      var res = jsonDecode(response1.body);
      return res['status'];
    }
    else if(status == 'Hospitalise'){
      var response1 = await http.patch(Uri.parse(url1),headers: {
        'content-type':'application/json',
      },body: jsonEncode({'patient_status': 'A','patient_bed': {
      'bed_number' : bedNo, 'bed_category': bedCat, 'ward':wardSelected,'floor':floor
      } }));

      var res = jsonDecode(response1.body);
      return res['status'];
    }

  }



  Future<dynamic> changePatientBed(id,bedtype,bedno,ward,floor) async{
    String url = "https://api.ukcovid19.in/api/patient/bed_allotment/";
    String wardSelected;
    if(ward =='A'){wardSelected = 'A';}
    else if(ward == 'B'){wardSelected = 'B';}
    else if(ward == 'Obs & Gynae'){wardSelected = 'OG';}
    else if(ward == 'Paediatric'){wardSelected = 'P';}

    var bedtp;
    if(bedtype == 'General Bed') { bedtp = '1'; }
    else if(bedtype == 'Oxygen Bed') { bedtp = '2'; }
    else if(bedtype == 'ICU Bed') { bedtp = '3'; }
    else if(bedtype == 'Ventilators') { bedtp = '4'; }
    var response = await http.post(Uri.parse(url),headers: {
      'content-type':'application/json',},body: jsonEncode({'patient_id':id,'bed_category':bedtp,'bed_number':bedno
      ,'ward':wardSelected,'floor':floor,
      }));
    var res = jsonDecode(response.body);
    return res['status'];
  }

  Future<dynamic> getSearched(query)async{
    print('this is $query');
    String url = "https://api.ukcovid19.in/api/patient/get_searched_patients/$query/";

    var response = await http.get(Uri.parse(url));
    var res = jsonDecode(response.body);
    print(res);
    return res;
  }

  Future<dynamic> getPatientProfile(id,phno)async{
    String url = "https://api.ukcovid19.in/api/patient/get_patient_profile/$id/$phno/";
    var response = await http.get(Uri.parse(url));
    var res = jsonDecode(response.body);
    if(res['status'] !=200)
      {
        return 400;
      }
    return res['data'];
  }

}

