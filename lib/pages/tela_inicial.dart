import 'package:cadastro_usuario_growdev/entidades/usuarios_base.dart';
import 'package:flutter/material.dart';

import '../entidades/usuario.dart';

class TelaInicial extends StatefulWidget {
  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  UsuarioBase userBase = UsuarioBase();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Lista de Usuários'),
        centerTitle: true,
        actions: [
          FlatButton(
            child: Icon(
              Icons.add_box,
              color: Colors.white,
            ),
            onPressed: () async {
              var newUser = await Navigator.of(context).pushNamed(
                '/cadastro-usuario',
              );
              setState(() {
                userBase.usuarios.add(newUser as Usuario);
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Expanded(
          child: ListView.builder(
            itemCount: userBase.usuarios.length,
            itemBuilder: (context, index) => ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                backgroundImage:
                    NetworkImage(userBase.usuarios[index].gravatarIcon),
              ),
              dense: true,
              title: Text(
                  '${userBase.usuarios[index].nome}, ${userBase.usuarios[index].idade} anos '),
              subtitle: Text(userBase.usuarios[index].email),
              onTap: () => {},
            ),
            padding: EdgeInsets.only(bottom: 10),
          ),
        ),
      ),
    );
  }
}
