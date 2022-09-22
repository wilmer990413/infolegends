import 'package:flutter/material.dart';
import 'package:infolegends/providers/championEspecif.provider.dart';
import '../models/champion.model.dart';
import '../models/championEspecif.model.dart';

class DetallePage extends StatelessWidget {
  DetallePage(
      {super.key, required this.champion, required this.championEspecific});
  ChampionModel champion;
  ChampionEspecifModel championEspecific;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(champion.name,
            style: const TextStyle(
                fontSize: 40, fontFamily: 'BeaufortforLOL-Bold')),
      ),
      body: Container(
        color: Colors.black,
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            Text(championEspecific.lore,
                style: const TextStyle(
                    fontSize: 25, fontFamily: 'BeaufortforLOL-Bold')),
          ],
        ),
      ),
    );
  }
}
