import 'package:flutter/material.dart';
import '/pages/home.page.dart';
import '/pages/payment.page.dart';

class SpoonEggs extends StatelessWidget {
  const SpoonEggs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:
            false, // Definir como false para remover o ícone de voltar
        title: Text(
          "Ovos de Colher",
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 255, 73, 82),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
