import 'package:http/http.dart' as http;
import 'dart:convert';

class IdiomasProvider {
  Future<List<String>> obtenerIdiomas() async {
    var client = http.Client();
    try {
      var url = Uri.https('ddragon.leagueoflegends.com', 'cdn/languages.json');
      var response = await client.get(url);
      var decodificarResponse = utf8
          .decode(response.bodyBytes)
          .toString()
          .replaceAll("[", "")
          .replaceAll("]", "")
          .replaceAll('"', "")
          .split(",");
      print(decodificarResponse);
      return decodificarResponse;
    } finally {
      client.close();
    }
  }
}
