import 'package:cursos/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactanosScreen extends StatefulWidget {
  const ContactanosScreen({super.key});

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactanosScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Contactanos')),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Ponerse en contacto!',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Complete el siguiente formulario para enviarnos un mensaje.',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            const SizedBox(height: 32.0),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  nombreContacto(_nameController),
                  const SizedBox(height: 16.0),
                  emailContacto(_emailController),
                  const SizedBox(height: 16.0),
                  mensajeContacto(_messageController),
                  const SizedBox(height: 32.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primary,
                      elevation: 0,
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Send message logic
                        print('Message sent!');
                      }
                    },
                    child: const Text('  Enviar  '),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32.0),
            const Center(
              child: Text(
                'Conéctate con nosotros en las redes sociales!',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.email),
                  splashColor: Colors.transparent,
                  onPressed: () {
                    // Email logic
                    print('Email us!');
                  },
                ),
                IconButton(
                  icon: const Icon(FontAwesomeIcons.facebook),
                  splashColor: Colors.transparent,
                  onPressed: () {
                    // Facebook logic
                    print('Find us on Facebook!');
                  },
                ),
                IconButton(
                  icon: const Icon(FontAwesomeIcons.twitter),
                  splashColor: Colors.transparent,
                  onPressed: () {
                    // Twitter logic
                    print('Follow us on Twitter!');
                  },
                ),
                IconButton(
                  icon: const Icon(FontAwesomeIcons.whatsapp),
                  splashColor: Colors.transparent,
                  onPressed: () {
                    // Twitter logic
                    print('Follow us on Twitter!');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget nombreContacto(TextEditingController nombre) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
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
      child: Center(
        child: TextFormField(
          controller: nombre,
          keyboardType: TextInputType.name,
          style: const TextStyle(
            color: Colors.black87,
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Por favor ingrese un nombre';
            }
            return null;
          },
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(
              Icons.person,
              color: AppTheme.primary,
            ),
            hintText: 'Nombre',
            hintStyle: TextStyle(color: Colors.black38),
          ),
        ),
      ),
    ),
  );
}

Widget emailContacto(TextEditingController email) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
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
        validator: (value) {
          if (value!.isEmpty) {
            return 'Por favor ingresa un email';
          }
          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
            return 'Por favor ingrese un email valido';
          }
          return null;
        },
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

Widget mensajeContacto(TextEditingController mensaje) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
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
      height: 100,
      child: Center(
        child: TextFormField(
          controller: mensaje,
          maxLines: 5,
          style: const TextStyle(
            color: Colors.black87,
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Por favor ingrese su mensaje';
            }
            return null;
          },
          decoration: const InputDecoration(
            label: Text(
              'Mensaje',
              style: TextStyle(color: Colors.black38),
            ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(
              Icons.person,
              color: AppTheme.primary,
            ),
            hintStyle: TextStyle(color: Colors.black38),
          ),
        ),
      ),
    ),
  );
}
