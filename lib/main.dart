import 'package:cadastro_usuario_growdev/pages/cadastro_page.dart';
import 'package:cadastro_usuario_growdev/pages/tela_inicial.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro Usuario',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        "/": (ctx) => TelaInicial(),
        "/cadastro-usuario": (ctx) => CadastroPage(),
      },
    );
  }
}
