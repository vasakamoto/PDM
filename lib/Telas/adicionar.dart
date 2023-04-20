// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:projeto_pdm/Componentes/wallpaper.dart';
import 'package:projeto_pdm/Componentes/lista.dart';
import 'package:projeto_pdm/Telas/galeria.dart';
import 'package:projeto_pdm/Telas/planilha.dart';

class TelaAdd extends StatefulWidget {
  const TelaAdd({super.key});

  @override
  State<TelaAdd> createState() => _TelaAddState();
}

class _TelaAddState extends State<TelaAdd> {
  var index;
  var txtArtista = TextEditingController();
  var txtTitulo = TextEditingController();
  var txtDuracao = TextEditingController();
  var txtGenero = TextEditingController();
  var txtSubGenero = TextEditingController();
  var txtNota = TextEditingController();

  @override
  void initState() {
    index = -1;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // Appbar
        appBar: AppBar(
          title: Text("Adicionar"),
        ),

        // Coluna
        body: Stack(children: [
          Wallpaper(),

          Padding(
          padding: EdgeInsets.fromLTRB(20, 50, 20, 100),
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color.fromARGB(150, 0, 0, 0)
            ),
            child: Column(
              children: [
                // Artista
                TextField(
                  controller: txtArtista,
                  decoration: InputDecoration(
                    labelText: "Artista:",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 8),

                // Título
                TextField(
                  controller: txtTitulo,
                  decoration: InputDecoration(
                    labelText: "Título:",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 8),

                // Duração
                TextField(
                  controller: txtDuracao,
                  decoration: InputDecoration(
                    labelText: "Duração (minutos):",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 8),

                // Gênero
                TextField(
                  controller: txtGenero,
                  decoration: InputDecoration(
                    labelText: "Gênero:",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 8),

                // Subgênero
                TextField(
                  controller: txtSubGenero,
                  decoration: InputDecoration(
                    labelText: "Subgênero:",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 8),

                // Nota
                TextField(
                  controller: txtNota,
                  decoration: InputDecoration(
                    labelText: "Nota:",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 30),

                // Botao para armazenar
                ElevatedButton(
                  child: Text("Salvar"),
                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color.fromARGB(222, 0, 0, 0)),
                  onPressed: () {
                    // Verificar se os campos estão preenchidos
                    if (txtArtista.text.isNotEmpty &&
                        txtTitulo.text.isNotEmpty &&
                        txtDuracao.text.isNotEmpty &&
                        txtGenero.text.isNotEmpty &&
                        txtSubGenero.text.isNotEmpty &&
                        txtNota.text.isNotEmpty) {
                      // Verificar se nenhum item está selecionado
                        setState(() {
                          listaAlbuns().add(Album(
                              txtArtista.text,
                              txtTitulo.text,
                              double.parse(txtDuracao.text),
                              txtGenero.text,
                              txtSubGenero.text,
                              double.parse(txtNota.text),
                              DateTime.now().year,
                              DateTime.now().month
                              ));
                        });
                        mensagem("Álbum adicionado");
                      

                      // Limpar os campos após clicar no botão
                      txtArtista.clear();
                      txtTitulo.clear();
                      txtDuracao.clear();
                      txtGenero.clear();
                      txtSubGenero.clear();
                      txtNota.clear();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TelaGaleria()));
                    
                    
                      
                    } else {
                      mensagem("Os campos não foram completamente preenchidos");
                    }
                  },
                )
              ],
            ),
          ))
        
        ]));
  }

  mensagem(texto) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(duration: Duration(seconds: 3), content: Text(texto)));
  }
}
