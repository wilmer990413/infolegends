import 'package:http/http.dart';

class ChampionEspecifModel {
  String lore;
  ChampionEspecifModel({required this.lore});
  factory ChampionEspecifModel.fromJson(Map<String, dynamic> json) =>
      ChampionEspecifModel(lore: json["lore"] ?? '');
}
