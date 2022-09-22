import '../models/champion.model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChampionProvider {
  Future<List<ChampionModel>> obtenerChampions() async {
    // var fechaActual = new DateTime.now();
    // String fechaEnvio = fechaActual.toString().substring(0, 10);
    List<ChampionModel> champions = [];
    var client = http.Client();
    try {
      var url = Uri.https('ddragon.leagueoflegends.com',
          'cdn/12.18.1/data/es_MX/champion.json');
      var response = await client.get(url);
      var decodificarResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
      decodificarResponse["data"].forEach((item, value) =>
          {print(value), champions.add(ChampionModel.fromJson(value))});
      print("paso2");
      print(champions);
      return champions;
    } finally {
      client.close();
    }
  }
}
