import 'package:cursos/src/providers/providers.dart';
import 'package:cursos/src/theme/app_theme.dart';
import 'package:cursos/src/ux/ux.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormularioContrasenaScreen extends StatelessWidget {
  const FormularioContrasenaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const GloboCliper(
              color: Color.fromARGB(100, 248, 178, 51),
              pTop: 60,
              pRight: 0,
              pBottom: 0,
              pLeft: 0),
          const GloboCliper(
              color: AppTheme.primary,
              pTop: 0,
              pRight: 0,
              pBottom: 0,
              pLeft: 0),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 170,
                ),
                const TextosFormularioC(),
                const SizedBox(
                  height: 20,
                ),
                FormularioDeContrasena(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TextosFormularioC extends StatelessWidget {
  const TextosFormularioC({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            'Datos de Contraseña',
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 60),
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}

class FormularioDeContrasena extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final contrasena = TextEditingController();
  final nuevaContras = TextEditingController();
  final confirmNuevaContra = TextEditingController();

  FormularioDeContrasena({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 25, right: 25, bottom: 15),
                      child: Text(
                        'Contraseña Actual',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    campoContrasena(context, contrasena),
                    const Padding(
                      padding: EdgeInsets.only(
                          left: 25, right: 25, bottom: 15, top: 15),
                      child: Text(
                        'Nueva Contraseña',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    campoNuevaContrasena(context, nuevaContras),
                    const Padding(
                      padding: EdgeInsets.only(
                          left: 25, right: 25, bottom: 15, top: 15),
                      child: Text(
                        'Confirmar Contraseña',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    campoConfirmarContrasena(context, confirmNuevaContra),
                    const SizedBox(
                      height: 20,
                    ),
                    botonActualizarContra(
                        context, contrasena, nuevaContras, confirmNuevaContra),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

Widget campoContrasena(BuildContext context, TextEditingController contrasena) {
  final ocultar = Provider.of<BotonContrasenaActual>(context);

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25),
    child: Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: AppTheme.baseBlanca,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            offset: Offset(4, -4),
            blurRadius: 6,
            color: Colors.black26,
          ),
        ],
      ),
      height: 60,
      child: TextFormField(
        controller: contrasena,
        obscureText: ocultar.ocultar,
        keyboardType: TextInputType.name,
        style: const TextStyle(
          color: Colors.black87,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(top: 14),
          prefixIcon: const Icon(
            Icons.lock,
            color: AppTheme.primary,
          ),
          hintText: 'Contraseña Actual',
          hintStyle: const TextStyle(color: Colors.black38),
          suffixIcon: GestureDetector(
            onTap: () => {ocultar.esOcultar = !ocultar.ocultar},
            child: ocultar.ocultar
                ? const Icon(
                    Icons.visibility_off,
                    size: 30,
                    color: AppTheme.primary,
                  )
                : const Icon(
                    Icons.visibility,
                    size: 30,
                    color: AppTheme.primary,
                  ),
          ),
        ),
      ),
    ),
  );
}

Widget campoNuevaContrasena(
    BuildContext context, TextEditingController nuevaContras) {
  final ocultar = Provider.of<BotonNuevaContrasena>(context);

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25),
    child: Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: AppTheme.baseBlanca,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            offset: Offset(4, -4),
            blurRadius: 6,
            color: Colors.black26,
          ),
        ],
      ),
      height: 60,
      child: TextFormField(
        controller: nuevaContras,
        obscureText: ocultar.ocultar,
        style: const TextStyle(
          color: Colors.black87,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(top: 14),
          prefixIcon: const Icon(
            Icons.lock_sharp,
            color: AppTheme.primary,
          ),
          hintText: 'Ingrese la nueva contraseña',
          hintStyle: const TextStyle(color: Colors.black38),
          suffixIcon: GestureDetector(
            onTap: () => {ocultar.esOcultar = !ocultar.ocultar},
            child: ocultar.ocultar
                ? const Icon(
                    Icons.visibility_off,
                    size: 30,
                    color: AppTheme.primary,
                  )
                : const Icon(
                    Icons.visibility,
                    size: 30,
                    color: AppTheme.primary,
                  ),
          ),
        ),
      ),
    ),
  );
}

Widget campoConfirmarContrasena(
    BuildContext context, TextEditingController confirmNuevaContra) {
  final ocultar = Provider.of<BotonConfirmarContrasena>(context);

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25),
    child: Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: AppTheme.baseBlanca,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            offset: Offset(4, -4),
            blurRadius: 6,
            color: Colors.black26,
          ),
        ],
      ),
      height: 60,
      child: TextFormField(
        controller: confirmNuevaContra,
        obscureText: ocultar.ocultar,
        style: const TextStyle(
          color: Colors.black87,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(top: 14),
          prefixIcon: const Icon(
            Icons.lock_sharp,
            color: AppTheme.primary,
          ),
          hintText: 'Confirmar contraseña',
          hintStyle: const TextStyle(color: Colors.black38),
          suffixIcon: GestureDetector(
            onTap: () => {ocultar.esOcultar = !ocultar.ocultar},
            child: ocultar.ocultar
                ? const Icon(
                    Icons.visibility_off,
                    size: 30,
                    color: AppTheme.primary,
                  )
                : const Icon(
                    Icons.visibility,
                    size: 30,
                    color: AppTheme.primary,
                  ),
          ),
        ),
      ),
    ),
  );
}

Widget botonActualizarContra(
    BuildContext context,
    TextEditingController contrasena,
    TextEditingController nuevaContras,
    TextEditingController confirmNuevaContra) {
  return GestureDetector(
    onTap: () => {
      print('el valor de contra es: ${contrasena.text}'),
      print('el valor de passw es: ${nuevaContras.text}'),
      Navigator.pop(context),
      contrasena.text = '',
      nuevaContras.text = '',
      confirmNuevaContra.text = ''
    },
    child: Padding(
      padding: const EdgeInsets.only(
        left: 220,
      ),
      child: Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            colors: [
              Color(0xfff7b858),
              Color(0xfff7b858),
            ],
          ),
        ),
        child: Row(
          children: const [
            SizedBox(
              width: 25,
            ),
            Text(
              'Actualizar',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  color: AppTheme.baseBlanca),
            ),
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.arrow_forward,
              color: AppTheme.baseBlanca,
            )
          ],
        ),
      ),
    ),
  );
}
