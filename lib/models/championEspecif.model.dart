import 'package:http/http.dart';

class ChampionEspecifModel {
  String lore;
  List spells;
  var passive;
  ChampionEspecifModel(
      {required this.lore, required this.spells, required this.passive});
  factory ChampionEspecifModel.fromJson(Map<String, dynamic> json) =>
      ChampionEspecifModel(
          lore: json["lore"] ?? '',
          spells: json["spells"] ?? '',
          passive: json["passive"] ?? '');
}
