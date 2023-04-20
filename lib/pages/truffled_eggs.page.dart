import 'package:flutter/material.dart';
import '/pages/home.page.dart';
import '/pages/payment.page.dart';

class TruffledEggs extends StatelessWidget {
  const TruffledEggs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:
            false, // Definir como false para remover o ícone de voltar
        title: Text(
          "Ovos Trufados",
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 255, 73, 82),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () => Navigator.pop(context),
        ),
        //body: ListView.builder(
        //itemCount: options.length,
        //itemBuilder: (BuildContext context, int index) {
        //return CheckboxListTile(
        //title: Text(options[index]),
        //value: selectedOptions[index],
        //onChanged: (bool value) {
        //setState(() {
        //selectedOptions[index] = value;
        //});
        //*},
        //);
        //  },
        //),
      ),
    );
  }
}
