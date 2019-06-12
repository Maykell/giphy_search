import 'package:flutter/foundation.dart';
import 'package:giphy_search/src/models/giphy.dart';
import 'package:giphy_search/src/services/api/giphy_service.dart';

class GiphyBloc with ChangeNotifier {
  final _service = GiphyService();

  List<Giphy> _giphys = List();
  int _offset = 1;

  bool isLoading = false;
  bool _isQuerying = false;

  List<Giphy> get getGiphys => _giphys;

  addGiphys(giphys) {
    this._giphys = giphys;
    notifyListeners();
  }

  Future<List<Giphy>> getTrendingGifs() async {
    return await _service.getTrending();
  }

  Future<List<Giphy>> _searchGifs(String query, {int offset}) async {
    return await _service.search(query, offset: offset);
  }

  Future<List<Giphy>> validateIfSearchGiphy(String query) {
    if (query == null || query.isEmpty) {
      _isQuerying = false;
      return getTrendingGifs();
    }

    _isQuerying = true;

    return _searchGifs(query);
  }

  loadMore() async {
    if (_isQuerying) {
      isLoading = true;
      final response = await _searchGifs("text", offset: _offset);
      isLoading = false;
      _giphys.addAll(response);
      _offset++;
      notifyListeners();
    }
  }
}
