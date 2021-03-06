import 'package:brasil_fields/brasil_fields.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:validadores/Validador.dart';

class Formulario extends StatefulWidget {
  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {

  TextEditingController _cpfController = TextEditingController(text: "410.906.098-25");
  TextEditingController _nomeController = TextEditingController(text: "David");
  TextEditingController _idadeController = TextEditingController(text: "27");

  final _formKey = GlobalKey<FormState>();
  String _mensagem = "";
  String _nome;
  String _idade;
  String _cpf;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Formulário"),),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nomeController,
                    decoration: InputDecoration(
                      hintText: "Digite seu nome"
                    ),
                    onSaved: (valor){
                      _nome = valor;
                    },
                    validator: (valor){
                      return Validador()
                          .add(Validar.OBRIGATORIO,msg: "Campo obrigatório")
                          .minLength(5,msg: "Digite ao menos 5 caracteres")
                          .valido(valor);

                    },
                  ),
                  TextFormField(
                    controller: _cpfController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "Digite seu CPF"
                    ),
                    onSaved: (valor){
                      _cpf = valor;
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CpfInputFormatter()
                    ],
                    validator: (valor){

              /*        if(valor.isEmpty){
                        return "Campo obrigatório";
                      }
                      if(!CPFValidator.isValid(valor)){
                        return "CPF Inválido";
                      }*/

                      return Validador()
                          .add(Validar.OBRIGATORIO,msg: "Campo obrigatório")
                          .add(Validar.CPF,msg:"CPF Inválido")
                          .valido(valor);

                    },
                  ),
                  TextFormField(
                    controller: _idadeController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "Digite sua idade"
                    ),
                    onSaved: (valor){
                      _idade = valor;
                    },
                    validator: (valor){
                      return Validador()
                          .add(Validar.OBRIGATORIO,msg: "Campo obrigatório")
                          .valido(valor);
                    },
                  ),

                  ElevatedButton(
                    child: Text("Salvar"),
                    onPressed: (){
                        if(_formKey.currentState.validate()){
                         print( "to valido");
                         _formKey.currentState.save();
                         setState(() {
                          /* _nome = _nomeController.text;
                           _idade = _idadeController.text;
                           _cpf = _cpfController.text;*/
                           _mensagem = "Nome: ${_nome}, Idade: ${_idade}, CPF: ${_cpf}";
                         });
                        }
                    },
                  ),
                  Text(_mensagem,style: TextStyle(fontSize: 25),)

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
