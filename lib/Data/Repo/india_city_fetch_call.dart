import 'dart:developer';

import 'package:minebrat/Data/Models/india_city_model.dart';

import 'package:http/http.dart' as http;

class FetchIndianCity {
  var client = http.Client();
  Future<List<IndiaCityModel>> fetchCities(String stateId) async {
    try {
      var response = await client.get(
          Uri.parse("http://api.minebrat.com/api/v1/states/cities/$stateId"));
      if (response.statusCode == 200) {
        return indiaCityModelFromJson(response.body);
      } else {
        throw Exception("error");
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
