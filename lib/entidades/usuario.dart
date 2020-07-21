import 'dart:math';
import 'dart:convert';
import 'package:crypto/crypto.dart';

class Usuario {
  String nome;
  int idade;
  String email;
  String gravatarIcon;

  Usuario(this.nome, this.idade, this.email, this.gravatarIcon);

  Usuario.randomGravatar(nome, idade, email) {
    this.nome = nome;
    this.idade = idade;
    this.email = email;
    this.gravatarIcon =
        'https://www.gravatar.com/avatar/${md5.convert(utf8.encode('${Random.secure().nextInt(10000).toString()}'))}?d=robohash';
  }
}
