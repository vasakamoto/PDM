// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:projeto_pdm/Telas/hub.dart';
import 'package:projeto_pdm/Telas/login.dart';
import 'package:projeto_pdm/Telas/cadastro.dart';
import 'package:projeto_pdm/Telas/senha.dart';

void main(){

	runApp(
    
        MaterialApp(
    
            home: TelaLogin(),
            title: "ALM.-",
            theme: ThemeData(
                primarySwatch: Colors.red,
                primaryColor: Colors.yellowAccent,
                textTheme: TextTheme(titleMedium: TextStyle(color: Colors.white)),
                inputDecorationTheme: InputDecorationTheme(
                    
                    filled: true,
                    fillColor: Color.fromARGB(180, 0, 0, 0),
                    labelStyle: TextStyle(color: Colors.white, fontSize: 18, decorationColor: Colors.white)
                ),
                listTileTheme: ListTileThemeData(tileColor: Colors.red),
                ),
            initialRoute: 'login',
            routes: {
                '/login': (context) => TelaLogin(),
                '/cadastro': (context) => TelaCadastro(),
                '/senha': (context) => TelaNovaSenha(),
                '/hub' :(context) => TelaHub(),
            } 

        )
    
    );

}

