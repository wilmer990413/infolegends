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
        backgroundColor: Colors.black,
        title: Image.asset(
          'web/icons/infolegends.png',
          fit: BoxFit.contain,
          height: 130.0,
          width: 130.0,
          alignment: Alignment.center,
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
                  color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("CHAMPIONS",
                          style: TextStyle(
                              fontSize: 40,
                              fontFamily: 'BeaufortforLOL-Bold',
                              color: Color.fromARGB(197, 255, 200, 81))),
                    ],
                  ))),
          Expanded(
            flex: 7,
            child: Container(
              color: Colors.black,
              child: FutureBuilder(
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
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(),
                          ],
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
