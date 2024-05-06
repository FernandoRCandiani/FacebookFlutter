import 'package:facebook/componentes/area_criar_postagem.dart';
import 'package:facebook/componentes/area_estoria.dart';
import 'package:facebook/componentes/botao_circulo.dart';
import 'package:facebook/componentes/cartao_postagem.dart';
import 'package:facebook/dados/dados.dart';
import 'package:facebook/modelos/modelos.dart';
import 'package:facebook/uteis/paleta_cores.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Home extends StatefulWidget {
  const Home({key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            floating: true,
            centerTitle: false,
            title: const Text(
              "facebook",
              style: TextStyle(
                color: PaletaCores.azulFacebook,
                fontWeight: FontWeight.bold,
                fontSize: 28,
                letterSpacing: -1.2,
              ),
            ),
            actions: [
              BotaoCircular(
                icone: Icons.search,
                iconeTamanho: 30,
                onPressed: () {},
              ),
              BotaoCircular(
                icone: LineIcons.facebookMessenger,
                iconeTamanho: 30,
                onPressed: () {},
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: AreaCriarPostagem(usuario: usuarioAtual),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
            sliver: SliverToBoxAdapter(
              child: AreaStoria(usuario: usuarioAtual, estorias: estorias),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, indice) {
                Postagem postagem = postagens[indice];
                return CartaoPostagem(postagem: postagem);
              },
              childCount: postagens.length,
            ),
          ),
        ],
      ),
    );
  }
}
