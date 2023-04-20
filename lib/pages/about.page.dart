import 'package:app_avaliacao/pages/home.page.dart';

import '/pages/login.page.dart';
import 'package:flutter/material.dart';

class Sobre extends StatelessWidget {
  const Sobre({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:
            false, // Definir como false para remover o ícone de voltar
        titleSpacing: 0,
        backgroundColor: Color.fromARGB(255, 255, 82, 91),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            style: TextButton.styleFrom(
              primary: Colors.white, // Cor do texto
            ),
            child: Row(
              children: [
                Text(
                  'Saída',
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(width: 8),
                Icon(Icons.logout),
              ],
            ),
          ),
        ],
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
            child: Text(
              "O Sweet Bah foi fundado em 2017 por uma mulher sonhadora, Bárbara. E agora você pode ter os doces que sempre desejou no seu dia-a-dia e nos eventos mais especias da sua vida. Tudo feito com produtos de qualidade e dedicação ao seu gosto e paladar.",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              //textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
