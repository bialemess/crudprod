
import 'package:flutter/material.dart';
import 'package:flutter_application_2/lista.dart';

import 'formularioxer.dart';
import 'home_page.dart';
import 'login.dart';

void main() {
  print("a");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
         
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: const Color.fromARGB(255, 143, 158, 207)

      ),
      routes: {
        '/HomePage': (context) => const HomePage(),
        '/FormExercise': (context) => const FormExercise(),
        '/Login': (context) => const Login(),
        '/Consulta': (context) => const Lista(),
      },
      initialRoute: '/HomePage'
    );
  }
}
