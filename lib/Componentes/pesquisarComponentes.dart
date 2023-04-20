// ignore_for_file: prefer_const_constructors

import 'package:projeto_pdm/Componentes/lista.dart';
import 'package:flutter/material.dart';
import 'package:projeto_pdm/Telas/editar.dart';
import 'package:projeto_pdm/Telas/planilha.dart';

var pesquisa = TextEditingController();
List<int> indices = [];
List<Album> pesquisados = [];
int x = 0;

filtrar(){

    limpar();

    while(x < listaAlbuns().length){

        if(listaAlbuns()[x].artista.contains(pesquisa.text) || 
        listaAlbuns()[x].titulo.contains(pesquisa.text) ||
        listaAlbuns()[x].genero.contains(pesquisa.text) ||
        listaAlbuns()[x].subgenero.contains(pesquisa.text)
        ){pesquisados.add(listaAlbuns()[x]);}

        x++;

    }

    x = 0;
}
limpar(){

    pesquisados.clear();

}

pesquisar(){

    return Container(
        
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: TextField(
            controller: pesquisa,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(labelText: "Pesquisar"),

        ),
    
    );

}

encontrados(){

    return Container(

        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        
        child: ListView.builder(
        
            itemCount: pesquisados.length,
            itemBuilder: (context, index) {
              
                return Card(
                
                    child: ListTile(

                        tileColor: Colors.red,
                        title: Text(pesquisados[index].titulo),
                        subtitle: Text(pesquisados[index].artista),
                        onTap: (){
                                indice = index;
                                Navigator.push(context, MaterialPageRoute(builder: (context) => TelaEditar()));
                        },
                    
                    ),

                );
            },
        
        )
    
    );

}

