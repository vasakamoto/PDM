// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:projeto_pdm/Componentes/wallpaper.dart';
import 'package:projeto_pdm/Telas/cadastro.dart';
import 'package:projeto_pdm/Telas/hub.dart';
import 'package:projeto_pdm/Telas/senha.dart';
import 'package:projeto_pdm/Telas/planilha.dart';
import 'package:projeto_pdm/Telas/sobre.dart';

import '../Componentes/logo.dart';

//objetos de login e senha
class Login {
    final String email;
    final String senha;

    Login(this.email, this.senha);
}

//Inserir os campos de email e senha para logar
class TelaLogin extends StatefulWidget {
    const TelaLogin({super.key});

    @override
    State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();

    @override
    Widget build(BuildContext context) {
        return Scaffold(

        //padding delimitando as áreas da coluna
        body: Stack(
            children: [

            Wallpaper(),
        
            Padding(
                padding:
                    const EdgeInsets.only(left: 20, right: 20, top: 80, bottom: 80),

                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                    //coluna contendo campos de email, senha e botoes
                    children: [
                        //falta inserir logo
                        
                        //campos de email, senha e botão de entrar
                        Expanded(
                            flex: 1,
                            child: login(),
                        ),
                    ],
                ),
            ),
        ])
        );
    }

    mensagem(texto) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 3), content: Text(texto)));
    }

    //campos de email, senha e botão de entrar
    login() {
        return Container(

            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color.fromARGB(150, 0, 0, 0)
            ),
            child: Column(

                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                    
                    Logo(),
                    SizedBox(height: 50,),

                    TextField(
                        controller: txtEmail,
                        decoration: InputDecoration(
                            labelText: "E-mail",
                            border: OutlineInputBorder(),
                        ),
                    ),
                    SizedBox(height: 20),

                    TextField(
                        controller: txtSenha,
                        obscureText: true,
                            decoration: InputDecoration(
                            labelText: "Senha",
                        border: OutlineInputBorder(),
                        ),
                    ),
                    SizedBox(height: 5),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(100, 0, 0, 0)),
                            onPressed: () => Navigator.push(
                                context, MaterialPageRoute(builder: (context) => TelaNovaSenha())),
                            child: Text(
                                "Esqueceu a senha?", style: TextStyle(fontSize: 12),
                            ))
                        ]
                    ),
                    
                    SizedBox(height: 30),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            
                            Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Color.fromARGB(222, 0, 0, 0)
                                ),
                                onPressed: () => Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => TelaCadastro())),
                                child: Text(
                                    "Cadastrar", style: TextStyle(fontSize: 20),
                                )
                            )
                            ]),

                            SizedBox(width: 4),

                            ElevatedButton(
                                onPressed: () {

                                    if (txtEmail.text.isNotEmpty && txtSenha.text.isNotEmpty) {
                                        Navigator.push(
                                            context, MaterialPageRoute(builder: (context) => TelaHub()));
                                        txtEmail.clear();
                                        txtSenha.clear();
                                    } 
                                    else {
                                        mensagem("Preencha o e-mail e a senha corretamente para entrar");
                                    }
                                },

                                child: Text(
                                    "Entrar", style: TextStyle(fontSize: 20),
                                )

                            )

                    ]),

                    SizedBox(height: 20,),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(0, 0, 0, 0)),
                        onPressed: () => Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => Sobre())),
                        child: Center(child: Text("Sobre"))
                        )

                ])
        );
    
    }
}
