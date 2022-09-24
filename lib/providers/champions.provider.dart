import '../models/champion.model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChampionProvider {
  Future<List<ChampionModel>> obtenerChampions(String selectedIdioma) async {
    List<ChampionModel> champions = [];
    var client = http.Client();
    try {
      var url = Uri.https('ddragon.leagueoflegends.com',
          'cdn/12.18.1/data/$selectedIdioma/champion.json');
      var response = await client.get(url);
      var decodificarResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
      decodificarResponse["data"].forEach(
          (item, value) => {champions.add(ChampionModel.fromJson(value))});
      return champions;
    } finally {
      client.close();
    }
  }
}
