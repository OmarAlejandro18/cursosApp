import 'package:cursos/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ConstanciasScreen extends StatelessWidget {
  const ConstanciasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Mis Constancias')),
        ),
        body: DrawerList());
  }
}
