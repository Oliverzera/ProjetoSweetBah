import 'package:app_avaliacao/controller/pedidos_controller.dart';
import 'package:app_avaliacao/model/pedido.dart';
import 'package:app_avaliacao/pages/bag.page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/pages/home.page.dart';
import '/pages/payment.page.dart';

class MiniEggsScreen extends StatefulWidget {
  const MiniEggsScreen({Key? key}) : super(key: key);

  @override
  _MiniEggsScreenState createState() => _MiniEggsScreenState();
}

class _MiniEggsScreenState extends State<MiniEggsScreen> {
  //variáveis de controle dos campos aprensentados na tela
  bool _trio1 = false;
  bool _trio2 = false;
  bool _trio3 = false;
  bool _saborBarraNinho = false;
  bool _saborBarraBrigadeiroGourmet = false;
  int _opcaoSelecionada = 0;
  bool _opcaoSelecionada1 = false;
  bool _opcaoSelecionada2 = false;
  bool _opcaoSelecionada3 = false;
  int _quantidadeSelecionada = 1;
  int _opcaoSelecionadaInfoPedido = 0;
  TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: UniqueKey(), // -> adicionar uma chave única para
      // cada widget, para ajudar o Flutter a identificar o
      // widget de forma mais eficiente. key: UniqueKey()
      // como um argumento para o construtor.
      appBar: AppBar(
        title: Text(
          "Mini Ovos",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 255, 82, 91),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //limitei por escolher uma opção por vez, se o usuário quiser outra coisa
                //que está na mesma tela, ele deve finizar o que está pedindo e na tela de sacola
                //voltar para a tela do cardápio
                Text(
                  "Selecione a opção deseja:",
                  style: TextStyle(fontSize: 18),
                ),
                CheckboxListTile(
                  title: Text("Trio com barra - R55,00"),
                  value: _opcaoSelecionada1,
                  onChanged: (value) {
                    setState(() {
                      _opcaoSelecionada1 = value!;
                      _opcaoSelecionada2 = false;
                      _opcaoSelecionada3 = false;
                    });
                  },
                ),
                // DropdownButtonFormField<int>(
                // value: _quantidadeSelecionada,
                // onChanged: (value) {
                // setState(() {
                // _quantidadeSelecionada = value!;
                //});
                //},
                //items: List.generate(10, (index) {
                //return DropdownMenuItem<int>(
                //value: index + 1,
                //child: Text("${index + 1}"),
                //);
                //}),
                //),

                //opções que o usuário pode pedir
                CheckboxListTile(
                  title: Text("Trio sem barra - R30,00"),
                  value: _opcaoSelecionada2,
                  onChanged: (value) {
                    setState(() {
                      _opcaoSelecionada2 = value!;
                      _opcaoSelecionada1 = false;
                      _opcaoSelecionada3 = false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Kit confeiteiro - R52,00"),
                  value: _opcaoSelecionada3,
                  onChanged: (value) {
                    setState(() {
                      _opcaoSelecionada3 = value!;
                      _opcaoSelecionada1 = false;
                      _opcaoSelecionada2 = false;
                    });
                  },
                ),
                SizedBox(
                  height: 26,
                ),
                //trio que o usupario pode escolher
                Text(
                  "Escolha seu trio:",
                  style: TextStyle(fontSize: 18),
                ),
                CheckboxListTile(
                  title: Text("Trio 1 -> Ferrero - Ninho com Brownie - Ninho"),
                  value: _trio1,
                  onChanged: (bool? value) {
                    setState(() {
                      _trio1 = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Trio 2 -> Kit kat - Brigadeiro - Beijinho"),
                  value: _trio2,
                  onChanged: (bool? value) {
                    setState(() {
                      _trio2 = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text(
                      "Trio 3 -> Ninho com Nutella - Torta de Limão - Brigadeiro"),
                  value: _trio3,
                  onChanged: (bool? value) {
                    setState(() {
                      _trio3 = value!;
                    });
                  },
                ),
                SizedBox(
                  height: 26,
                ),
                Text(
                  "Sabor da barra:",
                  style: TextStyle(fontSize: 18),
                ),
                CheckboxListTile(
                  title: Text("Ninho"),
                  value: _saborBarraNinho,
                  onChanged: (bool? value) {
                    setState(() {
                      _saborBarraNinho = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Brigadeiro Gourmet"),
                  value: _saborBarraBrigadeiroGourmet,
                  onChanged: (bool? value) {
                    setState(() {
                      _saborBarraBrigadeiroGourmet = value!;
                    });
                  },
                ),
                SizedBox(
                  height: 26,
                ),
                //forma de recebimento do produto
                Text(
                  "Opções do pedido:",
                  style: TextStyle(fontSize: 18),
                ),
                TextFormField(
                  keyboardType: TextInputType.datetime,
                  controller: _dateController,
                  decoration: InputDecoration(
                    labelText: "Para",
                    labelStyle: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                    ),
                  ),
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(
                  height: 10,
                ),
                RadioListTile(
                  title: Text("Retirada"),
                  value: 1,
                  groupValue: _opcaoSelecionadaInfoPedido,
                  onChanged: (value) {
                    setState(() {
                      _opcaoSelecionadaInfoPedido = value as int;
                    });
                  },
                ),
                RadioListTile(
                  title: Text("Entrega"),
                  value: 2,
                  groupValue: _opcaoSelecionadaInfoPedido,
                  onChanged: (value) {
                    setState(() {
                      _opcaoSelecionadaInfoPedido = value as int;
                    });
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Endereço",
                    labelStyle: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                    ),
                  ),
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(
                  height: 26,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        var opcao = "";
                        if (_opcaoSelecionada1) {
                          opcao = "1";
                        } else if (_opcaoSelecionada2) {
                          opcao = "2";
                        } else {
                          opcao = "3";
                        }

                        var p = Pedido(
                            FirebaseAuth.instance.currentUser!.uid,
                            opcao,
                            _trio1.toString(),
                            _trio2.toString(),
                            _trio3.toString(),
                            _saborBarraNinho.toString(),
                            _saborBarraBrigadeiroGourmet.toString(),
                            _dateController.toString(),
                            _opcaoSelecionadaInfoPedido.toString());
                        PedidoController().adicionar(context, p);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentScreen(),
                          ),
                        );
                      },
                      //botão de confirmação do pedido.
                      //o usupario será levado para a tela de sacola, para fazer a última confirmação
                      child: Text(
                        'Confirmar pedido',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      style: ElevatedButton.styleFrom(
                          minimumSize:
                              Size(250, 75), // Define o tamanho fixo do botão
                          backgroundColor: Color.fromARGB(
                              255, 255, 82, 91), // Cor de fundo do botão
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
