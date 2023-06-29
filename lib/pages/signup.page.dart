import 'package:flutter/material.dart';
import '/pages/login.page.dart';
import '../controller/login_controller.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  String _password = '';
  String _confirmPassword = '';
  var txtNome = TextEditingController();
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  var txtSenhaConfirmacao = TextEditingController();
  var txtCelular = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  //tela ondew será feito o cadastro do novo usuário
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          top: 10,
          left: 40,
          right: 40,
        ),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              alignment: const Alignment(
                  0.0, 1.15), // -> alinhamento do container filho
              //coloco um container com uma imagm de fundo
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: const AssetImage(
                      "assets/profile-picture.png"), //pega a altura da pagina
                  fit: BoxFit.fitHeight,
                ),
              ),
              //container pra colocar o icone sobre a imagem
              child: Container(
                height: 56,
                width: 56,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.3, 1.0],
                    colors: [
                      //degrade na cor
                      Color.fromARGB(255, 255, 82, 91),
                      Color.fromARGB(255, 255, 82, 91),
                    ],
                  ),
                  //deixa as pontas do quadrado arredondadas
                  border: Border.all(
                    width: 4.0,
                    color: const Color(0xFFFFFFFF),
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(56),
                  ),
                ),
                child: SizedBox.expand(
                  child: TextButton(
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //campo nome
            TextFormField(
              controller: txtNome,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: "Nome",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            //campo email
            TextFormField(
              controller: txtEmail,
              //aparecer o @ como padrão no teclado
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: "E-mail",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            //campo senha
            TextFormField(
              controller: txtSenha,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              //verificação da senha
              style: const TextStyle(fontSize: 20),
              onChanged: (value) => _password = value,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Campo obrigatório';
                }
                if (value.length < 6) {
                  return 'Senha deve conter pelo menos 6 caracteres';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            //campo de confirmação de senha
            TextFormField(
              controller: txtSenhaConfirmacao,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: "Confirme sua senha",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: const TextStyle(fontSize: 20),
              onChanged: (value) => _confirmPassword = value,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Campo obrigatório';
                }
                if (value != _password) {
                  return 'Senhas não correspondem';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            //campo celular
            TextFormField(
              controller: txtCelular,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: "Celular",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 25,
            ),
            //botão de confirmação do cadastro
            Container(
              height: 50,
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.3, 1],
                  colors: [
                    Color.fromARGB(255, 255, 82, 91),
                    Color.fromARGB(255, 255, 82, 91),
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              //pega o container todo
              child: SizedBox.expand(
                child: TextButton(
                  child: const Text(
                    "Cadastrar",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () => {
                    LoginController().criarConta(
                      context,
                      txtNome.text,
                      txtEmail.text,
                      txtSenha.text,
                      txtCelular.text,
                    ),
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            //botão de cancelamento de cadastro
            Container(
              height: 40,
              alignment: Alignment.center,
              child: TextButton(
                child: const Text(
                  "Cancelar",
                  textAlign: TextAlign.center,
                ),
                onPressed: () => Navigator.pop(context, false),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
