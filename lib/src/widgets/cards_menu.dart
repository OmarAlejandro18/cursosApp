import 'package:cursos/src/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CardMenu extends StatelessWidget {
  final String urlImg;
  final String title;
  final VoidCallback onTap;

  const CardMenu(
      {super.key,
      required this.urlImg,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 120.0,
        height: 120.0,
        child: Card(
          color: AppTheme.primary,
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.asset(
                    urlImg,
                    width: 64,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
