import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:imc_app/pages/resultados.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenInfo createState() => _HomeScreenInfo();
}

class _HomeScreenInfo extends State<HomeScreen> {
  final _altura = TextEditingController();
  final _peso = TextEditingController();

  bool _validate = false;

  String _result;
  String _texto1;

  @override
  void dispose() {
    _altura.dispose();
    _peso.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 0, top: 0, bottom: 10),
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('../assets/fundofit.jpg'),
                    fit: BoxFit.cover
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 0),
              decoration: BoxDecoration(
                boxShadow: [
                  new BoxShadow(
                    color: Colors.black26,
                    offset: new Offset(0.0, 2.0),
                    blurRadius: 25.0,
                  )
                ],
                color: Colors.white,
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[

                  Center(
                    child: Text(
                      'Calcule Seu IMC',
                      style:
                      TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 16, right: 16, top: 32, bottom: 8),
                    child: TextField(
                      controller: _altura,
                      style: TextStyle(fontSize: 18),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        hintText: 'Altura em Cm ex: 170',
                        errorText: _validate
                            ? 'Valor não pode ser vazio'
                            : null,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                    child: TextField(
                      controller: _peso,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      style: TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                        hintText: 'Peso em KG ex: 70',
                        errorText: _validate
                            ? 'Valor não pode ser vazio'
                            : null,
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Container(
                        margin: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Colors.green, shape: BoxShape.rectangle),
                        child: Container(
                          height: 40.0,
                          width: 1000,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.lightBlue, // background
                              onPrimary: Colors.white, // foreground
                            ),
                            onPressed: () {
                              setState(() {
                                _altura.text.isEmpty
                                    ? _validate = true
                                    : _validate = false;
                                _peso.text.isEmpty
                                    ? _validate = true
                                    : _validate = false;
                              });
                              if (_validate != true) {
                                calculateImc(double.parse(_altura.text),double.parse(_peso.text));
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ResultadosPage(
                                          resultado: _result,
                                          classificacao: _texto1,
                                        ),
                                  ),
                                );
                              }
                            },
                            child: Text('Calcular'),
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ],
        ));
  }

  calculateImc(double altura, double peso) {
    // Peso dividido pela altura ao quadrado ( peso/altura²) ;
    // ou peso dividido pela a altura vezes a altura ( peso ÷ (Altura x Altura)).
    double imc = (peso / (altura * altura)) * 10000;
    _result = "${imc.toStringAsPrecision(3)}";
    _texto1 = "";

    if (imc < 18.6)
      _texto1 += "Abaixo do normal";
    else if (imc < 25.0)
      _texto1 += "Normal";
    else if (imc < 30.0)
      _texto1 += "Sobrepeso";
    else if (imc < 35.0)
      _texto1 += "Obesidade Grau I";
    else if (imc < 40.0)
      _texto1 += "Obesidade Grau II";
    else
      _texto1 += "Obesidade Grau IIII";
  }

}
/*  // ignore: missing_return
  Widget _showTexto(){
    if(double.parse(resultado) < 29.0)
    return new Container(
      margin: EdgeInsets.only(left: 0, top: 30, bottom: 0),
      child: Text("Composto de amoras ajuda a perda de peso", style:TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueGrey)),
    );
  }

  // ignore: missing_return
  Widget _showNeedHelpButton() {
    if(double.parse(resultado) < 29.0)
    return new Padding(
        padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
          child: Material(  //Wrap with Material
          shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(22.0) ),
          elevation: 18.0,
          color: Color(0xFF801E48),
          clipBehavior: Clip.antiAlias, // Add This
          child: MaterialButton(
          minWidth: 200.0,
          height: 35,
          color: Color(0xFF801E48),
            child: new Text('Saiba Mais',
            style: new TextStyle(fontSize: 16.0, color: Colors.white)),
        onPressed: () {

        },
      ),
    ));
  }

                       _showTexto(),
                     _showNeedHelpButton(),
* */