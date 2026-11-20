// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:fit_app/Receita.dart';

class FavoritasReceitas extends StatelessWidget {
  const FavoritasReceitas({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritas = receitas.where((r) => r.favorita).toList();

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text("Favoritas da Semana"),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: favoritas.isEmpty
          ? const Center(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Text(
                  "Você ainda não tem receitas favoritas.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: favoritas.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final receita = favoritas[index];
                return InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed("/detalhe", arguments: receita);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.blue),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.favorite, color: Colors.blue),
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
                                "${receita.categoria} · ${receita.tempoMinutos} min",
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.chevron_right, color: Colors.blue),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
