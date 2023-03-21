import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cursos/src/db/db.dart';
import 'package:cursos/src/screens/screens.dart';
import 'package:cursos/src/theme/app_theme.dart';
import 'package:cursos/src/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    _cargandoDatosProvider();
    super.initState();
  }

  Future<void> _cargandoDatosProvider() async {
    final SQLiteQuery sqLiteQuery =
        Provider.of<SQLiteQuery>(context, listen: false);
    await _delayed(true, const Duration(milliseconds: 500));
    sqLiteQuery.updateUsuarios();

    print("la bd tiene a" + sqLiteQuery.usuarios.toString());

    if (sqLiteQuery.usuarios.length != 0) {
      print('entre a este metodo porque la BD no esta vacia');
      Navigator.pushNamed(context, 'user');
    }
  }

  Future<dynamic> _delayed(dynamic valorRetornado, Duration duracion) {
    return Future.delayed(duracion, () => valorRetornado);
  }

  @override
  Widget build(BuildContext context) {
    final SQLiteQuery sqLiteQuery = Provider.of<SQLiteQuery>(context);
    return sqLiteQuery.usuarios.length > 0
        ? UserScreen()
        : Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                const Background(),
                contenedorNeformismo(),
                containerLogo(),
                textosBienvenida(),
                SizedBox(
                  height: 800,
                  child: Column(
                    children: const [
                      SizedBox(
                        height: 550,
                      ),
                      MainShinyButtons()
                    ],
                  ),
                )
              ],
            ),
          );
  }
}

Widget contenedorNeformismo() {
  return Column(
    children: [
      const SizedBox(
        height: 160,
      ),
      Center(
        child: Container(
          width: 330,
          height: 150,
          decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade200, offset: const Offset(-7, -10)),
                const BoxShadow(color: Colors.white12, offset: Offset(5, 5))
              ]),
        ),
      ),
    ],
  );
}

Widget containerLogo() {
  return Column(
    children: [
      const SizedBox(
        height: 160,
      ),
      Center(
        child: Container(
          width: 330,
          padding: const EdgeInsets.only(top: 5),
          child: const Image(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/Iktan_Training.png',
            ),
          ),
        ),
      ),
    ],
  );
}

Widget textosBienvenida() {
  return Center(
    child: Column(
      children: [
        const SizedBox(
          height: 380,
        ),
        Text(
          'BIENVENIDO',
          style: TextStyle(
              fontSize: 48,
              letterSpacing: 5,
              color: AppTheme.primary,
              shadows: [
                Shadow(
                    offset: const Offset(1, 1),
                    color: AppTheme.primary.withOpacity(0.80),
                    blurRadius: 2),
                Shadow(
                    offset: const Offset(1, 1),
                    color: AppTheme.primary.withOpacity(0.85),
                    blurRadius: 2)
              ]),
        ),
        const Text(
          'POR FAVOR INICIA SESIÓN PARA USAR LA APLICACIÓN',
          style: TextStyle(fontSize: 11),
        )
      ],
    ),
  );
}
