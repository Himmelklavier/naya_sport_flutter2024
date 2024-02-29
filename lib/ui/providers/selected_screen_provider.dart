import 'package:flutter/foundation.dart';

class SelectedScreenProvider extends ChangeNotifier {
  int _selectedIndex = 0; // Inicializado en la primera pantalla

  int get selectedIndex =>
      _selectedIndex; //Es privado para solo lectura por eso el guión bajo antes, cosas de dart.

  void updateSelectedIndex(int newIndex) {
    if (newIndex != _selectedIndex) {
      _selectedIndex = newIndex;
      notifyListeners(); // Notify listeners of the change
    }
  }
}
