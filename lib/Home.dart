import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _cpfController = TextEditingController();
  TextEditingController _cnpjController = TextEditingController();
  TextEditingController _cepController = TextEditingController();
  TextEditingController _telController = TextEditingController();
  TextEditingController _dataController = TextEditingController();
  TextEditingController _moedaController = TextEditingController();
  String _valorRecuperado = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mascaras e validações"),),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [

                //CPF
                TextField(
                  controller: _cpfController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CpfInputFormatter()
                  ],
                  decoration: InputDecoration(
                    hintText: "Digite o CPF"
                  ),
                ),

                //CNPJ
                TextField(
                  controller: _cnpjController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CnpjInputFormatter()
                  ],
                  decoration: InputDecoration(
                      hintText: "Digite o CNPJ"
                  ),
                ),

                //CEP
                TextField(
                  controller: _cepController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CepInputFormatter()
                  ],
                  decoration: InputDecoration(
                      hintText: "Digite o CEP"
                  ),
                ),

                //TELEFONE
                TextField(
                  controller: _telController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    TelefoneInputFormatter()
                  ],
                  decoration: InputDecoration(
                      hintText: "Digite o telefone"
                  ),
                ),

                //DATA
                TextField(
                  controller: _dataController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    DataInputFormatter()
                  ],
                  decoration: InputDecoration(
                      hintText: "Digite a dat"
                  ),
                ),

                //MOEDA
                TextField(
                  controller: _moedaController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    RealInputFormatter(centavos: true)
                  ],
                  decoration: InputDecoration(
                      hintText: "Digite moeda"
                  ),
                ),

                ElevatedButton(
                  child: Text("Recuperar valor"),
                  onPressed: (){
                    setState(() {
                      //_valorRecuperado = _cpfController.text.toString();
                     // _valorRecuperado = _cnpjController.text.toString();
                    //  _valorRecuperado = _cepController.text.toString();
                     // _valorRecuperado = _telController.text.toString();
                      //_valorRecuperado = _dataController.text.toString();
                     // _valorRecuperado = _moedaController.text.toString();

                      String moedaBD = _moedaController.text.toString();
                      moedaBD = moedaBD.replaceAll(".", "");
                      moedaBD = moedaBD.replaceAll(",", ".");

                      double valorDouble = double.parse(moedaBD);

                      var formatador = NumberFormat("#,##0.00","pt_BR");
                      var resultado = formatador.format(valorDouble);
                      _valorRecuperado = resultado;

                        for(var item in Semana.listaDiasSemana){
                          print(item);
                        }
                    });
                  },
                ),

                Text(
                  "Valor: ${_valorRecuperado}",
                  style: TextStyle(
                    fontSize: 25
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
