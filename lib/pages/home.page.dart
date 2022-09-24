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
                  List<Widget> listaDeListas = [];
                  List<Widget> listaImpar = [];
                  if (snapshot.hasData) {
                    snapshot.data?.forEach((element) {
                      lista.add(CardWidget(
                        champion: element,
                      ));
                    });
                    if (lista.length % 4 != 0) {
                      do {
                        listaImpar.add(lista[lista.length - 1]);
                        lista.removeAt(lista.length - 1);
                      } while (lista.length % 4 != 0);
                    }
                    listaImpar = listaImpar.reversed.toList();
                    int longitug = 4;
                    for (int i = 0; i < lista.length; i += longitug) {
                      List<Widget> aux = lista.sublist(i, i + longitug);
                      Widget table = Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Table(
                          children: [TableRow(children: aux)],
                        ),
                      );
                      listaDeListas.add(table);
                    }
                    if (listaImpar.isNotEmpty) {
                      Widget itemfinal = Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Table(
                          children: [TableRow(children: listaImpar)],
                        ),
                      );
                      listaDeListas.add(itemfinal);
                    }
                    return ListView(children: listaDeListas);
                  } else {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CircularProgressIndicator(
                              color: Colors.grey,
                            ),
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
