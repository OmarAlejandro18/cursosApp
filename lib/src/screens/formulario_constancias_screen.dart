import 'package:cursos/src/theme/app_theme.dart';
import 'package:cursos/src/ux/ux.dart';
import 'package:flutter/material.dart';

class FormularioContanciaScreen extends StatelessWidget {
  const FormularioContanciaScreen({super.key});

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
                const TextosFormularioConst(),
                const SizedBox(
                  height: 20,
                ),
                FormularioDeContancias(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TextosFormularioConst extends StatelessWidget {
  const TextosFormularioConst({super.key});
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
            'Datos de las Constancias',
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 60),
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}

class FormularioDeContancias extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final curp = TextEditingController();
  final ocupacionEspecifica = TextEditingController();
  final razonSocial = TextEditingController();
  final shcp = TextEditingController();
  final patronR = TextEditingController();

  FormularioDeContancias({super.key});

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
                        'Clave Única de Registro de Población (CURP)',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    campoCurp(curp),
                    const Padding(
                      padding: EdgeInsets.only(
                          left: 25, right: 25, bottom: 5, top: 15),
                      child: Text(
                        'Ocupación Especifica (Catálogo Nacional de Ocupaciones)',
                        maxLines: 2,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    campoOcupacionEspecifica(ocupacionEspecifica),
                    const Padding(
                      padding: EdgeInsets.only(
                          left: 25, right: 25, bottom: 5, top: 15),
                      child: Text(
                        'Nombre o razón Social ( En caso de persona fisica, anotar apellido paterno, apellido materno y nombre(s) )',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    campoRazonSocial(razonSocial),
                    const Padding(
                      padding: EdgeInsets.only(
                          left: 25, right: 25, bottom: 5, top: 15),
                      child: Text(
                        'Registro Federal de Contribuyentes como homoclave (SHCP)',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    campoSHCP(shcp),
                    const Padding(
                      padding: EdgeInsets.only(
                          left: 25, right: 25, bottom: 5, top: 15),
                      child: Text(
                        'Patrón o Representante Legal',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    campoPatronR(patronR),
                    const SizedBox(
                      height: 20,
                    ),
                    botonConstancia(context, curp, ocupacionEspecifica,
                        razonSocial, shcp, patronR),
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

Widget campoCurp(TextEditingController curp) {
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
        controller: curp,
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
          hintText: 'CURP',
          hintStyle: TextStyle(color: Colors.black38),
        ),
      ),
    ),
  );
}

Widget campoOcupacionEspecifica(TextEditingController ocupacionEspecifica) {
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
        controller: ocupacionEspecifica,
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
          hintText: 'Ocupación Especifica',
          hintStyle: TextStyle(color: Colors.black38),
        ),
      ),
    ),
  );
}

Widget campoRazonSocial(TextEditingController razonSocial) {
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
        controller: razonSocial,
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
          hintText: 'Razón Social',
          hintStyle: TextStyle(color: Colors.black38),
        ),
      ),
    ),
  );
}

Widget campoSHCP(TextEditingController shcp) {
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
        controller: shcp,
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
          hintText: 'shcp',
          hintStyle: TextStyle(color: Colors.black38),
        ),
      ),
    ),
  );
}

Widget campoPatronR(TextEditingController patronR) {
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
        controller: patronR,
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
          hintText: 'patrón',
          hintStyle: TextStyle(color: Colors.black38),
        ),
      ),
    ),
  );
}

Widget botonConstancia(
  BuildContext context,
  TextEditingController curp,
  TextEditingController ocupacionEspecifica,
  TextEditingController razonSocial,
  TextEditingController shcp,
  TextEditingController patronR,
) {
  return GestureDetector(
    onTap: () => {
      print('el valor de usu es: ${curp.text}'),
      print('el valor de passw es: ${ocupacionEspecifica.text}'),
      curp.text = '',
      ocupacionEspecifica.text = '',
      razonSocial.text = '',
      shcp.text = '',
      patronR.text = '',
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
