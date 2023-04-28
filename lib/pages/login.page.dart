import '/pages/reset_password.page.dart';
import '/pages/home.page.dart';
import '/pages/signup.page.dart';
import '/pages/admin.home.page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isAdmin = false;
  bool isAdminSenha = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void mensagem(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 1),
      content: Text(msg),
    ));
  }

  void _login() {
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
            //informa o email
            TextFormField(
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
            //campo de senha -> deixa escondido o que o usuário informa
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(
                fontSize: 20,
              ),
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
                      {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        ),
                      },
                    mensagem(context, "Acesso permito")
                  },
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              child: TextButton(
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
