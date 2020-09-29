import 'package:flutter/material.dart';
import 'package:form_get_users_bloc/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Material App Bar'),
          ),
          body: LoginPage()),
    );
  }
}

//Agregar un botón al Appbar de la Home Page donde nos despliegue un menú con dos opciones 
//pares e impares al elegir alguna de ellas,
// aplique el filtro desde el bloc y muestre en pantalla los elementos en la lista. 

//Actualmente se muestra el nombre del user, mostrar además del nombre del usuario, company name, 
//street y phone asi como dividers entre cada elemento de la lista 
//(tip:  cambiar ListView.builder por ListView.separated )