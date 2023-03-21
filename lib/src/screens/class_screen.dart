import 'package:cursos/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class ClasesScreen extends StatelessWidget {
  final _pageController = PageController(
    viewportFraction: 0.3,
  );

  ClasesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clases Curso'),
      ),
      body: Stack(
        children: [
          const Text('Aqui ira un texto o widget'),
          Center(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    scrollDirection: Axis.vertical,
                    itemCount: 5,
                    itemBuilder: (context, index) => builder(index),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  builder(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        //print('el valor de index es ${index}');
        double value = 1.0;
        //print('el valor de value es ${value}');

        if (_pageController.position.haveDimensions) {
          value = _pageController.page! - index;
          //print('el valor de value en la primera condicion es ${value}');
          if (value >= 0) {
            //print('el valor de value en el segundo if es ${value}');
            double _lowerLimit = 0;
            double _upperLimit = math.pi / 2;

            //print('el valor de _lowerLimit es ${_lowerLimit}');
            //print('el valor de _upperLimit es ${_upperLimit}');

            value = (_upperLimit - (value.abs() * (_upperLimit - _lowerLimit)))
                .clamp(_lowerLimit, _upperLimit);

            //print('el valor de value en la primera operacion es ${value}');
            value = _upperLimit - value;
            //print('el valor de value en la segunda operacion es ${value}');
            value *= -1;
            //print('el valor de value en la tercera operacion operacion es ${value}');
          }
        } else {
          //Won't work properly in case initialPage in changed in PageController
          if (index == 0) {
            value = 0;
          } else if (index == 1) {
            value = -1;
          }
        }

        return Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateX(value),
          alignment: Alignment.center,
          child: CardClass(
            i: index,
          ),
        );
      },
      child: CardClass(
        i: index,
      ),
    );
  }
}
