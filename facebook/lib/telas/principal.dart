import 'package:facebook/componentes/navegacao_abas.dart';
import 'package:facebook/telas/home.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Principal extends StatefulWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  final List<Widget> _telas = [
    const Home(),
    const Scaffold(backgroundColor: Colors.green),
    const Scaffold(backgroundColor: Colors.yellow),
    const Scaffold(backgroundColor: Colors.blueAccent),
    const Scaffold(backgroundColor: Colors.tealAccent),
    const Scaffold(backgroundColor: Colors.purple),
  ];

  final List<IconData> _icones = [
    Icons.home,
    Icons.ondemand_video,
    Icons.storefront_outlined,
    Icons.flag_outlined,
    LineIcons.bell,
    Icons.menu,
  ];

  int _indiceAbaSelecionada = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _icones.length,
      child: Scaffold(
        body: TabBarView(children: _telas),
        bottomNavigationBar: NavegacaoAbas(
            icones: _icones,
            indiceAbaSelecionada: _indiceAbaSelecionada,
            onTap: (indice) {
              setState(() {
                _indiceAbaSelecionada = indice;
              });
            }),
      ),
    );
  }
}
