
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projeto_pdm/Componentes/lista.dart';

class StackedAreaCustomColorLineChart extends StatelessWidget {
  const StackedAreaCustomColorLineChart({super.key});

  
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8),
        child: Container(
            padding: EdgeInsets.all(8),
            color: Color.fromARGB(222, 222, 222, 222),
            child: Column(children : [
                Text("Numero de albuns de cada genero em função do tempo", style: TextStyle(fontSize: 22, color: Color.fromARGB(255, 0, 0, 0)),),

                Expanded(child: charts.LineChart(_createSampleData(),
                    defaultRenderer: charts.LineRendererConfig(includeArea: true, stacked: true),
                    behaviors: [
                        charts.ChartTitle('Anos',
                        behaviorPosition: charts.BehaviorPosition.bottom,
                        titleOutsideJustification:charts.OutsideJustification.middleDrawArea),
                        charts.ChartTitle('Numero de Álbuns',
                        behaviorPosition: charts.BehaviorPosition.start,
                        titleOutsideJustification: charts.OutsideJustification.middleDrawArea),
                        charts.ChartTitle('Gêneros',
                        behaviorPosition: charts.BehaviorPosition.end,
                        titleOutsideJustification:charts.OutsideJustification.middleDrawArea,),
                        charts.DatumLegend(outsideJustification: charts.OutsideJustification.endDrawArea,
                              horizontalFirst: false,
                              desiredMaxRows: 2,
                              cellPadding: EdgeInsets.only(right: 4.0, bottom: 4.0),
                              entryTextStyle: charts.TextStyleSpec(
                                  color: charts.MaterialPalette.purple.shadeDefault,
                                  fontFamily: 'Georgia',
                                  fontSize: 11),)
                    ],
                    animate: false))
                
            ])
        )
    );
  }

  /// Create one series with sample hard coded data.
  List<charts.Series<AnoQuan, int>> _createSampleData() {

    var metal = [
        AnoQuan(0, 33),
        AnoQuan(1, 65),
        AnoQuan(2, 92),
        AnoQuan(3, 112),
    ];

    var triphop = [
        AnoQuan(0, 1),
        AnoQuan(1, 6),
        AnoQuan(2, 14),
        AnoQuan(3, 15)
    ];

    var rock = [
        AnoQuan(0, 4),
        AnoQuan(1, 15),
        AnoQuan(2, 29),
        AnoQuan(3, 33),
    ];

    var core = [
        AnoQuan(0, 3),
        AnoQuan(1, 7),
        AnoQuan(2, 20),
        AnoQuan(3, 21),
    ];

        var funk = [
        AnoQuan(0, 1),
        AnoQuan(1, 2),
        AnoQuan(2, 0),
        AnoQuan(3, 0),
    ];

    var jazz = [
        AnoQuan(0, 1),
        AnoQuan(1, 9),
        AnoQuan(2, 14),
        AnoQuan(3, 15),
    ];

    var ost = [
        AnoQuan(0, 1),
        AnoQuan(1, 1),
        AnoQuan(2, 1),
        AnoQuan(3, 3),
    ];

    var synthwave = [
        AnoQuan(0, 1),
        AnoQuan(1, 4),
        AnoQuan(2, 5),
        AnoQuan(3, 7),
    ];

    var folk = [
        AnoQuan(0, 0),
        AnoQuan(1, 4),
        AnoQuan(2, 7),
        AnoQuan(3, 0),
    ];

    var hiphop = [
        AnoQuan(0, 0),
        AnoQuan(1, 17),
        AnoQuan(2, 27),
        AnoQuan(3, 28),
    ];

    var outros = [
        AnoQuan(0, 5),
        AnoQuan(1, 19),
        AnoQuan(2, 35),
        AnoQuan(3, 36),
    ];

    return [
       charts.Series<AnoQuan, int>(
            id: 'Metal',
            // colorFn specifies that the line will be blue.
            colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
            // areaColorFn specifies that the area skirt will be light blue.
            areaColorFn: (_, __) =>
                charts.MaterialPalette.blue.shadeDefault.lighter,
            domainFn: (AnoQuan obj, _) => obj.ano,
            measureFn: (AnoQuan obj, _) => obj.quantidade,
            data: metal,
            
        ),
       charts.Series<AnoQuan, int>(
            id: 'Trip_Hop',
            // colorFn specifies that the line will be red.
            colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
            // areaColorFn specifies that the area skirt will be light red.
            areaColorFn: (_, __) => charts.MaterialPalette.red.shadeDefault.lighter,
            domainFn: (AnoQuan obj, _) => obj.ano,
            measureFn: (AnoQuan obj, _) => obj.quantidade,
            data: triphop,
        ),
       charts.Series<AnoQuan, int>(
            id: '´Rock',
            // colorFn specifies that the line will be green.
            colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
            // areaColorFn specifies that the area skirt will be light green.
            areaColorFn: (_, __) =>
                charts.MaterialPalette.green.shadeDefault.lighter,
            domainFn: (AnoQuan obj, _) => obj.ano,
            measureFn: (AnoQuan obj, _) => obj.quantidade,
            data: rock,
        ),
        charts.Series<AnoQuan, int>(
            id: 'Core',
            // colorFn specifies that the line will be green.
            colorFn: (_, __) => charts.MaterialPalette.purple.shadeDefault,
            // areaColorFn specifies that the area skirt will be light green.
            areaColorFn: (_, __) =>
                charts.MaterialPalette.purple.shadeDefault.lighter,
            domainFn: (AnoQuan obj, _) => obj.ano,
            measureFn: (AnoQuan obj, _) => obj.quantidade,
            data: core,
        ),
         charts.Series<AnoQuan, int>(
            id: 'Funk',
            // colorFn specifies that the line will be green.
            colorFn: (_, __) => charts.MaterialPalette.deepOrange.shadeDefault,
            // areaColorFn specifies that the area skirt will be light green.
            areaColorFn: (_, __) =>
                charts.MaterialPalette.deepOrange.shadeDefault.lighter,
            domainFn: (AnoQuan obj, _) => obj.ano,
            measureFn: (AnoQuan obj, _) => obj.quantidade,
            data: funk,
        ),
         charts.Series<AnoQuan, int>(
            id: 'Jazz',
            // colorFn specifies that the line will be green.
            colorFn: (_, __) => charts.MaterialPalette.indigo.shadeDefault,
            // areaColorFn specifies that the area skirt will be light green.
            areaColorFn: (_, __) =>
                charts.MaterialPalette.indigo.shadeDefault.lighter,
            domainFn: (AnoQuan obj, _) => obj.ano,
            measureFn: (AnoQuan obj, _) => obj.quantidade,
            data: jazz,
        ),
         charts.Series<AnoQuan, int>(
            id: 'OST',
            // colorFn specifies that the line will be green.
            colorFn: (_, __) => charts.MaterialPalette.teal.shadeDefault,
            // areaColorFn specifies that the area skirt will be light green.
            areaColorFn: (_, __) =>
                charts.MaterialPalette.teal.shadeDefault.lighter,
            domainFn: (AnoQuan obj, _) => obj.ano,
            measureFn: (AnoQuan obj, _) => obj.quantidade,
            data: ost,
        ),
         charts.Series<AnoQuan, int>(
            id: 'Synthwave',
            // colorFn specifies that the line will be green.
            colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
            // areaColorFn specifies that the area skirt will be light green.
            areaColorFn: (_, __) =>
                charts.MaterialPalette.green.shadeDefault.lighter,
            domainFn: (AnoQuan obj, _) => obj.ano,
            measureFn: (AnoQuan obj, _) => obj.quantidade,
            data: synthwave,
        ),
         charts.Series<AnoQuan, int>(
            id: 'Folk',
            // colorFn specifies that the line will be green.
            colorFn: (_, __) => charts.MaterialPalette.lime.shadeDefault,
            // areaColorFn specifies that the area skirt will be light green.
            areaColorFn: (_, __) =>
                charts.MaterialPalette.lime.shadeDefault.lighter,
            domainFn: (AnoQuan obj, _) => obj.ano,
            measureFn: (AnoQuan obj, _) => obj.quantidade,
            data: folk,
        ),
         charts.Series<AnoQuan, int>(
            id: 'Hip_Hop',
            // colorFn specifies that the line will be green.
            colorFn: (_, __) => charts.MaterialPalette.yellow.shadeDefault,
            // areaColorFn specifies that the area skirt will be light green.
            areaColorFn: (_, __) =>
                charts.MaterialPalette.yellow.shadeDefault.lighter,
            domainFn: (AnoQuan obj, _) => obj.ano,
            measureFn: (AnoQuan obj, _) => obj.quantidade,
            data: hiphop,
        ),
         charts.Series<AnoQuan, int>(
            id: 'Outros',
            // colorFn specifies that the line will be green.
            colorFn: (_, __) => charts.MaterialPalette.gray.shadeDefault,
            // areaColorFn specifies that the area skirt will be light green.
            areaColorFn: (_, __) =>
                charts.MaterialPalette.gray.shadeDefault.lighter,
            domainFn: (AnoQuan obj, _) => obj.ano,
            measureFn: (AnoQuan obj, _) => obj.quantidade,
            data: outros,
        ),
        
    ];
  }
}

