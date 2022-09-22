import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/championEspecif.model.dart';

class ChampionEspecifProvider {
  Future<List<ChampionEspecifModel>> obtenerChampionsEspecifico(
      String nameChampion) async {
    List<ChampionEspecifModel> championEspecifico = [];
    var client = http.Client();
    try {
      var url = Uri.https('ddragon.leagueoflegends.com',
          'cdn/12.18.1/data/es_MX/champion/' + nameChampion + '.json');
      var response = await client.get(url);
      var decodificarResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
      decodificarResponse["data"].forEach((item, value) =>
          {championEspecifico.add(ChampionEspecifModel.fromJson(value))});
      return championEspecifico;
    } finally {
      client.close();
    }
  }
}
