// ignore_for_file: unnecessary_new, prefer_final_fields, unused_field, prefer_const_constructors, must_be_immutable, override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/produto_repository.dart';
import 'package:flutter_application_2/produto.dart';

class ProdutoEdit extends StatefulWidget {
  Produto produto;
  int index;

  ProdutoEdit(this.produto, this.index, {super.key});
  

  @override
  State<ProdutoEdit> createState() => _ProdutoEditState();
}

class _ProdutoEditState extends State<ProdutoEdit> {
  
  ProdutoRepository produtoRepo = new ProdutoRepository();
  @override
  TextEditingController _nomeEdit = new TextEditingController();
  TextEditingController _quantidadeEdit = TextEditingController();
  TextEditingController _codigoEdit = TextEditingController();
    TextEditingController _precoEdit = TextEditingController();


  String nome = "";
  int quantidade = 0;
  String codigo = "";
  double preco = 0.0;

  GlobalKey<FormState> _formKey2 = new GlobalKey<FormState>();

  void init() {
    _nomeEdit.text = widget.produto.nome;
    _quantidadeEdit.text = widget.produto.quantidade.toString();
    _codigoEdit.text = widget.produto.codigo;
    _precoEdit.text = widget.produto.preco.toString();
   
  }
  Widget build(BuildContext context) {
    init();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('Consulta de ' + widget.produto.nome)),
      body:
      Form(
      key: _formKey2,
      child: Column(children: [
        TextFormField(
            controller: _nomeEdit,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'O nome não pode ser vazio.';
              } else {}
              return null;
            },
            decoration: InputDecoration(
              labelText: 'Nome',
              hintText: 'Digite o nome do produto',
              border: OutlineInputBorder(),
            )),
        


        TextFormField(
            controller: _codigoEdit,
            validator: (value) {
              if (value!.isEmpty) {
                return 'O código não pode ser vazio.';
              } else {
                if (value.length < 3) {
                  return 'O código deve ter mais de 3 caracteres.';
                }
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: 'Código',
              hintText: 'Digite o código do produto',
              border: OutlineInputBorder(),
            )),



        TextFormField(
            controller: _quantidadeEdit,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            validator: (value) {
              if (value!.isEmpty) {
                return 'A quantidade não pode ser vazia.';
              } else {
                if (int.parse(_quantidadeEdit.text) < 0) {
                  return 'A quantidade deve ser maior que 0.';
                }
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: 'quantidade',
              hintText: 'Digite quantidade',
              border: OutlineInputBorder(),
            )),



        TextFormField(
            controller: _precoEdit,
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'O preço não pode ser vazia.';
              } else {
                if (value.length < 0) {
                  return 'O preço deve ser maior que 0.';
                }
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: 'preço',
              hintText: 'Crie um preço',
              border: OutlineInputBorder(),
            )),
        ElevatedButton(onPressed: () {
          if (_formKey2.currentState!.validate()) {
            String nome = _nomeEdit.text;
            int quantidade = int.parse(_quantidadeEdit.text);
            String codigo = _codigoEdit.text;
            double preco = double.parse(_precoEdit.text);
            Produto produto = new Produto.produtoupdate(nome, quantidade , codigo as int, preco as int);
            ProdutoRepository.getProdutos()[widget.index] = produto;


            mostrarMsgSucesso();
            
            Navigator.pushNamed(context, '/Consulta');


      

                
          }
        }, child: Text("Atualizar"))
      ]),
    ));
  }

  
   void mostrarMsgSucesso ()
  {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar (content:Text('Produto alterado com sucesso')));
  }




}
