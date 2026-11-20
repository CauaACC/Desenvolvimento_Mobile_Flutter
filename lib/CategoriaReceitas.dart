// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:fit_app/Receita.dart';

class CategoriaReceitas extends StatelessWidget {
  const CategoriaReceitas({super.key});

  @override
  Widget build(BuildContext context) {
    final categoria = ModalRoute.of(context)!.settings.arguments as String;
    final lista = receitas.where((r) => r.categoria == categoria).toList();

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text("Categoria: $categoria"),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: lista.isEmpty
          ? const Center(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Text(
                  "Nenhuma receita cadastrada nesta categoria ainda.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: lista.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final receita = lista[index];
                return _CartaoReceita(receita: receita);
              },
            ),
    );
  }
}

class _CartaoReceita extends StatelessWidget {
  final Receita receita;

  const _CartaoReceita({required this.receita});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        Navigator.of(context).pushNamed("/detalhe", arguments: receita);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: Colors.deepOrange,
              child: Icon(receita.icone, color: Colors.white),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    receita.nome,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${receita.ingredientes.length} ingredientes · ${receita.tempoMinutos} min",
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.deepOrange),
          ],
        ),
      ),
    );
  }
}
