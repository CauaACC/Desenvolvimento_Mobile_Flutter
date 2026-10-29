// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:fit_app/HomePage.dart';

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
