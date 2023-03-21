import 'package:cursos/src/theme/app_theme.dart';
import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  const DrawerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context, i) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1, 0),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(
              parent: AnimationController(
                vsync: Scaffold.of(context),
                duration: const Duration(milliseconds: 500),
              )..forward(),
              curve: Curves.easeInOutCubic,
            ),
          ),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: SizedBox(
              height: size.height * 0.2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: size.height * 0.2,
                    width: size.width * 0.3,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(100),
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(100)),
                    ),
                    child: const ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(100),
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(100),
                      ),
                      child: FadeInImage(
                        image: NetworkImage(
                            'https://www.nationalgeographic.com.es/medio/2022/12/02/desert-angel_778d8483_221202112927_800x800.jpg'),
                        placeholder: AssetImage('assets/no-Imagen.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  DetallesConstancia(
                    id: i,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class DetallesConstancia extends StatelessWidget {
  const DetallesConstancia({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: 55,
            width: 222,
            child: Text(
              'Titulo de la constancia o del curso que fue completado $id',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text('Folio $id'),
        ),
        SizedBox(
          height: 50,
          width: 150,
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  print('se esta presionando el boton de descargar en $id');
                },
                icon: const Icon(
                  Icons.download,
                  color: AppTheme.primary,
                ),
              ),
              IconButton(
                onPressed: () {
                  print('se esta presionando el boton de compartir en $id');
                },
                icon: const Icon(
                  Icons.share,
                  color: AppTheme.primary,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
