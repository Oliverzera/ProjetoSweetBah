import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../pages/util.dart';
import '../pages/login.page.dart';

class LoginController {
  //
  // Criação de um nova conta de usuário
  // no Firebase Authentication
  //
  criarConta(context, nome, email, senha, celular) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: senha,
    )
        .then((result) async {
      FirebaseFirestore.instance
          .collection('usuarios')
          .doc(result.user!.uid)
          .set(
        {
          'uid': result.user!.uid,
          'nome': nome,
          'celular': celular,
        },
      ).then((value) {
        sucesso(context, 'Conta criada com sucesso!');
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
      }).catchError((e) {
        switch (e.code) {
          case 'email-already-in-use':
            erro(context, 'O email já foi cadastrado.');
            break;
          case 'invalid-email':
            erro(context, 'O formato do email é inválido.');
            break;
          default:
            erro(context, 'ERRO: ${e.code.toString()}');
        }
      });
    });
  }

  //
  // LOGIN
  // Efetuar o login de um usuário previamente cadastrado
  // no serviço Firebase Authentication
  //
  login(context, email, senha) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: senha)
        .then((resultado) {
      sucesso(context, 'Usuário autenticado com sucesso.');
      Navigator.pushNamed(context, 'home');
    }).catchError((e) {
      switch (e.code) {
        case 'invalid-email':
          erro(context, 'O formato do email é inválido.');
          break;
        case 'user-not-found':
          erro(context, 'Usuário não encontrado.');
          break;
        case 'wrong-password':
          erro(context, 'Senha incorreta.');
          break;
        default:
          erro(context, 'ERRO: ${e.code.toString()}');
      }
    });
  }

  //
  // ESQUECEU A SENHA
  // Envia uma mensagem de email para recuperação de senha para
  // um conta de email válida
  //
  esqueceuSenha(context, String email) {
    if (email.isNotEmpty) {
      FirebaseAuth.instance.sendPasswordResetEmail(
        email: email,
      );
      sucesso(context, 'Email enviado com sucesso.');
    } else {
      erro(context, 'Informe o email para recuperar a conta.');
    }
    Navigator.pop(context);
  }

  //
  // LOGOUT
  //
  logout() {
    FirebaseAuth.instance.signOut();
  }

  //
  // ID do Usuário Logado
  //
  idUsuario() {
    return FirebaseAuth.instance.currentUser!.uid;
  }

  //
  // NOME do Usuário Logado
  //

  Future<String> usuarioLogado() async {
    var usuario = '';
    await FirebaseFirestore.instance
        .collection('usuarios')
        .where('uid', isEqualTo: idUsuario())
        .get()
        .then(
      (resultado) {
        usuario = resultado.docs[0].data()['nome'] ?? '';
      },
    );
    return usuario;
  }

  Future<String> mudarNome(context, newName) async {
    var newUsername = newName;
    var userId = await idUsuario();

    FirebaseFirestore.instance
        .collection('usuarios')
        .doc(userId)
        .set({'nome': newUsername}, SetOptions(merge: true)).then((result) {
      sucesso(context, 'Nome atualizado com sucesso!');
      Navigator.of(context).pop();
    }).catchError((e) => erro(context, 'Erro na atualização'));

    return newUsername;
  }
}
