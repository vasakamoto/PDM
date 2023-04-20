// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
    const Logo({super.key});

    @override
    Widget build(BuildContext context) {

        return Center(
            child: Container(
                width: 125,
                height: 125,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    
                    image: DecorationImage(

                        image: AssetImage("lib/Imagens/logo3.png"),
                        fit: BoxFit.fill

                    ),

                    borderRadius: BorderRadius.all(Radius.circular(100))

                ),
            )
        
        );
    }
}

