import 'package:giphy_search/src/models/giphy.dart';

import 'client.dart';

class GiphyService {
  Future<List<Giphy>> getTrending() async {
    final response = await client().get(
        "trending?api_key=5Q0H82xKXsspXC0RGv9J0g4PyxyUyERt&limit=30&rating=G");
    final gifs = response.data["data"] as List;
    return gifs.map<Giphy>((data) => Giphy.fromJson(data)).toList();
  }

  Future<List<Giphy>> search(String query, {int offset = 0}) async {
    final response = await client().get(
        "search?api_key=5Q0H82xKXsspXC0RGv9J0g4PyxyUyERt&q=$query&limit=20&offset=$offset&rating=G&lang=en");
    final json = response.data["data"] as List;
    return json.map<Giphy>((data) => Giphy.fromJson(data)).toList();
  }
}
