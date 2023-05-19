import '/pages/finalization.page.dart';
import '/pages/home.page.dart';
import 'package:flutter/material.dart';

class BagPage extends StatefulWidget {
  final String informacao;

  BagPage({required this.informacao});

  @override
  State<BagPage> createState() => _BagPageState();
}

//os pedidos deve passar por essa página para mais um confirmação do usuário e, caso
//ele queria adicionar mais pedidos, voltar para o cárdio e manter salvo o que já tem na sacola
class _BagPageState extends State<BagPage> {
  @override
  List<String> sacola = [];

  @override
  void initState() {
    super.initState();
    sacola.add(widget.informacao);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sacola",
          style: TextStyle(
            color: Colors.black,
            fontSize: 26,
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              'Itens na sacola:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: ListView.builder(
                itemCount: sacola.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(sacola[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
