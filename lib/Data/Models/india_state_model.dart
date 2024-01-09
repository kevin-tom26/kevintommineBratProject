import 'dart:convert';

import 'india_city_model.dart';

List<IndiaStateModel> indiaStateModelFromJson(String str) =>
    List<IndiaStateModel>.from(
        json.decode(str).map((x) => IndiaStateModel.fromJson(x)));

String indiaStateModelToJson(List<IndiaStateModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class IndiaStateModel {
  String stateId;
  String stateName;
  List<IndiaCityModel> city;

  IndiaStateModel({
    required this.stateId,
    required this.stateName,
    required this.city,
  });

  factory IndiaStateModel.fromJson(Map<String, dynamic> json) =>
      IndiaStateModel(
        stateId: json["stateId"],
        stateName: json["stateName"],
        city: List<IndiaCityModel>.from(
            json["city"].map((x) => IndiaCityModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "stateId": stateId,
        "stateName": stateName,
        "city": List<dynamic>.from(city.map((x) => x.toJson())),
      };
}
