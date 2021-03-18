import 'package:flutter/material.dart';

class Mensagem {
  void alerta(BuildContext context, String tituloAlerta, String mensagemAlerta) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(title: Text(tituloAlerta),
            content: Text(mensagemAlerta),
            actions: [
              RaisedButton(
              child: Text("Q ISSO LEK TMJ"),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                color: Colors.deepPurpleAccent,
                  onPressed: () {
                    _fecharTela(context);
                  },
              ),
            ],
          );
        }
    );
  }

  void _fecharTela(BuildContext context) {
    Navigator.pop(context);
  }
}