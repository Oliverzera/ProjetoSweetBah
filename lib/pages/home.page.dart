import '../controller/login_controller.dart';
import '/pages/about.page.dart';
import '/pages/mini_eggs.page.dart';
import '/pages/payment.page.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //pop-up que é mostrado quando o usuário clica em uma funcionalidade qeu ainda não foi incluída no app
  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Opaaa...'),
          content: const Text(
              'Esta funcionalidade ainda não foi implementada, tente outra hora!'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Fechar'),
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
            const SizedBox(
              height: 30,
            ),
            FutureBuilder<String>(
                future: LoginController().usuarioLogado(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Center(
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          const Text('Bem-vindo, ',
                              style: TextStyle(fontSize: 20)),
                          Text('${snapshot.data}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20))
                        ],
                      ),
                    );
                  }

                  return const Text(
                    'Bem-vindo, usuário',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  );
                }),
            //alterar foto
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text(
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
              leading: const Icon(Icons.person),
              title: const Text(
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
              leading: const Icon(Icons.payment),
              title: const Text(
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
                    builder: (context) => const PaymentScreen(),
                  ),
                )
              },
            ),
            //configurações gerais do app
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text(
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
              leading: const Icon(Icons.info_outline_rounded),
              title: const Text(
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
                    builder: (context) => const Sobre(),
                  ),
                ),
              },
            ),
            const SizedBox(
              height: 120,
            ),
            const ListTile(
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
        title: const Text(
          "Cardápio",
          style: TextStyle(
            color: Colors.white,
            //fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 82, 91),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag),
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
              const SizedBox(
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
                        const SizedBox(
                            height:
                                0), // espaço vertical entre a imagem e o texto
                        const Text(
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
                  const SizedBox(
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
                        const SizedBox(
                            height:
                                0), // espaço vertical entre a imagem e o texto
                        const Text(
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
              const SizedBox(
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
                          builder: (context) => const MiniEggsScreen(),
                        ),
                      ),
                    },
                    child: Column(
                      children: [
                        Image.asset('assets/exemplo.png'),
                        const SizedBox(
                            height:
                                0), // espaço vertical entre a imagem e o texto
                        const Text(
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
                  const SizedBox(
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
                        const SizedBox(
                            height:
                                0), // espaço vertical entre a imagem e o texto
                        const Text(
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
              const SizedBox(
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
                        const SizedBox(
                            height:
                                0), // espaço vertical entre a imagem e o texto
                        const Text(
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
                  const SizedBox(
                    width: 30,
                  ),
                  //brigadeiros
                  InkWell(
                    onTap: () => {},
                    child: Column(
                      children: [
                        Image.asset('assets/brigadeiros.png'),
                        const SizedBox(
                            height:
                                0), // espaço vertical entre a imagem e o texto
                        const Text(
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
              const SizedBox(
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
                        const SizedBox(
                            height:
                                0), // espaço vertical entre a imagem e o texto
                        const Text(
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
                  const SizedBox(
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
                        const SizedBox(
                            height:
                                0), // espaço vertical entre a imagem e o texto
                        const Text(
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
