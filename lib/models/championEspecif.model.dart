import 'package:http/http.dart';

class ChampionEspecifModel {
  String lore;
  String blurb;
  List spells;
  var passive;
  ChampionEspecifModel(
      {required this.lore,
      required this.blurb,
      required this.spells,
      required this.passive});
  factory ChampionEspecifModel.fromJson(Map<String, dynamic> json) =>
      ChampionEspecifModel(
          lore: json["lore"] ?? '',
          blurb: json["blurb"] ?? '',
          spells: json["spells"] ?? '',
          passive: json["passive"] ?? '');
}
