import 'package:flutter/material.dart';

import '../models/champion.model.dart';

class DetallePage extends StatelessWidget {
  DetallePage({super.key, required this.champion});
  ChampionModel champion;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(champion.name),
      ),
      body: Container(child: Text(champion.name)),
    );
  }
}
