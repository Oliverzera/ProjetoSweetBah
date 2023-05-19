import 'package:flutter/material.dart';
import '/pages/home.page.dart';
import '/pages/payment.page.dart';

class SpoonEggs extends StatelessWidget {
  const SpoonEggs({super.key});

  //tela dos ovos de colher
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:
            false, // Definir como false para remover o ícone de voltar
        title: Text(
          "Ovos de Colher",
          style: TextStyle(
            color: Colors.black,
            fontSize: 26,
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
