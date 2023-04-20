// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:projeto_pdm/Componentes/wallpaper.dart';
import 'package:projeto_pdm/Componentes/lista.dart';
import 'package:projeto_pdm/Telas/adicionar.dart';
import 'package:projeto_pdm/Telas/editar.dart';

int indice = -1;

int retornaIndice(){

    return indice;
}

// Tela; mostrar os álbuns; adicionar, editar e remover álbuns
    //Tela
class TelaPlanilha extends StatefulWidget {
	const TelaPlanilha({super.key});

	@override
	State<TelaPlanilha> createState() => _TelaPlanilhaState();
}

class _TelaPlanilhaState extends State<TelaPlanilha> {

    // listaAlbuns() na qual serão inseridos os objetos, índice para selecionar o objeto e campos de texto
    var index;
    var txtArtista = TextEditingController();
	var txtTitulo = TextEditingController();
	var txtDuracao = TextEditingController();
	var txtGenero = TextEditingController();
	var txtSubGenero = TextEditingController();
    var txtNota = TextEditingController();

    // Atributos iniciais
    @override
    void initState(){

        index = -1;

        super.initState();

    }

    // Tela: Appbar, coluna e nota de rodapé
	@override
	Widget build(BuildContext context) {

    	return Scaffold(

            // Appbar
			appBar: AppBar(title: Text("Galeria")),
			
            // Coluna
            body: Stack( 

                children: [
                    Wallpaper(),

                    planilha(),

                ],
            ),

            floatingActionButton: FloatingActionButton(
                onPressed: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => TelaAdd()))},
                child: Icon(Icons.add),
                ),

           
		);
    }

    // Planilha: listaAlbuns() de objetos Album e seus atributos
    planilha(){

        return Container(

            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            decoration: BoxDecoration(
                color: Color.fromARGB(150, 0, 0, 0)
            ),

            // listaAlbuns() rolavel dos objetos
            child: ListView.builder(
                itemCount: listaAlbuns().length,
                itemBuilder: (context, index) {

                    return Card(

                        // Álbuns
                        child: ListTile(

                            leading: Icon(Icons.auto_awesome_mosaic_outlined),
                            title: Text(listaAlbuns()[index].titulo),
                            subtitle: Text(listaAlbuns()[index].artista),
                            trailing: IconButton(

                                    icon: Icon(Icons.delete_outlined),
                                    onPressed: (){
                                        setState(() {
                                         listaAlbuns().removeAt(index);
                                        });
                                    mensagem("Álbum removido");
                                    },

                            ),
                            // Editar ao pressionar longo de um objeto
                            
                            onTap: (){
                                indice = index;
                                Navigator.push(context, MaterialPageRoute(builder: (context) => TelaEditar()));
                            },
                        ),
                    );
                },
            ),
        );
    }

    mensagem(texto){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 3), content: Text(texto)));
    }


}