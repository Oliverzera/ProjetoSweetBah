import '/pages/about.page.dart';
import '/pages/spoon_eggs.page.dart';
import '/pages/truffled_eggs.page.dart';
import '/pages/mini_eggs.page.dart';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  //pop-up que é mostrado quando o usuário clica em uma funcionalidade qeu ainda não foi incluída no app
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
            //barra que fica exposta na tela quando o usuário clica no ícone do menu
            DrawerHeader(
              child: Text(
                //nome do usuário no top do drawer acompanhado de uma foto
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
            //alterar foto
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text(
                'Alterar foto',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              onTap: () {},
            ),
            //dados pessoais
            ListTile(
              leading: Icon(Icons.person),
              title: Text(
                'Dados pessoais',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              onTap: () {},
            ),
            //cartões para pagamento e outras formas de pagamento
            ListTile(
              leading: Icon(Icons.payment),
              title: Text(
                'Pagamento',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              onTap: () {},
            ),
            //configurações gerais do app
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                'Configurações',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              onTap: () {},
            ),
            //sobre o aplicativo
            ListTile(
              leading: Icon(Icons.info_outline_rounded),
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
            //logoff do app -> volta para a página de login
            ListTile(
              leading: Icon(Icons.exit_to_app),
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
      //tela do cardápio, nela será mostado as opções diponíveis no momento.
      //assim que o usuário clicar na opção desejada, será levado para a tela
      //respectiva a imagem do cardápio
      appBar: AppBar(
        title: Text(
          "Cardápio",
          style: TextStyle(
            color: Colors.white,
            //fontWeight: FontWeight.bold,
            fontSize: 26,
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
              //aqui será mostrado
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //ovos de colher
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
                            height:
                                0), // espaço vertical entre a imagem e o texto
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
                    width: 30,
                  ),
                  //trufados
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
                            height:
                                0), // espaço vertical entre a imagem e o texto
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
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    //mini ovos
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
                            height:
                                0), // espaço vertical entre a imagem e o texto
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
                    width: 30,
                  ),
                  //barra recheada
                  InkWell(
                    onTap: () => {},
                    child: Column(
                      children: [
                        Image.asset('assets/barraRecheada.png'),
                        SizedBox(
                            height:
                                0), // espaço vertical entre a imagem e o texto
                        Text(
                          'Barra Recheada',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              //copo da felicidade
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => {},
                    child: Column(
                      children: [
                        Image.asset('assets/copoFelicidade.png'),
                        SizedBox(
                            height:
                                0), // espaço vertical entre a imagem e o texto
                        Text(
                          'Copo Felicidade',
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
                    width: 30,
                  ),
                  //brigadeiros
                  InkWell(
                    onTap: () => {},
                    child: Column(
                      children: [
                        Image.asset('assets/brigadeiros.png'),
                        SizedBox(
                            height:
                                0), // espaço vertical entre a imagem e o texto
                        Text(
                          'Brigadeiros',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => {},
                    child: Column(
                      children: [
                        Image.asset('assets/exemplo.png'),
                        SizedBox(
                            height:
                                0), // espaço vertical entre a imagem e o texto
                        Text(
                          '---------------',
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
                    width: 30,
                  ),
                  InkWell(
                    onTap: () => {},
                    child: Column(
                      children: [
                        Image.asset('assets/exemplo.png'),
                        SizedBox(
                            height:
                                0), // espaço vertical entre a imagem e o texto
                        Text(
                          '---------------',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
