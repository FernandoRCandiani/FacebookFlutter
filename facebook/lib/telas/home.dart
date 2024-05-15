import 'package:facebook/componentes/area_criar_postagem.dart';
import 'package:facebook/componentes/area_estoria.dart';
import 'package:facebook/componentes/botao_circulo.dart';
import 'package:facebook/componentes/cartao_postagem.dart';
import 'package:facebook/componentes/lista_contatos.dart';
import 'package:facebook/componentes/lista_opcoes.dart';
import 'package:facebook/dados/dados.dart';
import 'package:facebook/modelos/modelos.dart';
import 'package:facebook/uteis/paleta_cores.dart';
import 'package:facebook/uteis/responsivo.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Home extends StatefulWidget {
  const Home({key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TrackingScrollController _scrollController = TrackingScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsivo(
          mobile: HomeMobile(
            scrollController: _scrollController,
          ),
          desktop: HomeDesktop(
            scrollController: _scrollController,
          ),
        ),
      ),
    );
  }
}

class HomeMobile extends StatelessWidget {
  final TrackingScrollController scrollController;
  const HomeMobile({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
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
    );
  }
}

class HomeDesktop extends StatelessWidget {
  final TrackingScrollController scrollController;
  const HomeDesktop({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: ListaOpcoes(
              usuario: usuarioAtual,
            ),
          ),
        ),
        const Spacer(),
        Flexible(
          flex: 5,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                sliver: SliverToBoxAdapter(
                  child: AreaStoria(
                    usuario: usuarioAtual,
                    estorias: estorias,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: AreaCriarPostagem(usuario: usuarioAtual),
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
        ),
        const Spacer(),
        Flexible(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: ListaContatos(
              usuarios: usuariosOnline,
            ),
          ),
        ),
      ],
    );
  }
}
