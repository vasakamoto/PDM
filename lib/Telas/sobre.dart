// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:projeto_pdm/Componentes/wallpaper.dart';


class Sobre extends StatelessWidget {
  const Sobre({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sobre"),
          
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
          Wallpaper(),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 148, bottom: 148),
            color: Color.fromARGB(199, 0, 0, 0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                        "Este é o aplicativo Maicon Dieckson. Ele permite que você crie uma lista de dados dos seus álbuns musicais favoritos. Você pode alimentá-lo com os dados dos albuns musicais de seu interesse. Você pode adicionar um novo álbum, editar ou remover um álbum existente e até atribuir uma nota de acordo com seus próprios critérios. Navegue pela sua lista de álbuns, pesquise os álbuns existentes na lista e obtenha as estatísticas dos gêneros mais recorrentes em sua lista.",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 18)),
                    SizedBox(height: 8),
                    ElevatedButton(
                      child: Text("Voltar"),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ]))
        ]));
  }
}
