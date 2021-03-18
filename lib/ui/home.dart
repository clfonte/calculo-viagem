import 'package:calculo_viagem/ui/mensagem.dart';
import 'package:calculo_viagem/widget/labels.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // funcoes e variaveis
  final distanciaController     = TextEditingController();
  final combustivelController   = TextEditingController();
  final mediaConsumoController  = TextEditingController();
  var mensagem  = Mensagem();
  var resultado = "";
  var custo     = "";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent[100],
        title: Text("CUSTO MÉDIO DE VIAGEM"),
      ),

      // corpo do app
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Labels.escopo("Distancia", "KM ", distanciaController, TextInputType.number),
          Labels.escopo("Valor combustivel", "R\$ ", combustivelController, TextInputType.number),
          Labels.escopo("Media de consumo", "\% ", mediaConsumoController, TextInputType.number),

          botao("Calculo", calculo),

          botao("INFO", info)
        ],
      ),
    );
  }

  // botao para mostrar resultado
  Widget botao(String texto, Function clique) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          child: Text(texto, style: TextStyle(color: Colors.white, fontSize: 25),),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: Colors.deepPurpleAccent,
          onPressed: clique,
        )
      ],
    );
  }

  // informacoes
  void info() {
    mensagem.alerta(context, "SE LIGA NESSAS INFOS", "Copyright© 2019-2021, Camila Lima Company. Todos os direitos reservados, ou não.");
    setState(() {
    });
  }

  void calculo() {
    // VALIDACAO -------
    if (distanciaController.text.isEmpty) {
      mensagem.alerta(context, "ATENÇÃO", "NÃO DEIXE O CAMPO COM A DISTÂNCIA EM BRANCO");
      return;
    }
    if (combustivelController.text.isEmpty) {
      mensagem.alerta(context, "ATENÇÃO", "NÃO DEIXE O CAMPO COM O VALOR DO COMBUSTIVEL EM BRANCO");
      return;
    }
    if (mediaConsumoController.text.isEmpty) {
      mensagem.alerta(context, "ATENÇÃO", "NÃO DEIXE O CAMPO DA MÉDIA E CONSUMO EM BRANCO");
      return;
    }
    // ----------------
    // (km / media) * preco
    double distanciaKM = double.parse(distanciaController.text);
    double consumoEstimado = double.parse(mediaConsumoController.text);
    double precoCombustivel = double.parse(combustivelController.text);
    //double custo = double.parse(resultado.text);

    double resultado = ((distanciaKM / consumoEstimado) * precoCombustivel);

    mensagem.alerta(context, "O CUSTO DESSA PASSEATA É O SEGUINTE ", "R\$ " + resultado.toString());
  }
}
