import 'package:flutter/material.dart';

class BotonContrasena with ChangeNotifier {
  bool _esOculto = false;

  get oculto {
    return _esOculto;
  }

  set esOculto(bool oculto) {
    _esOculto = oculto;
    notifyListeners();
  }
}
