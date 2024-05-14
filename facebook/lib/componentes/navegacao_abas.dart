import 'package:facebook/uteis/paleta_cores.dart';
import 'package:flutter/material.dart';

class NavegacaoAbas extends StatefulWidget {
  final List<IconData> icones;
  final int indiceAbaSelecionada;
  final Function(int) onTap;
  final bool? indicadorEmbaixo;

  const NavegacaoAbas({
    Key? key,
    required this.icones,
    required this.indiceAbaSelecionada,
    required this.onTap,
    this.indicadorEmbaixo = false,
  }) : super(key: key);

  @override
  State<NavegacaoAbas> createState() => _NavegacaoAbasState();
}

class _NavegacaoAbasState extends State<NavegacaoAbas> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: widget.onTap,
      dividerColor: Colors.white,
      indicator: BoxDecoration(
        border: widget.indicadorEmbaixo!
            ? const Border(
                bottom: BorderSide(
                  color: PaletaCores.azulFacebook,
                  width: 3,
                ),
              )
            : const Border(
                top: BorderSide(
                  color: PaletaCores.azulFacebook,
                  width: 3,
                ),
              ),
      ),
      tabs: widget.icones
          .asMap()
          .map((indice, item) {
            return MapEntry(
              indice,
              Tab(
                  icon: Icon(
                item,
                color: widget.indiceAbaSelecionada == indice
                    ? PaletaCores.azulFacebook
                    : Colors.black45,
                size: 30,
              )),
            );
          })
          .values
          .toList(),
    );
  }
}
