import 'package:flutter/material.dart';

class CadastroScreen extends StatefulWidget {
  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  var txtNome = TextEditingController();
  var txtCelular = TextEditingController();

  @override
  void initState() {
    super.initState();
    txtNome = TextEditingController();
    txtCelular = TextEditingController();
  }

  @override
  void dispose() {
    txtNome.dispose();
    txtCelular.dispose();
    super.dispose();
  }

  void _salvarDados() {
    // Aqui você pode implementar a lógica para salvar os dados alterados
    String nome = txtNome.text;
    String celular = txtCelular.text;

    // Exemplo de exibição dos dados salvos
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Dados Salvos'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Nome: $nome'),
              Text('Telefone: $celular'),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Fechar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alterar Dados Cadastrais'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nome:',
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              controller: txtNome,
              decoration: InputDecoration(
                hintText: 'Digite seu nome',
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Telefone:',
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              controller: txtCelular,
              decoration: InputDecoration(
                hintText: 'Digite seu telefone',
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              child: Text('Salvar'),
              onPressed: () {
                _salvarDados;
                sucessoCadastral(context, 'Dados salvos com sucesso!');
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}

//
// MENSAGEM DE SUCESSO NA ALTERAÇÃO CADASTRAL
//

void sucessoCadastral(context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.greenAccent.withOpacity(0.4),
      content: Text(
        msg,
        style: const TextStyle(color: Colors.white),
      ),
      duration: const Duration(seconds: 3),
    ),
  );
}
