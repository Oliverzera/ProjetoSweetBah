import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/pedido.dart';
import '../pages/util.dart';
import 'login_controller.dart';

class PedidoController {
  void adicionar(context, Pedido p) {
    FirebaseFirestore.instance
        .collection('pedido')
        .add(p.toJson())
        .then((value) => sucesso(context, 'Pedido adicionado com sucesso'))
        .catchError((e) => erro(context, 'ERRO: ${e.code.toString()}'))
        .whenComplete(() => Navigator.of(context).pop());
  }

  void atualizar(context, id, Pedido p) {
    FirebaseFirestore.instance
        .collection('pedido')
        .doc(id)
        .update(p.toJson())
        .then((value) => sucesso(context, 'Pedido atualizado com sucesso'))
        .catchError((e) => erro(context, 'ERRO: ${e.code.toString()}'))
        .whenComplete(() => Navigator.of(context).pop());
  }

  void excluir(context, id) {
    FirebaseFirestore.instance
        .collection('pedido')
        .doc(id)
        .delete()
        .then((value) => sucesso(context, 'Pedido excluído com sucesso'))
        .catchError((e) => erro(context, 'ERRO: ${e.code.toString()}'));
  }

  listar() {
    return FirebaseFirestore.instance
        .collection('pedido')
        .where('uid', isEqualTo: LoginController().idUsuario());
  }
}
