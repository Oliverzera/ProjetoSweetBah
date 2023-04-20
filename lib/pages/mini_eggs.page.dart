import 'package:flutter/material.dart';
import '/pages/home.page.dart';
import '/pages/payment.page.dart';

class MiniEggsScreen extends StatefulWidget {
  const MiniEggsScreen({super.key});

  @override
  _MiniEggsScreenState createState() => _MiniEggsScreenState();
}

class _MiniEggsScreenState extends State<MiniEggsScreen> {
  bool _trio1 = false;
  bool _trio2 = false;
  bool _trio3 = false;
  bool _saborBarraNinho = false;
  bool _saborBarraBrigadeiroGourmet = false;
  int _opcaoSelecionada = 0;
  int _opcaoSelecionadaInfoPedido = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mini Ovos",
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 255, 73, 82),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Selecione a opção deseja:",
                style: TextStyle(fontSize: 18),
              ),
              RadioListTile(
                title: Text("Trio com barra - R55,00"),
                value: 1,
                groupValue: _opcaoSelecionada,
                onChanged: (value) {
                  setState(() {
                    _opcaoSelecionada = value as int;
                  });
                },
              ),
              RadioListTile(
                title: Text("Trio sem barra - R30,00"),
                value: 2,
                groupValue: _opcaoSelecionada,
                onChanged: (value) {
                  setState(() {
                    _opcaoSelecionada = value as int;
                  });
                },
              ),
              RadioListTile(
                title: Text("Kit confeiteiro - R52,00"),
                value: 3,
                groupValue: _opcaoSelecionada,
                onChanged: (value) {
                  setState(() {
                    _opcaoSelecionada = value as int;
                  });
                },
              ),
              SizedBox(
                height: 26,
              ),
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
              Text(
                "Opções do pedido:",
                style: TextStyle(fontSize: 18),
              ),
              TextFormField(
                keyboardType: TextInputType.datetime,
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
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentScreen(),
                        ),
                      ),
                    },
                    child: Text(
                      'Finalizar pedido',
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
    );
  }
}
