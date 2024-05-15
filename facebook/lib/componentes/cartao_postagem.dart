import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook/componentes/imagem_perfil.dart';
import 'package:facebook/modelos/modelos.dart';
import 'package:facebook/uteis/paleta_cores.dart';
import 'package:facebook/uteis/responsivo.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class CartaoPostagem extends StatelessWidget {
  final Postagem postagem;
  const CartaoPostagem({Key? key, required this.postagem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsivo.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: isDesktop ? 0 : 5,
      ),
      elevation: isDesktop ? 0 : 1,
      shape: isDesktop
          ? null
          : RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CabecalhoPostagem(postagem: postagem),
                  Text(postagem.descricao),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: CachedNetworkImage(
                imageUrl: postagem.urlImagem,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: EstatisticasPostagem(postagem: postagem),
            ),
            // Text(postagem.descricao),
          ],
        ),
      ),
    );
  }
}

class CabecalhoPostagem extends StatelessWidget {
  final Postagem postagem;

  const CabecalhoPostagem({
    super.key,
    required this.postagem,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImagemPerfil(
          urlImagem: postagem.usuario.urlImagem,
          foiVisualizado: true,
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                postagem.usuario.nome,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text("${postagem.tempoAtras} - "),
                  const Icon(Icons.public, size: 12, color: Colors.grey),
                ],
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_horiz,
          ),
        )
      ],
    );
  }
}

class EstatisticasPostagem extends StatelessWidget {
  final Postagem postagem;
  const EstatisticasPostagem({Key? key, required this.postagem})
      : super(key: key);

  botoes(icone, titulo) {
    return Row(children: []);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: PaletaCores.azulFacebook,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.thumb_up_alt_rounded,
                color: Colors.white,
                size: 10,
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Text(
                "${postagem.curtidas}",
                style: TextStyle(
                  color: Colors.grey[700],
                ),
              ),
            ),
            Text(
              '${postagem.comentarios} comentários ${postagem.compartilhamentos} compartilhamentos',
              style: TextStyle(
                color: Colors.grey[700],
              ),
            )
          ],
        ),
        const Divider(thickness: 1.2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BotaoPostagem(
              icone: LineIcons.thumbsUpAlt,
              texto: 'Curtir',
              onTap: () {},
            ),
            BotaoPostagem(
              icone: LineIcons.alternateCommentAlt,
              texto: 'Comentar',
              onTap: () {},
            ),
            BotaoPostagem(
              icone: LineIcons.share,
              texto: 'Compartilhar',
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}

class BotaoPostagem extends StatelessWidget {
  final IconData icone;
  final String texto;
  final VoidCallback onTap;

  const BotaoPostagem({
    Key? key,
    required this.icone,
    required this.texto,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        child: InkWell(
          onTap: onTap,
          child: SizedBox(
            child: Row(
              children: [
                Icon(icone),
                const SizedBox(width: 4),
                Text(
                  texto,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
