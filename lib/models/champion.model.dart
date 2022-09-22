import 'package:http/http.dart';

class ChampionModel {
  String name;
  String image;
  ChampionModel({required this.name, required this.image});
  factory ChampionModel.fromJson(Map<String, dynamic> json) => ChampionModel(
      name: json["name"] ?? '', image: json["image"]["full"] ?? '');
}
