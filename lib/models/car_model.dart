import 'dart:convert';

List<CarModel> carModelFromJson(String str) => 
    List<CarModel>.from(json.decode(str).map((x) => CarModel.fromJson(x)));

class CarModel {
  int? id; // Añadido para que coincida con tu test
  int? year;
  String? make;
  String? model;
  String? type;

  CarModel({this.id, this.year, this.make, this.model, this.type});

  factory CarModel.fromJson(Map<String, dynamic> json) => CarModel(
    id: json["id"], // Mapeamos el ID del JSON
    year: json["year"],
    make: json["make"],
    model: json["model"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "year": year,
    "make": make,
    "model": model,
    "type": type,
  };
}