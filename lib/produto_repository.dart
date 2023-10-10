import 'package:flutter_application_2/produto.dart';


// ignore_for_file: unused_field, prefer_final_fields, unnecessary_this, avoid_print
class ProdutoRepository {
  static List<Produto> _produtos = [];

  void addProduto(Produto produto) {
    print("Adding  $produto");

    _produtos.add(produto);
  }

  void printProdutos() {
    print(_produtos.length);
    for (Produto produto in _produtos) {
      print(produto);
    }
  }

  static List<Produto> getProdutos() {
    return _produtos;
  }

  bool login(Produto produto) {
    for (var i = 0; i < _produtos.length; i) {
      if (_produtos[i].codigo == produto.codigo &&
          _produtos[i].nome == produto.nome) {
        return true;
      }
    }
    return false;
  }

  static void removeProduto(Produto nome) {
    _produtos.remove(nome);
   
  }

  void updateProdutos(Produto produto, int index) {
    _produtos[index].nome = produto.nome;
    _produtos[index].codigo = produto.codigo;
    _produtos[index].quantidade = produto.quantidade;
    _produtos[index].preco = produto.preco;
  }
}



