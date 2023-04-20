import '/pages/home.page.dart';
import '/pages/home.page.dart';
import 'package:flutter/material.dart';

class FinalizationScreen extends StatefulWidget {
  const FinalizationScreen({super.key});

  @override
  State<FinalizationScreen> createState() => _FinalizationScreenState();
}

class _FinalizationScreenState extends State<FinalizationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/post-picture-001.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            child: Center(
              child: Container(
                //borderRadius:
                //  BorderRadius.circular(10), // define o raio das bordas
                color: Color.fromARGB(103, 0, 0, 0),
                width: 250,
                height: 250,
                alignment: Alignment.center,
                child: Text(
                  "O pedido foi realizado com sucesso! \nCaso fique com alguma dúvida, entre em contato comigo pelo WhatsApp.",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
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
