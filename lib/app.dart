import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  TextEditingController controllerAlcool = TextEditingController();

  TextEditingController controllerGasolina = TextEditingController();

  String resultado = "";

  void calcular(){
    var valorAlcool = double.tryParse(controllerAlcool.text);
    var valorGasolina = double.tryParse(controllerGasolina.text);

    if(valorAlcool == null || valorGasolina == null){
      setState(() {
        resultado = "Digite um número maior que zero com pontos (.)";
        limparCampos();
      });
    }else if((valorAlcool / valorGasolina) >=0.7){
      setState(() {
        resultado = "É melhor abastecer com gasolina";
        limparCampos();
      });
    }else{
      setState(() {
        resultado = "É melhor abastecer com álcool";
        limparCampos();
      });
    }
  }

  void limparCampos(){
    controllerAlcool.text = "";
    controllerGasolina.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("imagens/logo.png"),
              Padding(
                padding: EdgeInsets.only(top: 60, bottom: 5),
                child: Text("Saiba qual a melhor opção para abastecimento do seu carro",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  )
                )
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço do Álcool, ex: 1.63"
                ),
                style: TextStyle(
                  fontSize: 22
                ),
                controller: controllerAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço do Gasolina, ex: 4.72"
                ),
                style: TextStyle(
                  fontSize: 22
                ),
                controller: controllerGasolina,
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: ElevatedButton(
                  onPressed: calcular,
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 48),
                    backgroundColor: Colors.blue
                  ),
                    child: Text("Calcular",
                      style: TextStyle(
                        color: Colors.white
                      )
                    )
                ),
              ),
              Text(resultado,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
