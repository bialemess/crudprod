// ignore_for_file: annotate_overrides, prefer_const_constructors, unused_field, prefer_final_fields, override_on_non_overriding_member, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_application_2/produto.dart';


import 'formularioxer.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  TextEditingController _codigo = TextEditingController();
  TextEditingController _nome = TextEditingController();
  GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  String codigo = "";
  String nome = "";

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Bem-vindo novamente!'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(children: [
          Form(
              key: formKey1,
              child: Column(
                children: [
                  TextFormField(
                    controller: _codigo,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'O código de produto não pode ser vazio.';
                      } else {
                        if (_codigo.text.length < 5) {
                          return 'O código de produto deve ter mais de 5 caracteres.';
                        }
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _nome,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'O nome não pode ser vazio.';
                      } else {
                        if (_nome.text.length < 5) {
                          return 'O nome deve ter mais de 5 caracteres.';
                        }
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                      onPressed: () {

                        


                        codigo = _codigo.text;
                        nome = _nome.text;
                        
                        if (formKey1.currentState!.validate()) {
                          Produto produto = Produto(codigo,nome, null, null);

                          produtoRepo.printProdutos();
                          if (produtoRepo.login(produto)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Login efetuado!')));
                            Navigator.pushNamed(context, '/HomePage');
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Login inválido!')));
                            setState(() {
                              _codigo.clear();
                              _nome.clear();
                            });
                          }
                        }
                      },
                      child: Text("Cadastrar")),
                ],
              ))
        ]),
      ),
    );
  }
}
