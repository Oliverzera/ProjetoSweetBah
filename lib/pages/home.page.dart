import '/pages/about.page.dart';
import '/pages/spoon_eggs.page.dart';
import '/pages/truffled_eggs.page.dart';
import '/pages/mini_eggs.page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Opaaa...'),
          content: Text(
              'Esta funcionalidade ainda não foi implementada, tente outra hora!'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:
            false, // Definir como false para remover o ícone de voltar
        title: Text(
          "Menu",
          style: TextStyle(
            color: Colors.white,
            //fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 255, 82, 91),
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: Colors.white,
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Sobre(),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          // foi criado uma coluna com os botões que levam o usuário para tela lincada com o botão
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              // -> depois que a tela estiver pronta, implementar a rota
              //onPressed: () => {
              //Navigator.push(
              //context,
              //MaterialPageRoute(
              //builder: (context) => SpoonEggs(),
              //),
              //),
              //},
              onPressed: () {
                _showDialog(context);
              },
              child: Text(
                'Ovos de Colher',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(250, 100), // Define o tamanho fixo do botão
                  backgroundColor:
                      Color.fromARGB(255, 255, 82, 91), // Cor de fundo do botão
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              // -> depois que a tela estiver pronta, implementar a rota
              //onPressed: () => {
              //Navigator.push(
              //context,
              //MaterialPageRoute(
              //builder: (context) => TruffledEggs(),
              //),
              //),
              //},
              onPressed: () {
                _showDialog(context);
              },
              child: Text(
                'Trufados',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(250, 100), // Define o tamanho fixo do botão
                  backgroundColor:
                      Color.fromARGB(255, 255, 82, 91), // Cor de fundo do botão
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MiniEggsScreen(),
                  ),
                ),
              },
              child: Text(
                'Mini Ovos',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(250, 100), // Define o tamanho fixo do botão
                  backgroundColor:
                      Color.fromARGB(255, 255, 82, 91), // Cor de fundo do botão
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ],
        ),
      ),
    );
  }
}
