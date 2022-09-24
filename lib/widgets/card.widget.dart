import 'package:flutter/material.dart';
import 'dart:async';
import '../models/champion.model.dart';
import '../models/championEspecif.model.dart';
import '../pages/detalle.page.dart';
import '../providers/championEspecif.provider.dart';

class CardWidget extends StatelessWidget {
  CardWidget({super.key, required this.champion, required this.idioma});
  final championEspecificProvider = ChampionEspecifProvider();
  late Future<List<ChampionEspecifModel>> championEspecif;
  late String idioma;

  ChampionModel champion;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: GestureDetector(
        onTap: () async {
          championEspecif = championEspecificProvider
              .obtenerChampionsEspecifico(champion.id, idioma);
          List list = await championEspecif;
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => DetallePage(
                      champion: champion, championEspecific: list[0]))));
        },
        child: Container(
            child: Column(
          children: [
            Image.network(
                'http://ddragon.leagueoflegends.com/cdn/12.18.1/img/champion/${champion.image}'),
            Text(champion.name,
                textAlign: TextAlign.center,
                style:
                    TextStyle(fontSize: 22, fontFamily: 'BeaufortforLOL-Bold')),
          ],
        )),
      ),
    );
  }
}
