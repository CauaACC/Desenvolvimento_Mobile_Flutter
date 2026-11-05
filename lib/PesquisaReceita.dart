// ignore_for_file: file_names

import 'package:flutter/material.dart';

class PesquisaReceita extends StatefulWidget {
  const PesquisaReceita({super.key});

  @override
  State<PesquisaReceita> createState() => _PesquisaReceitaState();
}

class _PesquisaReceitaState extends State<PesquisaReceita> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  String? _erro;
  String? _termoPesquisado;

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _pesquisar() {
    final texto = _controller.text;
    final termo = texto.trim();

    if (termo.isEmpty) {
      setState(() {
        _erro =
            "Digite o nome da receita (não pode ficar vazio ou apenas com espaços).";
        _termoPesquisado = null;
      });
      _focusNode.requestFocus();
      return;
    }

    setState(() {
      _erro = null;
      _termoPesquisado = termo;
    });
    FocusScope.of(context).unfocus();
  }

  void _novaConsulta() {
    _controller.clear();
    setState(() {
      _erro = null;
      _termoPesquisado = null;
    });
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text("Pesquisar Receita"),
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
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Buscar Receita",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _controller,
                    focusNode: _focusNode,
                    textInputAction: TextInputAction.search,
                    onSubmitted: (_) => _pesquisar(),
                    decoration: InputDecoration(
                      labelText: "Nome da receita",
                      hintText: "Ex.: Panqueca de banana",
                      prefixIcon: const Icon(Icons.search),
                      border: const OutlineInputBorder(),
                      errorText: _erro,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: _pesquisar,
                          icon: const Icon(Icons.search),
                          label: const Text("Pesquisar"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: _novaConsulta,
                          icon: const Icon(Icons.refresh),
                          label: const Text("Nova consulta"),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.deepOrange,
                            side: const BorderSide(color: Colors.deepOrange),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            if (_termoPesquisado != null) _ResultadoPesquisa(termo: _termoPesquisado!),
          ],
        ),
      ),
    );
  }
}

class _ResultadoPesquisa extends StatelessWidget {
  final String termo;

  const _ResultadoPesquisa({required this.termo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.teal.shade50,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.teal),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.restaurant_menu, color: Colors.teal),
              SizedBox(width: 8),
              Text(
                "Resultado",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            "Termo pesquisado: \"$termo\"",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          const Text(
            "Resultados provisórios — a listagem de receitas será integrada em seguida.",
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
