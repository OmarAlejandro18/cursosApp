import 'package:cursos/src/theme/app_theme.dart';
import 'package:cursos/src/ux/ux.dart';
import 'package:flutter/material.dart';

class FormularioPerfilScreen extends StatelessWidget {
  const FormularioPerfilScreen({super.key});

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
                const TextosFormulario(),
                const SizedBox(
                  height: 20,
                ),
                FormularioDePerfil(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TextosFormulario extends StatelessWidget {
  const TextosFormulario({super.key});
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
            'Datos de Perfil',
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 60),
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}

class FormularioDePerfil extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final nombre = TextEditingController();
  final apellidoP = TextEditingController();
  final apellidoM = TextEditingController();
  final email = TextEditingController();
  final contrasena = TextEditingController();

  FormularioDePerfil({super.key});

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
                      padding: EdgeInsets.only(left: 25, right: 25, bottom: 5),
                      child: Text(
                        'Nombre(s)',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    campoNombre(nombre),
                    const Padding(
                      padding: EdgeInsets.only(
                          left: 25, right: 25, bottom: 5, top: 15),
                      child: Text(
                        'Apellido Paterno',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    campoApellidoP(apellidoP),
                    const Padding(
                      padding: EdgeInsets.only(
                          left: 25, right: 25, bottom: 5, top: 15),
                      child: Text(
                        'Apellido Materno',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    campoApellidoM(apellidoM),
                    const Padding(
                      padding: EdgeInsets.only(
                          left: 25, right: 25, bottom: 5, top: 15),
                      child: Text(
                        'Email',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    campoEmailP(email),
                    const SizedBox(
                      height: 20,
                    ),
                    botonActualizarPerfil(
                        context, nombre, apellidoP, apellidoM, email),
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

Widget campoNombre(TextEditingController nombre) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25),
    child: Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.white,
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
        controller: nombre,
        keyboardType: TextInputType.name,
        style: const TextStyle(
          color: Colors.black87,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14),
          prefixIcon: Icon(
            Icons.person,
            color: AppTheme.primary,
          ),
          hintText: 'andres',
          hintStyle: TextStyle(color: Colors.black38),
        ),
      ),
    ),
  );
}

Widget campoApellidoP(TextEditingController apellidoP) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25),
    child: Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.white,
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
        controller: apellidoP,
        keyboardType: TextInputType.name,
        style: const TextStyle(
          color: Colors.black87,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14),
          prefixIcon: Icon(
            Icons.group,
            color: AppTheme.primary,
          ),
          hintText: 'Cruz',
          hintStyle: TextStyle(color: Colors.black38),
        ),
      ),
    ),
  );
}

Widget campoApellidoM(TextEditingController apellidoM) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25),
    child: Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.white,
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
        controller: apellidoM,
        keyboardType: TextInputType.name,
        style: const TextStyle(
          color: Colors.black87,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14),
          prefixIcon: Icon(
            Icons.group,
            color: AppTheme.primary,
          ),
          hintText: 'Apellido Materno',
          hintStyle: TextStyle(color: Colors.black38),
        ),
      ),
    ),
  );
}

Widget campoEmailP(TextEditingController email) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25),
    child: Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.white,
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
        controller: email,
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(
          color: Colors.black87,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14),
          prefixIcon: Icon(
            Icons.email,
            color: AppTheme.primary,
          ),
          hintText: 'Correo electronico',
          hintStyle: TextStyle(color: Colors.black38),
        ),
      ),
    ),
  );
}

Widget botonActualizarPerfil(
    BuildContext context,
    TextEditingController nombre,
    TextEditingController apellidoP,
    TextEditingController apellidoM,
    TextEditingController email) {
  return GestureDetector(
    onTap: () => {
      print('el valor de usu es: ${email.text}'),
      print('el valor de passw es: ${apellidoP.text}'),
      nombre.text = '',
      apellidoP.text = '',
      apellidoM.text = '',
      email.text = '',
      Navigator.pop(context),
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
                  color: Colors.white),
            ),
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.arrow_forward,
              color: Colors.white,
            )
          ],
        ),
      ),
    ),
  );
}
