// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:projeto_pdm/Componentes/ALM1379.dart';
import 'package:projeto_pdm/Componentes/lista.dart';
import 'package:projeto_pdm/Componentes/wallpaper.dart';
import 'package:projeto_pdm/Telas/adicionar.dart';
import 'package:projeto_pdm/Telas/editar.dart';
import 'package:projeto_pdm/Telas/hub.dart';

int indice = 0;

int retornaIndic(){

    return indice;
}


class TelaGaleria extends StatefulWidget {
  const TelaGaleria({super.key});


  @override
  State<TelaGaleria> createState() => _TelaGaleriaState();
}

class _TelaGaleriaState extends State<TelaGaleria> {


    @override
    Widget build(BuildContext context) {
        return Scaffold(

            // Appbar
            appBar: AppBar(
                    leading: IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () => Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (context) => TelaHub()), ModalRoute.withName("/hub"))
                    ),
                    
                    title: Text("Galeria")
                ),
			
            // Coluna
            body: Stack( 

                children: [

                    Wallpaper(),

                    GridView.builder(
                    
                    itemCount: listaAlbuns().length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 0,
                        crossAxisSpacing: 0,
                        crossAxisCount: 3,
                    ),
                    itemBuilder: (context, index) {
                        return InkWell(
                        
                            onTap: (){
                                indice = index;
                                print(indice);
                                Navigator.push(context, MaterialPageRoute(builder: (context) => TelaEditar()));
                            },

                            child: GridTile(

                                child: Container(

                                    color: Color.fromARGB(245, Random().nextInt(250) + 5, Random().nextInt(250) + 5, Random().nextInt(250) + 5),
                                    padding: EdgeInsets.all(4),
                                    child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [

                                            SizedBox(height: 20),
                                            Icon(Icons.album, size: 30, color: Colors.white),
                                            SizedBox(height: 8),

                                            Text(listaAlbuns()[index].titulo, style: TextStyle(color: Colors.white, fontSize: 16)),
                                            SizedBox(height: 8),

                                            Text(listaAlbuns()[index].artista, style: TextStyle(color: Colors.white, fontSize: 12))
                                        
                                        ]),
                                )
                            ),
                        );
                    },

                    
                    ),

            ]),
            floatingActionButton: FloatingActionButton(
                onPressed: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => TelaAdd()))},
                child: Icon(Icons.add),
                ),
        );
    }
}