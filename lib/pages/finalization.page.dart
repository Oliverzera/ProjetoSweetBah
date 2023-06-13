import 'package:app_avaliacao/controller/login_controller.dart';
import 'package:app_avaliacao/pages/cadastral_changes.page.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '/pages/home.page.dart';
import 'package:flutter/material.dart';

class FinalizationScreen extends StatefulWidget {
  const FinalizationScreen({Key? key}) : super(key: key);

  @override
  State<FinalizationScreen> createState() => _FinalizationScreenState();
}

// tela de finalização após confirmação do pedido na página da sacola
class _FinalizationScreenState extends State<FinalizationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 125, 117),
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.popUntil(context, ModalRoute.withName('home'));
            },
            child: Center(
              child: Container(
                color: Color.fromARGB(255, 236, 125, 117),
                width: 250,
                height: 250,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "O pedido foi realizado com sucesso! \nCaso fique com alguma dúvida, entre em contato comigo pelo WhatsApp.",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
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
