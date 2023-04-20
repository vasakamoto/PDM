// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:projeto_pdm/Componentes/lista.dart';
import 'package:projeto_pdm/Telas/login.dart';
import 'package:projeto_pdm/Telas/planilha.dart';

albunsRecentes(){

    final List<int> cores = <int>[50, 100, 200, 300, 400, 500, 600, 700, 800, 900, 900, 900];

    return Container(

        color: Color.fromARGB(150, 0, 0, 0),
        child: ListView.separated(
            reverse: true,
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            itemCount: 10,
            separatorBuilder: (BuildContext context, index) => Divider(height: 5,),
            itemBuilder: (context, index) {
                
                return Container(
                    
                    height: 30,
                    color: Colors.red[cores[index]],
                    child: Center(child: Text(albunsRecent()[index]))
                    );
            },

        ),

    );

}

mediaRecenteRating(){

    return Container(

        color: Color.fromARGB(150, 0, 0, 0),
        child: Center( child: Column(
            children: [

                Text("Nota média dos albuns recentes", style: TextStyle(color: Colors.white)),
                Text(mediaRating(), style: TextStyle(color: Colors.white))
                
            ],    
        ),)
    );

}

generosMaisRecentes(){

    final List<int> cores = <int>[300, 400, 500, 600, 700];

    return Container(

        color: Color.fromARGB(150, 0, 0, 0),
        child: ListView.separated(
            reverse: true,
            padding: EdgeInsets.all(20),
            itemCount: 5,
            separatorBuilder: (BuildContext context, index) => Divider(height: 5,),
            itemBuilder: (context, index) {
                
                return Container(
                    
                    height: 30,
                    color: Colors.grey[cores[index]],
                    child: Center(child: Text(generosRecentes()[index]))
                    );
            },

        ),

    );

}

metricasRecentes(){
    
        return Row(children: [

            // Albuns adicionados recentemente
            Expanded(flex: 1, child: albunsRecentes()),

            // Média dos ratings mais recentes
            Expanded(flex: 1, child: mediaRecenteRating()),

            // Gêneros mais recentes
            Expanded(flex: 1, child: generosMaisRecentes())

    
        ]);

}


