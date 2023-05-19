import '/pages/home.page.dart';
import '/pages/login.page.dart';
import 'package:flutter/material.dart';

class Sobre extends StatelessWidget {
  const Sobre({super.key});

  //tela que fala sobre a empresa
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(
          "Sobre",
          style: TextStyle(
            color: Colors.black,
            fontSize: 26,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.pop(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        },
        child: Center(
          child: Container(
            width: 250,
            height: 250,
            alignment: Alignment
                .center, // -> a propriedade alignment para centralizar o conteúdo do Container
            child: Column(
              children: [
                Text(
                  "O Sweet Bah foi fundado em 2017 por uma mulher sonhadora, Bárbara. E agora você pode ter os doces que sempre desejou no seu dia-a-dia e nos eventos mais especias da sua vida. Tudo feito com produtos de qualidade e dedicação ao seu gosto e paladar.",
                  style: TextStyle(
                    fontSize: 18,
                    //fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 0,
                ),
                //Image.asset(
                //'assets/app-logo.png',
                //width: 300,
                //height: 300,
                //),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
