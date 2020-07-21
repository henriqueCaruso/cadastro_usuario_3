import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

import '../entidades/usuario.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final nomeController = TextEditingController();
  final idadeController = TextEditingController();
  final emailController = TextEditingController();

  String iconLink;

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _form = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  void salvarUsuario() {
    if (!_form.currentState.validate()) {
      _scaffoldKey.currentState
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            duration: Duration(
              seconds: 2,
            ),
            content: Text(
              'Dados inválidos!',
              style: TextStyle(fontSize: 18),
            ),
            backgroundColor: Colors.red,
          ),
        );

      return;
    } else {
      var novoUsuario = Usuario(nomeController.text,
          int.tryParse(idadeController.text), emailController.text, iconLink);
      setState(() {
        Navigator.of(context).pop(novoUsuario);
        nomeController.clear();
        idadeController.clear();
        emailController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Cadastro de Usuário'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Form(
                key: _form,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                        labelStyle: TextStyle(color: Colors.teal),
                        labelText: 'Nome completo',
                      ),
                      validator: (valor) {
                        if (valor.length < 3) return 'Nome muito curto';
                        if (valor.length > 30) return 'Nome muito longo';
                        return null;
                      },
                      controller: nomeController,
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                        labelStyle: TextStyle(color: Colors.teal),
                        labelText: 'Idade',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (valor) {
                        if ((int.tryParse(valor) ?? 0) <= 0)
                          return 'Idade Inválida';
                        return null;
                      },
                      controller: idadeController,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                        labelStyle: TextStyle(color: Colors.teal),
                        labelText: 'Email',
                      ),
                      validator: (valor) {
                        if (!EmailValidator.validate(valor)) {
                          return 'Email invalido';
                        } else {
                          iconLink =
                              'https://www.gravatar.com/avatar/${md5.convert(utf8.encode('$valor'))}';
                        }

                        return null;
                      },
                      controller: emailController,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            Divider(),
            Container(
              width: double.maxFinite,
              child: OutlineButton(
                onPressed: salvarUsuario,
                child: Text(
                  'Salvar',
                  style: TextStyle(fontSize: 18),
                ),
                textColor: Colors.teal,
                borderSide: BorderSide(
                  color: Colors.teal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
