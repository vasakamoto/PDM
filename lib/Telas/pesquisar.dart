// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:projeto_pdm/Componentes/wallpaper.dart';
import 'package:projeto_pdm/Componentes/pesquisarComponentes.dart';
import 'package:projeto_pdm/Telas/hub.dart';

class TelaPesquisar extends StatefulWidget {
    const TelaPesquisar({super.key});

    @override
    State<TelaPesquisar> createState() => _TelaPesquisarState();
}

class _TelaPesquisarState extends State<TelaPesquisar> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                    leading: IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () => Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (context) => TelaHub()), ModalRoute.withName("/hub"))
                    ),
                    
                    title: Text("Filtrar")
                ),
			
            // Coluna

            body: Stack(children: [

                Wallpaper(),

                
                Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(150, 0, 0, 0)
                        ),
                        child: Column(children: [
                            pesquisar(),

                            Row(children: [

                                Padding(
                                    padding: EdgeInsets.all(20),
                                    child: ElevatedButton(child: Text("Filtrar"), onPressed: (){setState(() {
                                        filtrar();});},
                                    ),
                                ),

                                Padding(
                                    padding: EdgeInsets.all(10),
                                    child: ElevatedButton(child: Text("Limpar"), onPressed: (){setState(() {
                                        limpar();
                                    });},)
                                )



                            ]),

                            Expanded(child: encontrados())

                        ]),

                    )

                

            ])

    );
    }

}