import 'dart:convert';

import 'package:covidtrackerapp/Models/IndiaCovidModel.dart';
import 'package:covidtrackerapp/Services/Utiltites/app_url.dart';
import 'package:http/http.dart' as http;

class StateServices {
  
  Future<IndiaCovidModel> FetchIndiaData() async{
     
     final response = await http.get(Uri.parse(AppUrl().baseurl));

     var data = jsonDecode(response.body.toString());

     if (response.statusCode == 200) {
       return IndiaCovidModel.fromJson(data);
     } else {
       throw Exception('Error');
     }
  }
  Future<IndiaCovidModel> getstateslist() async {
    final response = await http.get(Uri.parse(AppUrl().baseurl));

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return IndiaCovidModel.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }
}