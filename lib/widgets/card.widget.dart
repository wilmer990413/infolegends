import 'package:flutter/material.dart';

import '../models/champion.model.dart';
import '../pages/detalle.page.dart';

class CardWidget extends StatelessWidget {
  CardWidget({super.key, required this.champion});

  ChampionModel champion;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => DetallePage(champion: champion))));
        },
        child: Container(
            child: Column(
          children: [Text(champion.name)],
        )),
      ),
    );
  }
}
