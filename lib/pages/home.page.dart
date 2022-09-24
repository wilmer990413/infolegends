import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/champion.model.dart';
import '../providers/champions.provider.dart';
import '../providers/idioma.provider.dart';
import '../widgets/card.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final championProvider = ChampionProvider();
  final idiomasProvider = IdiomasProvider();
  late Future<List<ChampionModel>> champions;
  late Future<List<String>> idiomas;
  late String selectedIdioma = 'es_MX';
  @override
  void initState() {
    idiomas = idiomasProvider.obtenerIdiomas();
    champions = championProvider.obtenerChampions(selectedIdioma);
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
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 30),
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.white12,
                  border: Border.all(color: Colors.black38, width: 3),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.57), blurRadius: 3)
                  ]),
              child: FutureBuilder(
                  future: idiomas,
                  builder: (context, snapshot) {
                    return DropdownButton(
                        menuMaxHeight: 200,
                        alignment: Alignment.center,
                        iconSize: 30,
                        icon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.language),
                        ),
                        value: selectedIdioma,
                        items: snapshot.data
                            ?.map((e) => DropdownMenuItem(
                                value: e,
                                child: Center(
                                  child: Text(e,
                                      style: TextStyle(
                                          fontFamily: 'BeaufortforLOL-Bold',
                                          color: Color.fromARGB(
                                              197, 255, 200, 81))),
                                )))
                            .toList(),
                        onChanged: (snapshot) => setState(() {
                              selectedIdioma = snapshot.toString();
                              champions = championProvider
                                  .obtenerChampions(selectedIdioma);
                            }));
                  }),
            ),
          ),
        ],
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
                          champion: element, idioma: selectedIdioma));
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
