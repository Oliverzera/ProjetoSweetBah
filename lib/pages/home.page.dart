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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text(
                'Nome do usuário',
                style: TextStyle(
                  color: Colors.white,
                  //fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 82, 91),
              ),
            ),
            ListTile(
              title: Text(
                'Alterar foto',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Dados pessoais',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Pagamento',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Configurações',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Sobre',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Sobre(),
                  ),
                ),
              },
            ),
            ListTile(
              title: Text(
                'Sair',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
            ),
            SizedBox(
              height: 120,
            ),
            ListTile(
              title: Text(
                "Versão 1.0",
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          "Cardápio",
          style: TextStyle(
            color: Colors.white,
            //fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 255, 82, 91),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_bag),
            onPressed: () {
              // Adicione a ação que deseja executar quando o ícone for pressionado
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            // foi criado uma coluna com os botões que levam o usuário para tela lincada com o botão
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              InkWell(
                // -> depois que a tela estiver pronta, implementar a rota
                //onPressed: () => {
                //Navigator.push(
                //context,
                //MaterialPageRoute(
                //builder: (context) => SpoonEggs(),
                //),
                //),
                //},
                onTap: () {
                  _showDialog(context);
                  // Adicione a ação que deseja executar quando a imagem for pressionada
                },
                child: Column(
                  children: [
                    Image.asset('assets/exemplo.png'),
                    SizedBox(
                        height: 0), // espaço vertical entre a imagem e o texto
                    Text(
                      'Ovos de Colher',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                // -> depois que a tela estiver pronta, implementar a rota
                //onPressed: () => {
                //Navigator.push(
                //context,
                //MaterialPageRoute(
                //builder: (context) => TruffledEggs(),
                //),
                //),
                //},
                onTap: () {
                  _showDialog(context);
                  // Adicione a ação que deseja executar quando a imagem for pressionada
                },
                child: Column(
                  children: [
                    Image.asset('assets/exemplo.png'),
                    SizedBox(
                        height: 0), // espaço vertical entre a imagem e o texto
                    Text(
                      'Trufados',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MiniEggsScreen(),
                    ),
                  ),
                },
                child: Column(
                  children: [
                    Image.asset('assets/exemplo.png'),
                    SizedBox(
                        height: 0), // espaço vertical entre a imagem e o texto
                    Text(
                      'Mini Ovos',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
