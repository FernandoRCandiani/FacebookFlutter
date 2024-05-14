import 'package:facebook/componentes/imagem_perfil.dart';
import 'package:facebook/modelos/modelos.dart';
import 'package:flutter/material.dart';

class BotaoImagemPefil extends StatelessWidget {
  final Usuario usuario;
  final VoidCallback onTap;

  const BotaoImagemPefil({
    super.key,
    required this.usuario,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ImagemPerfil(
            urlImagem: usuario.urlImagem,
            foiVisualizado: true,
          ),
          const SizedBox(width: 4),
          Flexible(
            child: Text(
              usuario.nome,
              style: const TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
