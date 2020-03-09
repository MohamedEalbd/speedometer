import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SpeedMeter extends StatefulWidget {
  @override
  _SpeedMeterState createState() => _SpeedMeterState();
}

class _SpeedMeterState extends State<SpeedMeter> {
  double _value = 0.000;
  Timer _timer;

  void speed(AxisLabelCreatedArgs args) {
    _timer = Timer.periodic(const Duration(milliseconds: 1000), (_timer) {
      setState(() {
        _value = (Random().nextDouble() * 40) + 60;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SfRadialGauge(
        axes: <RadialAxis>[
          RadialAxis(
              minimum: 0,
              maximum: 200,
              labelOffset: 20,
              onLabelCreated: speed,
              axisLineStyle: AxisLineStyle(
                thicknessUnit: GaugeSizeUnit.factor,
                thickness: 0.04,
              ),
              majorTickStyle:
              MajorTickStyle(length: 10, thickness: 4, color: Colors.white),
              minorTickStyle:
              MinorTickStyle(length: 5, thickness: 3, color: Colors.white),
              axisLabelStyle: GaugeTextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
              ranges: <GaugeRange>[
                GaugeRange(
                  startValue: 0,
                  endValue: 200,
                  sizeUnit: GaugeSizeUnit.factor,
                  startWidth: 0.03,
                  endWidth: 0.03,
                  gradient: SweepGradient(colors: const <Color>[
                    Colors.green,
                    Colors.yellow,
                    Colors.red
                  ], stops: const <double>[
                    0.0,
                    0.5,
                    1
                  ]),
                ),
              ],
              pointers: <GaugePointer>[
                NeedlePointer(
                    value: _value,
                    needleLength: .89,
                    enableAnimation: true,
                    animationType: AnimationType.ease,
                    needleStartWidth: 1.5,
                    needleEndWidth: 6,
                    needleColor: Colors.red,
                    knobStyle: KnobStyle(knobRadius: .09))
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                    widget: Container(
                        child: Column(children: <Widget>[
                          Text('${_value.toStringAsFixed(2)}',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                          SizedBox(height: 30),
                          Text('mph',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              )),
                        ])),
                    angle: 90,
                    positionFactor: 0.75)
              ]),
        ],
      ),
    );
  }
}
