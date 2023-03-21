import 'package:flutter/material.dart';

class AcercaDeScreen extends StatelessWidget {
  const AcercaDeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    //final alto = size.height * 0.01;
    //final altoCtnr = size.height * 0.03;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.1,
          ),
          Image.asset(
            'assets/iktan_training_logo.png',
            height: 100,
          ),
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: Text(
              'Iktan Training',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: Text(
              '1.0.0',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          const Center(
            child: Text(
              '¿Quienes Somos?',
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          TextAboutSection(
            texto:
                'Somos una empresa comprometida con tu conocimiento y crecimiento en la areas petroleras',
            size: size,
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          const Center(
            child: Text(
              'Visión',
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          TextAboutSection(
              texto:
                  'Nuestro objetivo es ofrecer a nuestros clientes soluciones de software de alta calidad, con un enfoque en la usabilidad y la experiencia del usuario.',
              size: size)
        ],
      ),
    );
  }
}

class TextAboutSection extends StatelessWidget {
  const TextAboutSection({super.key, required this.texto, required this.size});

  final String texto;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SizedBox(
        height: size.height * 0.08,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Text(
            texto,
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}
