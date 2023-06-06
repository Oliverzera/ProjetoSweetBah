import '/pages/home.page.dart';
import '/pages/home.page.dart';
import 'package:flutter/material.dart';

class FinalizationScreen extends StatefulWidget {
  const FinalizationScreen({super.key});

  @override
  State<FinalizationScreen> createState() => _FinalizationScreenState();
}

// tela de finalização após confirmação do pedido na página da sacola
class _FinalizationScreenState extends State<FinalizationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 114, 106),
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            child: Center(
              child: Container(
                //borderRadius:
                //  BorderRadius.circular(10), // define o raio das bordas
                color: Color.fromARGB(255, 236, 114, 106),
                width: 250,
                height: 250,
                alignment: Alignment.center,
                child: Text(
                  "O pedido foi realizado com sucesso! \nCaso fique com alguma dúvida, entre em contato comigo pelo WhatsApp.",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
