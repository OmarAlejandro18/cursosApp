import 'package:cursos/src/theme/app_theme.dart';
import 'package:flutter/material.dart';

class MainShinyButtons extends StatelessWidget {
  const MainShinyButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: Column(
          children: [
            ShinyButton(
              color: AppTheme.primary,
              onTap: () => {Navigator.pushNamed(context, 'login')},
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Iniciar",
                  style: TextStyle(color: Colors.black, letterSpacing: 2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShinyButton extends StatefulWidget {
  final Widget child;
  final Color color;
  final VoidCallback onTap;

  const ShinyButton(
      {super.key,
      required this.color,
      required this.onTap,
      required this.child});

  @override
  State<ShinyButton> createState() => _ShinyButtonState();
}

class _ShinyButtonState extends State<ShinyButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            return Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    widget.color,
                    Colors.white,
                    widget.color,
                  ],
                  stops: [
                    0.0,
                    _controller.value,
                    1.0,
                  ],
                ),
              ),
              child: widget.child,
            );
          }),
    );
  }
}
