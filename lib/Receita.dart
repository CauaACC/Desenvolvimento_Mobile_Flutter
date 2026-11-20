// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Receita {
  final String nome;
  final String categoria;
  final IconData icone;
  final int tempoMinutos;
  final List<String> ingredientes;
  final List<String> preparo;
  final bool favorita;

  const Receita({
    required this.nome,
    required this.categoria,
    required this.icone,
    required this.tempoMinutos,
    required this.ingredientes,
    required this.preparo,
    this.favorita = false,
  });
}

const List<Receita> receitas = [
  Receita(
    nome: "Panqueca de banana",
    categoria: "Doces",
    icone: Icons.cake,
    tempoMinutos: 15,
    ingredientes: [
      "2 bananas maduras",
      "2 ovos",
      "4 colheres de aveia",
      "Canela a gosto",
    ],
    preparo: [
      "Amasse as bananas em uma tigela.",
      "Misture os ovos e a aveia até formar uma massa.",
      "Despeje porções em frigideira antiaderente.",
      "Doure dos dois lados e sirva com canela.",
    ],
    favorita: true,
  ),
  Receita(
    nome: "Brigadeiro gourmet",
    categoria: "Doces",
    icone: Icons.cake,
    tempoMinutos: 20,
    ingredientes: [
      "1 lata de leite condensado",
      "3 colheres de chocolate em pó",
      "1 colher de manteiga",
      "Granulado para enrolar",
    ],
    preparo: [
      "Misture os ingredientes em uma panela.",
      "Cozinhe em fogo baixo mexendo sempre.",
      "Desligue quando desgrudar do fundo.",
      "Deixe esfriar, enrole e passe no granulado.",
    ],
    favorita: true,
  ),
  Receita(
    nome: "Lasanha à Bolonhesa",
    categoria: "Salgadas",
    icone: Icons.lunch_dining,
    tempoMinutos: 60,
    ingredientes: [
      "500g de massa de lasanha",
      "500g de carne moída",
      "Molho de tomate",
      "Queijo e presunto",
      "Molho branco",
    ],
    preparo: [
      "Refogue a carne moída com temperos.",
      "Acrescente o molho de tomate.",
      "Monte camadas de massa, carne, queijo e presunto.",
      "Finalize com molho branco e queijo.",
      "Asse a 200°C por 30 minutos.",
    ],
  ),
  Receita(
    nome: "Risoto de cogumelos",
    categoria: "Salgadas",
    icone: Icons.lunch_dining,
    tempoMinutos: 40,
    ingredientes: [
      "2 xícaras de arroz arbóreo",
      "300g de cogumelos",
      "1 cebola picada",
      "Caldo de legumes",
      "Queijo parmesão",
    ],
    preparo: [
      "Refogue a cebola na manteiga.",
      "Acrescente o arroz e os cogumelos.",
      "Vá adicionando o caldo aos poucos, mexendo.",
      "Finalize com parmesão ralado.",
    ],
    favorita: true,
  ),
  Receita(
    nome: "Suco verde detox",
    categoria: "Bebidas",
    icone: Icons.local_drink,
    tempoMinutos: 5,
    ingredientes: [
      "1 folha de couve",
      "1 maçã",
      "Suco de 1 limão",
      "200ml de água",
    ],
    preparo: [
      "Lave bem os ingredientes.",
      "Bata tudo no liquidificador.",
      "Coe se preferir e sirva gelado.",
    ],
  ),
  Receita(
    nome: "Salada de grão-de-bico",
    categoria: "Vegano",
    icone: Icons.eco,
    tempoMinutos: 15,
    ingredientes: [
      "1 xícara de grão-de-bico cozido",
      "1 tomate picado",
      "1/2 cebola roxa",
      "Salsinha e azeite",
    ],
    preparo: [
      "Misture todos os ingredientes em uma tigela.",
      "Tempere com azeite, sal e limão.",
      "Sirva gelado.",
    ],
  ),
];
