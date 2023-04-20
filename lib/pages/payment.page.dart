import 'package:app_avaliacao/pages/finalization.page.dart';

import '/pages/home.page.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String numeroCartao = '';
  String nomeTitularCartao = '';
  String dataExpiracao = '';
  String codCvv = '';

  void _onPayButtonPressed() {
    // Lógica para processar o pagamento
    // -> implementar api pra vincular com a lógica
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pagamento",
          style: TextStyle(
            color: Colors.white,
            //fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 255, 82, 91),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Informações do Cartão de Crédito",
              style: TextStyle(
                fontSize: 18,
                //fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Número do Cartão',
              ),
              onChanged: (value) {
                setState(() {
                  numeroCartao = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Nome do Titular',
              ),
              onChanged: (value) {
                setState(() {
                  nomeTitularCartao = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Data de Expiração',
                    ),
                    onChanged: (value) {
                      setState(() {
                        dataExpiracao = value;
                      });
                    },
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'CVV',
                    ),
                    onChanged: (value) {
                      setState(() {
                        codCvv = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 26,
            ),
            ElevatedButton(
              //onPressed: _onPayButtonPressed, -> incluir o pagamento depois
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FinalizationScreen(),
                  ),
                ),
              },
              child: Text(
                'Pagar',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(250, 75), // Define o tamanho fixo do botão
                  backgroundColor:
                      Color.fromARGB(255, 255, 82, 91), // Cor de fundo do botão
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ],
        ),
      ),
    );
  }
}
