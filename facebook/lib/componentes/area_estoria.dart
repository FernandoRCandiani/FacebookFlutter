import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook/componentes/imagem_perfil.dart';
import 'package:facebook/dados/dados.dart';
import 'package:facebook/modelos/modelos.dart';
import 'package:facebook/uteis/paleta_cores.dart';
import 'package:facebook/uteis/responsivo.dart';
import 'package:flutter/material.dart';

class AreaStoria extends StatelessWidget {
  final Usuario usuario;
  final List<Estoria> estorias;

  const AreaStoria({super.key, 
    required this.usuario,
    required this.estorias,
  });

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsivo.isDesktop(context);
    return Container(
      height: 200,
      color: isDesktop ? Colors.transparent : Colors.white,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + estorias.length,
        itemBuilder: (context, indice) {
          if (indice == 0) {
            Estoria estoriaUsuario = Estoria(
              usuario: usuarioAtual,
              urlImagem: usuarioAtual.urlImagem,
            );
    
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: CartaoEstoria(
                adicionarEstoria: true,
                estoria: estoriaUsuario,
              ),
            );
          }
    
          Estoria estoria = estorias[indice - 1];
    
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: CartaoEstoria(estoria: estoria),
          );
        },
      ),
    );
  }
}

class CartaoEstoria extends StatelessWidget {
  final Estoria estoria;
  final bool adicionarEstoria;
  const CartaoEstoria({
    key,
    required this.estoria,
    this.adicionarEstoria = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: estoria.urlImagem,
            height: double.infinity,
            width: 110,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110,
          decoration: BoxDecoration(
            gradient: PaletaCores.degradeEstoria,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        Positioned(
          top: 8,
          left: 8,
          child: adicionarEstoria
              ? Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.add),
                    iconSize: 30,
                    color: PaletaCores.azulFacebook,
                    onPressed: () {},
                  ),
                )
              : ImagemPerfil(
                  urlImagem: estoria.usuario.urlImagem,
                  foiVisualizado: estoria.foiVisualizado,
                ),
        ),
        Positioned(
          bottom: 8,
          left: 8,
          right: 8,
          child: Text(
            adicionarEstoria ? "Criar Story" : estoria.usuario.nome,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
