import 'package:flutter_application_2/produto.dart';


// ignore_for_file: unused_field, prefer_final_fields, unnecessary_this, avoid_print
class ProdutoRepository {
  static List<Produto> _produtos = [];

  void addUser(Produto user) {
    print("Adding $user");

    _produtos.add(user);
  }

  void printUsers() {
    print(_produtos.length);
    for (Produto produto in _produtos) {
      print(produto);
    }
  }

  static List<Produto> getProdutos() {
    return _produtos;
  }

  bool login(Produto user, String nome) {
    for (var i = 0; i < _produtos.length; i) {
      if (_produtos[i].codigo == user.codigo &&
          _produtos[i].nome == user.nome ) {
        return true;
      }
    }
    return false;
  }

  static void removeProduto(Produto user) {
    _produtos.remove(user);
  }

  void printProdutos() {}
}
