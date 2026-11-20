// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:fit_app/Receita.dart';

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
    final termo = _termoPesquisado;
    final resultados = termo == null
        ? const <Receita>[]
        : receitas
            .where((r) => r.nome.toLowerCase().contains(termo.toLowerCase()))
            .toList();

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
            if (termo != null)
              _ResultadoPesquisa(termo: termo, resultados: resultados),
          ],
        ),
      ),
    );
  }
}

class _ResultadoPesquisa extends StatelessWidget {
  final String termo;
  final List<Receita> resultados;

  const _ResultadoPesquisa({
    required this.termo,
    required this.resultados,
  });

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
          const Row(
            children: [
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
          const SizedBox(height: 12),
          if (resultados.isEmpty)
            const Text(
              "Nenhuma receita encontrada com esse nome.",
              style: TextStyle(fontSize: 14, color: Colors.black54),
            )
          else
            for (final receita in resultados)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed("/detalhe", arguments: receita);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.teal.shade200),
                    ),
                    child: Row(
                      children: [
                        Icon(receita.icone, color: Colors.teal),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                receita.nome,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
                        const Icon(Icons.chevron_right, color: Colors.teal),
                      ],
                    ),
                  ),
                ),
              ),
        ],
      ),
    );
  }
}
