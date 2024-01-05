import 'dart:convert';

import 'package:covidtracker/Services/Utilities/app_url.dart';
import 'package:http/http.dart' as http;

import '../Model/world_states_model.dart';


class StatesServices{

  Future<WorldsStatesModel> fetchWorkdStatesRecords () async{
    final response  = await http.get(Uri.parse(AppUrl.worldStatesApi));

    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
        return WorldsStatesModel.fromJson(json);
    }else{
      throw Exception('error');
    }
  }
}