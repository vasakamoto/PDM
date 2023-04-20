// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:projeto_pdm/Componentes/lista.dart';
import 'package:projeto_pdm/Componentes/metricasComponentes.dart';
import 'package:projeto_pdm/Componentes/wallpaper.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:projeto_pdm/Telas/hub.dart';

class TelaMetricas extends StatefulWidget {
    const TelaMetricas({super.key});

    @override
    State<TelaMetricas> createState() => _TelaMetricasState();
}

class _TelaMetricasState extends State<TelaMetricas> {
    //List<charts.Series<GenQuanAno>> dadosgraficodearea;

    @override
    Widget build(BuildContext context) {

        return Scaffold(

                appBar: AppBar(
                    leading: IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () => Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (context) => TelaHub()), ModalRoute.withName("/hub"))
                    ),
                    
                    title: Text("Metricas")
                ),
			
            // Coluna

                body: Stack(children: [
                
                    Wallpaper(),

                    StackedAreaCustomColorLineChart()
                    

                
                ]),
    
        );
    }

}