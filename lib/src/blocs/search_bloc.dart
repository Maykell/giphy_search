import 'package:flutter/foundation.dart';

class SearchBloc with ChangeNotifier {
  String _search;

  String get getSearch => _search;

  setSearch(String value) {
    this._search = value;
    notifyListeners();
  }
}
