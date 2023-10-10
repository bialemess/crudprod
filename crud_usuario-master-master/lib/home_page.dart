// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field, prefer_const_literals_to_create_immutables,, unused_import

import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(




        appBar: AppBar   (
        

         iconTheme: IconThemeData(color: Colors.black)
         ,
        
          title: Text('Menu Administrador', style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)), ),   ),
        





        body: Center(




          child: Column(children: [


            SizedBox(height: 60),

             Text(
              "Bem vindo",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: const Color.fromARGB(255, 29, 42, 83)),
            ),
             

            SizedBox(height: 20),
             //icone

            Icon(Icons.admin_panel_settings, size: 100, color: Color.fromARGB(255, 29, 42, 83)),


           


          
          SizedBox(height: 20),



            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/FormExercise');
                },
                child: Text('Cadastrar novo produto', style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),)),
          
          SizedBox(height: 20),




            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Consulta');
                },
                child: Text('Consultar', style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),)),

          SizedBox(height: 20),
          ]),
        ));
  }
}
