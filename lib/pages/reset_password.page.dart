import 'package:flutter/material.dart';
import '../controller/login_controller.dart';
import '/pages/login.page.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPage();
}

void mensagem(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: Duration(seconds: 5),
    content: Text(msg),
  ));
}

class _ResetPasswordPage extends State<ResetPasswordPage> {
  var txtEmailEsqueceuSenha = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  //tela em que o usuário conseguirá resgatar sua senha esquecida
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset("assets/reset-password-icon.png"),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Esqueceu sua senha?",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Identifique-se para receber um e-mail com as instruções e o link para criar uma nova senha.",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: txtEmailEsqueceuSenha,
                    //informa o email
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "E-mail",
                      labelStyle: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.3, 1],
                        // ignore: prefer_const_literals_to_create_immutables
                        colors: [
                          Color.fromARGB(255, 255, 82, 91),
                          Color.fromARGB(255, 255, 73, 82),
                        ],
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: SizedBox.expand(
                      child: TextButton(
                        //confirma a solicitação do email
                        child: Text(
                          "Enviar",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () => {
                          LoginController().esqueceuSenha(
                            context,
                            txtEmailEsqueceuSenha.text,
                          ),
                          Navigator.pop(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          ),
                          mensagem(context,
                              "Verifique o seu email, a recuperação de senha já foi enviada!/n olha na caixa de spam também...")
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
