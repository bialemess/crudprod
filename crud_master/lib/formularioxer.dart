// ignore_for_file: unused_field, prefer_final_fields, prefer_const_constructors, empty_statements, unused_import

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'produto.dart';
import 'produto_repository.dart';


class FormExercise extends StatefulWidget {
  const FormExercise({super.key});

  @override
  State<FormExercise> createState() => _FormExerciseState();
}

ProdutoRepository produtoRepo = ProdutoRepository();

class _FormExerciseState extends State<FormExercise> {
  TextEditingController _nome = TextEditingController();
  TextEditingController _quantidade = TextEditingController();
  TextEditingController _codigo = TextEditingController();
  TextEditingController _preco = TextEditingController();

  String nome = "";
  int quantidade = 0;
  String codigo = "";
  double preco = 0.0;
 

  GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Cadastro !'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              SizedBox(
                height: 20,
              ),
              Form(
                  key: _formKey1,
                  child: Padding(
                    padding: const EdgeInsets.all(26.0),
                    child: Column(
                      children: [
                        TextFormField(
                  
                          
                            controller: _nome,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'O nome não pode ser vazio.';
                              } else {}
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Nome',
                              hintText: 'Digite seu Nome',
                              border: OutlineInputBorder(),
                            )
                            
                      
                            
                            )
                            
                            
                            ,
                        SizedBox(height: 20),


                         
                        TextFormField(
                            controller: _quantidade,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'a quantidade não pode ser vazia.';
                              } else {
                                if (value.length <=0 ) {
                                  return 'a quantidade deve ser maior que 0.';
                                }
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Quantidade do produto',
                              hintText: 'quantidade',
                              border: OutlineInputBorder(),
                            )),



                        SizedBox(height: 20),
                        TextFormField(
                            controller: _codigo,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'O codigo não pode ser vazio.';
                              } else {
                                if (value.length < 3) {
                                  return 'O codigo deve ter mais de 3 caracteres.';
                                }
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'código de produto',
                              hintText: 'Digite seu código de produto',
                              border: OutlineInputBorder(),
                            )),
                        SizedBox(height: 20),


                        TextFormField(
                            controller: _preco,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'O preço  não pode ser vazio.';
                              } else {
                                if (double.parse(_preco.text) <= 0) {
                                  return ' o preço deve ser maior que 0 ';
                                }
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Preço',
                              hintText: 'Digite o preço',
                              border: OutlineInputBorder(),
                            )),
                     
                
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.grey)),
                            onPressed: () {


                              if (_formKey1.currentState!.validate()) {
                                setState(() {
                                

                                 String nome = _nome.text;
                                 
                                 int quantidade = int.parse(_quantidade.text);
                                 int   codigo = int.parse(_codigo.text);
                                int preco = int.parse(_preco.text);

                                  Produto produto = Produto(
                                      nome, quantidade , codigo , preco);
                              
                                  produtoRepo.addProduto(produto);










                                  setState(() {
                                    _codigo.text = "";
                                    _nome.text = "";
                                    _quantidade.text = "";
                                    _preco.text = "";
                                  
                                  });

                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              'Produto cadastrado com sucesso!')));
                                });
                                Navigator.pushNamed(context, '/HomePage',
                                    arguments: <String, String>{
                                      'username': _nome.text,
                                      'codigo': _codigo.text,


                                      
                                    });
                              }
                            },
                            child: Text("Cadastrar"))
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }
}
