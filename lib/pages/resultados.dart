import 'package:flutter/material.dart';

class ResultadosPage extends StatelessWidget{
  ResultadosPage({this.resultado,this.classificacao}); /* Esse é o creator que vai receber os dados */
  final String resultado;
  final String classificacao;
  String textoorganizado;
  String imagemorganizada;

  @override
  Widget build(BuildContext context) {
    organizarTextos();
    organizarImagens();
    return MaterialApp(
        title: 'Resultados',
        home: Scaffold(
            appBar: AppBar(
              title: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage:NetworkImage("../assets/imc_logo.png"),
                      radius: 20.0,
                      backgroundColor: Colors.transparent,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 0, right: 0,bottom: 0),
                      child: Text("Resultados"),
                    )
                  ],
                ),
              ),

              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: (){
                  Navigator.pop(context,true);
                },
              ),
              automaticallyImplyLeading: false,
              backgroundColor: Colors.teal,
              ),
         body: new Container(
                 color: Colors.white,
                  alignment: Alignment.topCenter,
                 child: Column(
                   children: [
                     Image.asset(imagemorganizada),
                     SizedBox(
                        width: 50,
                       height: 50,
                     ),
                     Text("Seu IMC é : " + resultado,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'RobotoMono',color: Colors.teal),),
                     Card(
                       color: Colors.greenAccent[150],
                       clipBehavior: Clip.antiAlias,
                       child: Column(
                         children: [
                           ListTile(
                             title: Text(
                               classificacao,
                               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.teal),
                             ),
                             leading: ConstrainedBox(
                               constraints: BoxConstraints(
                                 minWidth: 33,
                                 minHeight: 33,
                                 maxWidth: 33,
                                 maxHeight: 33,
                               ),
                               child: Image.asset(imagemorganizada, fit: BoxFit.fill),
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.all(16.0),
                             child: Column(
                               children: [
                                 Row(
                                   children: <Widget>[
                                     Flexible(
                                       child: Text(textoorganizado, style:TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.teal)),
                                     ),

                                   ],
                                 ),
                               ],
                             ),
                           ),
                       ],
                       ),
                     ),
                   ],
                 )
              ),
        ),
    );
  }

  organizarTextos(){
    double result = double.parse(resultado);
    textoorganizado = "";
    if (result < 18.5)
      textoorganizado += "Procure um médico. "
          "Algumas pessoas têm um baixo peso "
          "por características do seu organismo "
          "e tudo bem. Outras podem estar enfrentando "
          "problemas, como a desnutrição. "
          "É preciso saber qual é o caso.";
    else if (result < 24.9)
      textoorganizado += "Que bom que você está com o"
          " peso normal! E o melhor jeito de continuar "
          "assim é mantendo um estilo de vida ativo e uma"
          " alimentação equilibrada.";
    else if (result < 29.9)
      textoorganizado += "Ele é, na verdade, uma pré-obesidade e "
          "muitas pessoas nessa faixa já apresentam doenças associadas, "
          "como diabetes e hipertensão. "
          "Importante rever hábitos e buscar ajuda antes de, por uma série "
          "de fatores, entrar na faixa da obesidade pra valer.";
    else if (result < 34.9)
      textoorganizado += "Sinal de alerta! Chegou na hora de se cuidar, "
          "mesmo que seus exames sejam normais. Vamos dar início a mudanças hoje! "
          "Cuide de sua alimentação. Você precisa iniciar um acompanhamento com "
          "nutricionista e/ou endocrinologista.";
    else if (result < 39.9)
      textoorganizado += "Mesmo que seus exames aparentem estar normais, é hora de se cuidar, "
          "iniciando mudanças no estilo de vida com o acompanhamento próximo de profissionais de saúde.";
    else
      textoorganizado += "Aqui o sinal é vermelho, com forte probabilidade de já "
          "existirem doenças muito graves associadas. O tratamento deve ser ainda mais urgente.";

  }
  organizarImagens(){
    double result = double.parse(resultado);
    imagemorganizada = "";
    if (result < 18.5)
      imagemorganizada += "../assets/imc_06.png";
    else if (result < 24.9)
      imagemorganizada += "../assets/imc_05.png";
    else if (result < 29.9)
      imagemorganizada += "../assets/imc_04.png";
    else if (result < 34.9)
      imagemorganizada += "../assets/imc_03.png";
    else if (result < 39.9)
      imagemorganizada += "../assets/imc_02.png";
    else
      imagemorganizada += "../assets/imc_01.png";
  }


}
