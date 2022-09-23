import 'package:flutter/material.dart';
import 'package:infolegends/providers/championEspecif.provider.dart';
import '../models/champion.model.dart';
import '../models/championEspecif.model.dart';

class DetallePage extends StatefulWidget {
  DetallePage(
      {super.key, required this.champion, required this.championEspecific});
  ChampionModel champion;
  ChampionEspecifModel championEspecific;
  @override
  State<DetallePage> createState() => _DetallePageState(
      champion: champion, championEspecific: championEspecific);
}

class _DetallePageState extends State<DetallePage> {
  _DetallePageState({required this.champion, required this.championEspecific});
  ChampionModel champion;
  ChampionEspecifModel championEspecific;
  bool passiveFlag = false;
  bool spells1Flag = false;
  bool spells2Flag = false;
  bool spells3Flag = false;
  bool spells4Flag = false;
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
            Padding(
              padding: const EdgeInsets.all(8),
              child: Image.network(
                  'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/${champion.id}_0.jpg'),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(championEspecific.lore,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                      fontSize: 20, fontFamily: 'BeaufortforLOL-Bold')),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Text("Habilidades",
                    style: const TextStyle(
                        color: Color.fromARGB(197, 255, 200, 81),
                        fontSize: 25,
                        fontFamily: 'BeaufortforLOL-Bold')),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        passiveFlag = true;
                        spells1Flag = false;
                        spells2Flag = false;
                        spells3Flag = false;
                        spells4Flag = false;
                      });
                    },
                    onDoubleTap: () {
                      setState(() {
                        passiveFlag = false;
                      });
                    },
                    child: Image.network(
                        'https://ddragon.leagueoflegends.com/cdn/12.18.1/img/passive/${championEspecific.passive["image"]["full"]}'),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        passiveFlag = false;
                        spells1Flag = true;
                        spells2Flag = false;
                        spells3Flag = false;
                        spells4Flag = false;
                      });
                    },
                    onDoubleTap: () {
                      setState(() {
                        spells1Flag = false;
                      });
                    },
                    child: Image.network(
                        'https://ddragon.leagueoflegends.com/cdn/12.18.1/img/spell/${championEspecific.spells[0]["image"]["full"]}'),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        passiveFlag = false;
                        spells1Flag = false;
                        spells2Flag = true;
                        spells3Flag = false;
                        spells4Flag = false;
                      });
                    },
                    onDoubleTap: () {
                      setState(() {
                        spells2Flag = false;
                      });
                    },
                    child: Image.network(
                        'https://ddragon.leagueoflegends.com/cdn/12.18.1/img/spell/${championEspecific.spells[1]["image"]["full"]}'),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        passiveFlag = false;
                        spells1Flag = false;
                        spells2Flag = false;
                        spells3Flag = true;
                        spells4Flag = false;
                      });
                    },
                    onDoubleTap: () {
                      setState(() {
                        spells3Flag = false;
                      });
                    },
                    child: Image.network(
                        'https://ddragon.leagueoflegends.com/cdn/12.18.1/img/spell/${championEspecific.spells[2]["image"]["full"]}'),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        passiveFlag = false;
                        spells1Flag = false;
                        spells2Flag = false;
                        spells3Flag = false;
                        spells4Flag = true;
                      });
                    },
                    onDoubleTap: () {
                      setState(() {
                        spells4Flag = false;
                      });
                    },
                    child: Image.network(
                        'https://ddragon.leagueoflegends.com/cdn/12.18.1/img/spell/${championEspecific.spells[3]["image"]["full"]}'),
                  ),
                ),
              ],
            ),
            Visibility(
              visible: passiveFlag,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(championEspecific.passive["name"],
                          style: const TextStyle(
                              fontSize: 25, fontFamily: 'BeaufortforLOL-Bold')),
                    ),
                    Text(
                        limipiarDescripHabilidad(
                            championEspecific.passive["description"]),
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            fontSize: 20, fontFamily: 'BeaufortforLOL-Bold')),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: spells1Flag,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(championEspecific.spells[0]["name"],
                          style: const TextStyle(
                              fontSize: 25, fontFamily: 'BeaufortforLOL-Bold')),
                    ),
                    Text(
                        limipiarDescripHabilidad(
                            championEspecific.spells[0]["description"]),
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            fontSize: 20, fontFamily: 'BeaufortforLOL-Bold')),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: spells2Flag,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Text(championEspecific.spells[1]["name"],
                        style: const TextStyle(
                            fontSize: 25, fontFamily: 'BeaufortforLOL-Bold')),
                    Text(
                        limipiarDescripHabilidad(
                            championEspecific.spells[1]["description"]),
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            fontSize: 20, fontFamily: 'BeaufortforLOL-Bold')),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: spells3Flag,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(championEspecific.spells[2]["name"],
                          style: const TextStyle(
                              fontSize: 25, fontFamily: 'BeaufortforLOL-Bold')),
                    ),
                    Text(
                        limipiarDescripHabilidad(
                            championEspecific.spells[2]["description"]),
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            fontSize: 20, fontFamily: 'BeaufortforLOL-Bold')),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: spells4Flag,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(championEspecific.spells[3]["name"],
                          style: const TextStyle(
                              fontSize: 25, fontFamily: 'BeaufortforLOL-Bold')),
                    ),
                    Text(
                        limipiarDescripHabilidad(
                            championEspecific.spells[3]["description"]),
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            fontSize: 20, fontFamily: 'BeaufortforLOL-Bold')),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String limipiarDescripHabilidad(String descripHabilidad) {
  descripHabilidad = descripHabilidad
      .toString()
      .replaceAll("<physicalDamage>", "")
      .replaceAll("</physicalDamage>", "")
      .replaceAll("<passive>", "")
      .replaceAll("</passive>", "")
      .replaceAll("<magicDamage>", "")
      .replaceAll("</magicDamage>", "")
      .replaceAll("<scaleArmor>", "")
      .replaceAll("</scaleArmor>", "")
      .replaceAll("<scaleMR>", "")
      .replaceAll("</scaleMR>", "")
      .replaceAll("<mainText>", "")
      .replaceAll("</mainText>", "")
      .replaceAll("<status>", "")
      .replaceAll("</status>", "")
      .replaceAll("<i>", "")
      .replaceAll("</i>", "")
      .replaceAll("<speed>", "")
      .replaceAll("</speed>", "")
      .replaceAll("<spellName>", "")
      .replaceAll("</spellName>", "")
      .replaceAll("<keywordName>", "")
      .replaceAll("</keywordName>", "")
      .replaceAll("<font color='#9b0f5f'>", "")
      .replaceAll("<font color='#cccc00'>", "")
      .replaceAll("<font color='#FF9900'>", "")
      .replaceAll("<font color='#FFF673'>", "")
      .replaceAll("<font color='#669900'>", "")
      .replaceAll("<font color='#fe5c50'>", "")
      .replaceAll("<font color='#8484fb'>", "")
      .replaceAll("<font color='#ee91d7'>", "")
      .replaceAll("<font color='#BBFFFF'>", "")
      .replaceAll("<font color='#C200E1'>", "")
      .replaceAll("</font>", "")
      .replaceAll("<br>", " ");
  return descripHabilidad;
}
