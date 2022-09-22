class ChampionModel {
  String name;
  ChampionModel({required this.name});
  factory ChampionModel.fromJson(Map<String, dynamic> json) =>
      ChampionModel(name: json["name"] ?? '');
}
