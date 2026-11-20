// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:fit_app/HomePage.dart';
import 'package:fit_app/PesquisaReceita.dart';
import 'package:fit_app/CategoriaReceitas.dart';
import 'package:fit_app/DetalheReceita.dart';
import 'package:fit_app/FavoritasReceitas.dart';

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (_) => const HomePage(),
        "/pesquisa": (_) => const PesquisaReceita(),
        "/categoria": (_) => const CategoriaReceitas(),
        "/detalhe": (_) => const DetalheReceita(),
        "/favoritas": (_) => const FavoritasReceitas(),
      },
    );
  }
}
