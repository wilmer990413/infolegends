import 'package:http/http.dart';

class ChampionModel {
  String id;
  String name;
  String image;
  ChampionModel({required this.name, required this.image, required this.id});
  factory ChampionModel.fromJson(Map<String, dynamic> json) => ChampionModel(
      name: json["name"] ?? '',
      image: json["image"]["full"] ?? '',
      id: json["id"]);
}
