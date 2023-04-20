// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:projeto_pdm/Componentes/hubComponentes.dart';
import 'package:projeto_pdm/Componentes/wallpaper.dart';
import 'package:projeto_pdm/Componentes/lista.dart';
import 'package:projeto_pdm/Telas/galeria.dart';
import 'package:projeto_pdm/Telas/login.dart';
import 'package:projeto_pdm/Telas/metricas.dart';
import 'package:projeto_pdm/Telas/pesquisar.dart';
import 'package:projeto_pdm/Telas/planilha.dart';

class TelaHub extends StatefulWidget {
		const TelaHub({super.key});

		@override
		State<TelaHub> createState() => _TelaHubState();
}

class _TelaHubState extends State<TelaHub> {
		
	// Atributos da tela
	var index;
	List<Album> lista = listaAlbuns();

	@override
	void initState(){

			index = -1;
			super.initState();

	}

	@override
	Widget build(BuildContext context) {
		
	// Tela principal, Hub das telas, metricas recentes e opções de navegação
		return Scaffold(

			body: Stack(children : [

								Wallpaper(),

                                Padding(
                                    padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
                                    child:  Container(
                                        padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(10)),
                                            color: Color.fromARGB(150, 0, 0, 0)
                                        ),

                                        child:Column(children: [
                                                Expanded(flex: 1, child: usuario()),
                                                Expanded(flex: 8, child: metricasRecent()),
                                                Expanded(flex: 2, child: gridview())
                    
                                        ])),
                                )
						]),

				);

	}


    metricasRecent(){
    
        return Padding(
            padding: EdgeInsets.all(8),
                child: Column(children:[

                    Expanded(child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            
                            Padding(
                                padding: EdgeInsets.all(4),
                                child: Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(10)),
                                            color: Color.fromARGB(150, 200, 200, 200),
                                        ),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children : [
                                            Icon(Icons.album, color: Colors.white,),
                                            SizedBox(width: 8,),
                                            Column(
                                            
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                                Text("Álbum com maior índice de avaliação", style: TextStyle(color: Colors.white),),
                                                Text("${melhoravaliado()[0]}  -  ${melhoravaliado()[1]}", style: TextStyle(color: Colors.white),),
                                            ]),
                                        ])
                                )
                            )
                    ]),
                    ),

                    Expanded(child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            
                            Padding(
                                padding: EdgeInsets.all(4),
                                child: (
                                    Container(
                                        padding: EdgeInsets.fromLTRB(4, 20, 4, 20),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(10)),
                                            color: Color.fromARGB(150, 100, 100, 100),
                                        ),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children : [
                                            Icon(Icons.library_music, color: Colors.white,),
                                            SizedBox(width: 8,),
                                            Column(
                                            
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                                Text("Artista mais repetido na galeria:", style: TextStyle(color: Colors.white),),
                                                Text(artistaRepetido(), style: TextStyle(color: Colors.white),),
                                            ]),
                                        ])
                                    )
                                )
                            ),
                            Padding(
                                padding: EdgeInsets.all(4),
                                child: Container(
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(8)),
                                    ),
                                    child: Column(
                                        children:[
                                        Container(
                                            padding: EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                                color: Color.fromARGB(150, 150, 150, 150),
                                            ),
                                            child: Row(children: [
                                                Icon(Icons.numbers, color: Colors.white,),
                                                Column(
                                                    children: [
                                                        Text("Media das avaliações:", style: TextStyle(color: Colors.white)),
                                                        Text("${mediaRating()}", style: TextStyle(color: Colors.white),) 
                                                ])
                                            ])
                                        ),
                                        SizedBox(height: 8,),
                                        Container(
                                            padding: EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                                color: Color.fromARGB(150, 200, 200, 200),
                                            ),
                                            child: Row(children: [
                                                Icon(Icons.format_list_numbered, color: Colors.white,),
                                                Column(
                                                    children: [
                                                        Text("Total de Álbuns:", style: TextStyle(color: Colors.white)),
                                                        Text("${lista.length}", style: TextStyle(color: Colors.white),) 
                                                ])
                                            ])
                                        )
                                    ])
                                ),
                            ),
                    ]),
                    ),

                    Text("Albuns recentes:", style: TextStyle(color: Colors.white, fontSize: 16),),
                    SizedBox(height: 10),

                    Expanded(
                        child: albunsRecentes()
                )
                ])
            
        );    
    }

    gridview(){

        return GridView.count(
            
            crossAxisCount: 3,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            children: [

                InkWell( 
                    child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage("lib/Imagens/galerialogo.png"), fit: BoxFit.fill),
                            borderRadius: BorderRadius.all(Radius.circular(20))    
                        ),
                    ),
                    onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => TelaGaleria()));
                    },
                ),

                InkWell(
                    child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage("lib/Imagens/filtrarlogo.png"), fit: BoxFit.fill),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                    ),
                    onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TelaPesquisar())); 
                    },
                ),

                InkWell(
                    child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage("lib/Imagens/metricaslogo.png"), fit: BoxFit.fill),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                    ),
                    onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => TelaMetricas()));
                    },
                )

        ]);

    }

    usuario(){

    return Row(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
    
        children: [

            Text("Usuário: Maicol Diequisom", style: TextStyle(color: Colors.white, fontSize: 14)),
            ElevatedButton(
                onPressed: () => Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (context) => TelaLogin()), ModalRoute.withName("/login")), 
                child: Text("Sair")
            )
        
        ],
    
    );

}

}
