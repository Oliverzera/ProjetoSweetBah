import 'package:cloud_firestore/cloud_firestore.dart';
import '../controller/login_controller.dart';
import '/pages/home.page.dart';
import 'package:flutter/material.dart';
import '../controller/pedidos_controller.dart';
import '../model/pedido.dart';

class BagPage extends StatefulWidget {
  //final String informacao;

  //BagPage({required this.informacao});

  @override
  State<BagPage> createState() => _BagPageState();
}

//os pedidos deve passar por essa página para mais um confirmação do usuário e, caso
//ele queria adicionar mais pedidos, voltar para o cárdio e manter salvo o que já tem na sacola
class _BagPageState extends State<BagPage> {
  var txtTitulo = TextEditingController();
  var txtDescricao = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sacola",
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: PedidoController().listar().snapshots(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                  child: Text('Não foi possível conectar.'),
                );
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              default:
                final dados = snapshot.requireData;
                if (dados.size > 0) {
                  return ListView.builder(
                    itemCount: dados.size,
                    itemBuilder: (context, index) {
                      String id = dados.docs[index].id;
                      dynamic item = dados.docs[index].data();
                      return Card(
                        child: ListTile(
                          leading: Icon(Icons.description),
                          title: Text(item['modelo']),
                          subtitle: Text(item['descricao']),
                          onTap: () {
                            txtTitulo.text = item['titulo'];
                            txtDescricao.text = item['descricao'];
                            //salvarPedidos(context, docId: id);
                          },
                          onLongPress: () {
                            PedidoController().excluir(context, id);
                          },
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Text('Nenhum pedido encontrado.'),
                  );
                }
            }
          },
        ),
      ),
    );
  }
}
