import 'package:patient_status_app/Screens/Nurses/NurseLogin.dart';
class Brain{
  static String TotalPatients( type ){
    if(type == Bed.NonOxyBed)
    {
      return '60';
    }
    else if(type == Bed.OxygenBed)
    {
      return '41';
    }
    else
    {
      return '50';
    }
  }
  static String TotalBeds( type ){
    if(type == Bed.NonOxyBed)
    {
      return '100';
    }
    else if(type == Bed.OxygenBed)
    {
      return '80';
    }
    else
    {
      return '60';
    }
  }
  static String VacantBeds( type ){
    if(type == Bed.NonOxyBed)
    {
      return '70';
    }
    else if(type == Bed.OxygenBed)
    {
      return '20';
    }
    else
    {
      return '25';
    }
  }
  static String OccupyedBeds( type ){
    if(type == Bed.NonOxyBed)
    {
      return '30';
    }
    else if(type == Bed.OxygenBed)
    {
      return '60';
    }
    else
    {
      return '35';
    }
  }

}