import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/champion.model.dart';
import '../providers/champions.provider.dart';
import '../widgets/card.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final championProvider = ChampionProvider();
  late Future<List<ChampionModel>> champions;
  @override
  void initState() {
    champions = championProvider.obtenerChampions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Noticias"),
      ),
      body: FutureBuilder(
        future: champions,
        builder: (context, snapshot) {
          List<Widget> lista = [];
          if (snapshot.hasData) {
            snapshot.data?.forEach((element) {
              lista.add(CardWidget(
                champion: element,
              ));
            });
            return ListView(children: lista);
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
