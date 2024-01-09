import 'dart:developer';

import 'package:minebrat/Data/Models/india_state_model.dart';
import 'package:http/http.dart' as http;

class FetchIndianState {
  var client = http.Client();
  Future<List<IndiaStateModel>> fetchStates() async {
    try {
      var response =
          await client.get(Uri.parse("https://api.minebrat.com/api/v1/states"));
      if (response.statusCode == 200) {
        return indiaStateModelFromJson(response.body);
      } else {
        throw Exception("error");
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
