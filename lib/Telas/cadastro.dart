// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:projeto_pdm/Componentes/logo.dart';
import 'package:projeto_pdm/Componentes/wallpaper.dart';
import 'package:projeto_pdm/Telas/login.dart';

class Cadastro {
    final String nome;
    final String email;
    final String senha;
    final String confsenha;

    Cadastro(this.nome, this.email, this.senha, this.confsenha);
}

class TelaCadastro extends StatefulWidget {
    const TelaCadastro({super.key});

    @override
    State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
    var txtNome = TextEditingController();
    var txtEmail = TextEditingController();
    var txtSenha = TextEditingController();
    var txtConfSenha = TextEditingController();

    @override
    Widget build(BuildContext context) {
        return Scaffold(

            //padding delimitando as áreas da coluna
            body: Stack(
            
                children : [

                    Wallpaper(),
            
                    Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 60, bottom: 60),
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        //coluna contendo campos de email, senha e botoes
                        children: [
                            //falta inserir logo

                            //campos de email, senha e botão de entrar
                            Expanded(
                                flex: 1,
                                child: cadastro(),
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

    cadastro() {
        return Container(
            
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color.fromARGB(150, 0, 0, 0)
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                    Container(
                    alignment: Alignment.centerLeft,
                    child: Text("Cadastrar:", style: TextStyle(color: Colors.white, fontSize: 16),),
                    ),
                    SizedBox(height: 10),
                
                    TextField(
                        controller: txtNome,
                        decoration: InputDecoration(
                            labelText: "Nome",
                            border: OutlineInputBorder(),
                        ),
                    ),
                    SizedBox(height: 10),
                    
                    TextField(
                        controller: txtEmail,
                        decoration: InputDecoration(
                            labelText: "E-mail",
                            border: OutlineInputBorder(),
                        ),
                    ),
                    SizedBox(height: 10),

                    TextField(
                        controller: txtSenha,
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: "Senha",
                            border: OutlineInputBorder(),
                        ),
                    ),
                    SizedBox(height: 10),

                    TextField(
                        controller: txtConfSenha,
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: "Confirmar Senha",
                            border: OutlineInputBorder(),
                        ),
                    ),
                    SizedBox(height: 30),

                    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                        Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Color.fromARGB(222, 0, 0, 0)),
                                onPressed: () => Navigator.pop(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TelaLogin())),
                                child: Text(
                                "Voltar",
                                style: TextStyle(
                                    fontSize: 20,
                                ),
                                ))
                        ]),
                    
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                                ElevatedButton(
                                    onPressed: () {
                                        if (txtNome.text.isNotEmpty &&
                                            txtEmail.text.isNotEmpty &&
                                            txtSenha.text.isNotEmpty &&
                                            txtConfSenha.text.isNotEmpty) {
                                            if (txtSenha.text == txtConfSenha.text) {
                                                mensagem("Cadatro realizado com sucesso");
                                                txtNome.clear();
                                                txtEmail.clear();
                                                txtSenha.clear();
                                                txtConfSenha.clear();
                                            } else {
                                            mensagem(
                                                "As senhas digitadas são diferentes. Insira a mesma senha para cadastrar");
                                            }
                                        } else {
                                            mensagem("Preencha os campos acima para cadastrar");
                                        }
                                    },
                                    child: Text(
                                    "Cadastrar",
                                    style: TextStyle(
                                        fontSize: 20,
                                    ),
                                    ))
                            ],
                            ),

                        
                ])
                ]));
    }
}
