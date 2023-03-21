import 'package:cursos/src/theme/app_theme.dart';
import 'package:flutter/material.dart';

class DetallesClase extends StatelessWidget {
  const DetallesClase({super.key});

  @override
  Widget build(BuildContext context) {
    var parametros = ModalRoute.of(context)!.settings.arguments;
    return SilverAppBar(id: parametros);
  }
}

class SilverAppBar extends StatelessWidget {
  const SilverAppBar({
    super.key,
    required this.id,
  });

  final dynamic id;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      children: [
        _CustomAppBar(
          id: id,
          size: size,
        ),
        CursoTabBar(
          id: id,
          size: size,
        ),
        // const SliverTabBar()
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({required this.id, required this.size});

  final dynamic id;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: size.height * 0.33,
          decoration: const BoxDecoration(
            color: AppTheme.primary,
            // borderRadius: BorderRadius.only(
            //     bottomLeft: Radius.circular(5),
            //     bottomRight: Radius.circular(5)),
          ),
          child: const ClipRRect(
            // borderRadius: BorderRadius.only(
            //     bottomLeft: Radius.circular(5),
            //     bottomRight: Radius.circular(5)),
            child: FadeInImage(
              image: NetworkImage(
                  'https://www.nationalgeographic.com.es/medio/2022/12/02/desert-angel_778d8483_221202112927_800x800.jpg'),
              placeholder: AssetImage('assets/loading.gif'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back,
                size: 40,
                color: AppTheme.baseBlanca,
              ),
            ),
            SizedBox(
              height: size.height * 0.14,
            ),
            Container(
              width: double.infinity,
              height: size.height * 0.07,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5)),
              ),
              child: Center(
                child: Text(
                  'Detalles de la clase $id',
                  maxLines: 3,
                  style: const TextStyle(
                      color: AppTheme.baseBlanca,
                      fontSize: 15,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class CursoTabBar extends StatelessWidget {
  const CursoTabBar({super.key, required this.size, required this.id});
  final Size size;
  final int id;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: AppTheme.primary,
            ),
            height: size.height * 0.07,
            child: TabBar(
              isScrollable: true,
              labelColor: AppTheme.baseBlanca,
              unselectedLabelColor: AppTheme.baseBlanca.withOpacity(0.4),
              indicatorColor: Colors.white,
              tabs: const [
                Tab(
                  text: 'Info.',
                ),
                Tab(
                  text: 'Tareas',
                ),
                Tab(
                  text: 'Materiales',
                ),
                Tab(
                  text: 'Temario',
                ),
                Tab(
                  text: 'Liga de Acceso',
                ),
              ],
            ),
          ),
          SizedBox(
              height: size.height * 0.6,
              child: TabBarView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Text('La clase $id consiste en aprender sobre...')
                    ],
                  ),
                  const Icon(Icons.abc),
                  const Icon(Icons.abc),
                  const Icon(Icons.abc),
                  const Icon(Icons.abc),
                ],
              ))
        ],
      ),
    );
  }
}
