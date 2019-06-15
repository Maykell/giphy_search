import 'package:flutter/foundation.dart';
import 'package:giphy_search/src/models/giphy.dart';
import 'package:giphy_search/src/services/api/giphy_service.dart';

class GiphyBloc with ChangeNotifier {

  final _service = GiphyService();

  List<Giphy> _giphys = List();
  int _offset = 1;

  bool isLoading = false;
  String _query;

  List<Giphy> get getGiphys => _giphys;

  set setGifs(gifs) => _giphys = gifs;
  set setQuery(query) => _query = query;

  Future<List<Giphy>> getTrendingGifs() { 

    return _service.getTrending();
  }

  Future<List<Giphy>> searchGifs(String query, {int offset}) {
    setQuery = query;

    return _service.search(query, offset: offset);
  }

  loadMore() async {
     
      if (_query == null || _query.isEmpty) {
        print("QUERY: $_query");
        return;
      }
 print("LOAD MORE : $_query");
      final response = await searchGifs(_query, offset: _offset);
      _giphys.addAll(response);
       notifyListeners();
      _offset++;
     
  }
}
