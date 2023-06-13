import 'package:app_avaliacao/controller/login_controller.dart';
import 'package:app_avaliacao/pages/cadastral_changes.page.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '/pages/about.page.dart';
import '/pages/spoon_eggs.page.dart';
import '/pages/truffled_eggs.page.dart';
import '/pages/mini_eggs.page.dart';
import '/pages/payment.page.dart';

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
            FutureBuilder<String>(
              future: LoginController().usuarioLogado(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Directionality(
                    textDirection: TextDirection.ltr,
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        textStyle: TextStyle(fontSize: 22),
                      ),
                      onPressed: () {
                        LoginController().logout();
                        Navigator.pushReplacementNamed(context, 'login');
                      },
                      icon: Icon(Icons.exit_to_app, size: 15),
                      label: Text(snapshot.data.toString()),
                    ),
                  );
                  return Text('');
                } else {
                  return CircularProgressIndicator();
                }
              },
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
              onTap: () {
                _showDialog(context);
              },
            ),
            //dados pessoais
            ListTile(
              leading: Icon(Icons.person),
              title: Text(
                'Altere os dados pessoais',
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
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentScreen(),
                  ),
                )
              },
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
              onTap: () {
                _showDialog(context);
              },
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
                          'Ovos de \nColher',
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
                          '\nTrufados',
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
                          '\nMini Ovos',
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
                    onTap: () {
                      _showDialog(context);
                      // Adicione a ação que deseja executar quando a imagem for pressionada
                    },
                    child: Column(
                      children: [
                        Image.asset('assets/barraRecheada.png'),
                        SizedBox(
                            height:
                                0), // espaço vertical entre a imagem e o texto
                        Text(
                          'Barra \nRecheada',
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
                    onTap: () {
                      _showDialog(context);
                      // Adicione a ação que deseja executar quando a imagem for pressionada
                    },
                    child: Column(
                      children: [
                        Image.asset('assets/copoFelicidade.png'),
                        SizedBox(
                            height:
                                0), // espaço vertical entre a imagem e o texto
                        Text(
                          'Copo da \nFelicidade',
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
                          '\nBrigadeiros',
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
                  //Cápsula de Chocolate com Cappuccino
                  InkWell(
                    onTap: () {
                      _showDialog(context);
                      // Adicione a ação que deseja executar quando a imagem for pressionada
                    },
                    child: Column(
                      children: [
                        Image.asset('assets/capsulaChocolateCapp.png'),
                        SizedBox(
                            height:
                                0), // espaço vertical entre a imagem e o texto
                        Text(
                          'Cápsula de\nChocolate com\nCappuccino',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  InkWell(
                    onTap: () {
                      _showDialog(context);
                      // Adicione a ação que deseja executar quando a imagem for pressionada
                    },
                    child: Column(
                      children: [
                        Image.asset('assets/bah1.png'),
                        SizedBox(
                            height:
                                0), // espaço vertical entre a imagem e o texto
                        Text(
                          '\n\n---------------',
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
