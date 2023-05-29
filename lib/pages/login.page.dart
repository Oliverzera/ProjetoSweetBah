import '/pages/reset_password.page.dart';
import '/pages/home.page.dart';
import '/pages/signup.page.dart';
import '/pages/admin.home.page.dart';
import '../controller/login_controller.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //variáveis usadas para controlar ações específicas da tela de login
  bool isAdmin = false;
  bool isAdminSenha = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  void _login() {
    //validação que verifica se é o admin que está estradando no app
    if (_formKey.currentState!.validate()) {
      if (_emailController.text == "admin@bah.com" &&
          _passwordController.text == "123456") {
        isAdmin = true;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AdminHomePage()),
        );
      } else {
        isAdmin = false;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        mensagem(context, "Acesso negado");
      }
    }
  }

  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //configura o posicionamento do container
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            //logo do app -> topo de tudo
            SizedBox(
              width: 128,
              height: 128,
              child: Image.asset('logo.png'),
            ),
            SizedBox(
              height: 20,
            ),
            //entrada do email do usuário
            TextFormField(
              controller: txtEmail,
              //coloca o @ no teclado celular quando o usuário clicar pra informar algo
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: "E-mail",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  )),
              style: TextStyle(
                fontSize: 20,
              ),
              onChanged: (value) {
                //validando se é o email do admin
                if (value == "admin@bah.com") {
                  isAdmin = true;
                } else {
                  isAdmin = false;
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            //campo de senha -> deixa a senha em modo obscuro se o usuário clicar no ícone
            TextFormField(
              controller: txtSenha,
              keyboardType: TextInputType.text,
              obscureText: _obscureText,
              decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
              ),
              style: TextStyle(
                fontSize: 20,
              ),
              //validando se é a senha do admin
              onChanged: (value) {
                if (value == "123456") {
                  isAdminSenha = true;
                } else {
                  isAdminSenha = false;
                }
              },
            ),
            Container(
              height: 40,
              alignment: Alignment.centerRight,
              child: TextButton(
                child: Text(
                  //botão de recuperação de senha -> o usuário é levado para outra tela do app
                  "Recuperar Senha",
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 255, 82, 91),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResetPasswordPage(),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              //botão de confirmação de login
              height: 50,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
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
              child: SizedBox.expand(
                child: TextButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  onPressed: () => {
                    // se for o Admin, será laçado para uma tela específica
                    if (isAdmin)
                      {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdminHomePage(),
                          ),
                        ),
                      }
                    else
                      //caso seja usuário, será lançado para o cardápio
                      {
                        LoginController().login(
                          context,
                          txtEmail.text,
                          txtSenha.text,
                        ),
                      },
                  },
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              child: TextButton(
                //botão qque encaminhará o usuário para outra tela
                child: Text(
                  "Cadastre-se",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 255, 82, 91),
                  ),
                ),
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignupPage(),
                    ),
                  ),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
