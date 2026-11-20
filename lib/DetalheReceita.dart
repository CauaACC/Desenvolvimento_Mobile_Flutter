// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:fit_app/Receita.dart';

class DetalheReceita extends StatelessWidget {
  const DetalheReceita({super.key});

  @override
  Widget build(BuildContext context) {
    final receita = ModalRoute.of(context)!.settings.arguments as Receita;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(receita.nome),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.deepOrange.shade50,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.deepOrange),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.deepOrange,
                    child: Icon(receita.icone, color: Colors.white, size: 32),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          receita.nome,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "${receita.categoria} · ${receita.tempoMinutos} minutos",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _Secao(
              titulo: "Ingredientes",
              icone: Icons.shopping_basket,
              corBorda: Colors.teal,
              corFundo: Colors.teal.shade50,
              itens: receita.ingredientes,
              numerado: false,
            ),
            const SizedBox(height: 20),
            _Secao(
              titulo: "Modo de preparo",
              icone: Icons.menu_book,
              corBorda: Colors.blue,
              corFundo: Colors.blue.shade50,
              itens: receita.preparo,
              numerado: true,
            ),
          ],
        ),
      ),
    );
  }
}

class _Secao extends StatelessWidget {
  final String titulo;
  final IconData icone;
  final Color corBorda;
  final Color corFundo;
  final List<String> itens;
  final bool numerado;

  const _Secao({
    required this.titulo,
    required this.icone,
    required this.corBorda,
    required this.corFundo,
    required this.itens,
    required this.numerado,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: corFundo,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: corBorda),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icone, color: corBorda),
              const SizedBox(width: 8),
              Text(
                titulo,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          for (int i = 0; i < itens.length; i++)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 24,
                    child: Text(
                      numerado ? "${i + 1}." : "•",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: corBorda,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      itens[i],
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
