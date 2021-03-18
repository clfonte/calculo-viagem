import 'package:flutter/material.dart';

class Labels {
  static Widget escopo(String titulo, String prefixo, TextEditingController controller, TextInputType keyboard) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: titulo,
          labelStyle: TextStyle(color: Colors.deepPurpleAccent, fontSize: 25),
          prefixText: prefixo,
          prefixStyle: TextStyle(color: Colors.deepPurple, fontSize: 25,)
        ),
        style: TextStyle(color: Colors.deepPurpleAccent[900], fontSize: 25),
        keyboardType: keyboard,
      ),
    );
  }
}