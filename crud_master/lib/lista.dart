
import 'package:flutter/material.dart';


import 'Change.dart';
import 'produto.dart';
import 'produto_repository.dart';


class Lista extends StatefulWidget {
  const Lista({super.key});

  @override
  State<Lista> createState() => _Lista();
}

class _Lista extends State<Lista> {
  late List<Produto> search;
  String nome = "";

  final produtoRepo = ProdutoRepository.getProdutos();
 @override
  void initState() {
    //cópia da lista original
    search = List.from(ProdutoRepository.getProdutos());
    super.initState();
  }
  void update(String nome) {
    setState(() {
      search = ProdutoRepository.getProdutos()
          .where((element) =>
              (element.nome.toLowerCase().contains(nome.toLowerCase())))
          .toList();
    });
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("Cancelar"),
      onPressed: () {},
    );
    Widget continueButton = TextButton(
      child: const Text("Continuar"),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("AlertDialog"),
      content: const Text("Deseja mesmo excluir este produto?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text('Consulta de produtos')),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
                labelText: "Buscar produto", border: OutlineInputBorder()),
            onChanged: (String nome) {
              update(nome);
       
            },
          ),
          const SizedBox(height: 24),
          ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(thickness: 2),
            itemCount: search.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                  leading: const Icon(Icons.add_box),
                  title: Text(search[index].nome),
                  subtitle: Text(search[index].codigo.toString()),
                  trailing: SizedBox(
                      width: 70,
                      child: Row(
                        children: [
                          Expanded(
                              child: IconButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ProdutoEdit(search[index], index);
                              }));
                            },
                            icon: const Icon(Icons.mode_edit_outline_outlined),
                          )),
                          Expanded(
                              child: IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: const Text("Exclusão iminente"),
                                            content: const Text(
                                                "Confirma a exclusão deste produto?"),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Produto produto = produtoRepo[index];
                                                    ProdutoRepository.removeProduto(
                                                        produto);
                                                    update(nome);
                                                    setState(() {});
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text("Sim")),
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text("Cancelar"))
                                            ],
                                          );
                                        });
                                  },
                                  icon: const Icon(Icons.delete_forever)))
                        ],
                      )));
            },
          ),
        ],
      ),
    );
  }
}