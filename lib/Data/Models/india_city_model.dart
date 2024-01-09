import 'dart:convert';

List<IndiaCityModel> indiaCityModelFromJson(String str) =>
    List<IndiaCityModel>.from(
        json.decode(str).map((x) => IndiaCityModel.fromJson(x)));

String indiaCityModelToJson(List<IndiaCityModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class IndiaCityModel {
  String cityId;
  String cityName;

  IndiaCityModel({
    required this.cityId,
    required this.cityName,
  });

  factory IndiaCityModel.fromJson(Map<String, dynamic> json) => IndiaCityModel(
        cityId: json["cityId"],
        cityName: json["cityName"],
      );

  Map<String, dynamic> toJson() => {
        "cityId": cityId,
        "cityName": cityName,
      };
}
