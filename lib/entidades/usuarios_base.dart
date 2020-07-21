import 'usuario.dart';

class UsuarioBase {
  List<Usuario> usuarios;
  Usuario user1 = Usuario.randomGravatar('Evandro', 25, 'user1@gmail.com');
  Usuario user2 = Usuario.randomGravatar('Edson', 25, 'user2@gmail.com');
  Usuario user3 = Usuario.randomGravatar('Lucas', 25, 'user3@gmail.com');
  UsuarioBase() {
    this.usuarios = <Usuario>[];
    this.usuarios.addAll([user1, user2, user3]);
  }
}
