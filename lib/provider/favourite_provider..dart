import 'package:flutter/foundation.dart';

class FavouriteIteamProvider with ChangeNotifier {
  List<int> _selecteditem = [];
  List<int> get selectedtem => _selecteditem;

  void additem(int value) {
    _selecteditem.add(value);
    notifyListeners();
  }

  void removeitem(int value) {
    _selecteditem.remove(value);
    notifyListeners();
  }
}
