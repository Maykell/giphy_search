import 'package:flutter/material.dart';
import 'package:giphy_search/src/blocs/giphy_bloc.dart';
import 'package:giphy_search/src/blocs/search_bloc.dart';
import 'package:giphy_search/src/models/giphy.dart';
import 'package:giphy_search/src/screens/home_screen/widgets/gif_gridview.dart';
import 'package:giphy_search/src/screens/home_screen/widgets/search_text_field.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  Widget _futureTrendingsOrSearch(context, query) {
    final giphyBloc = Provider.of<GiphyBloc>(context, listen: false);

    return FutureBuilder<List<Giphy>>(
      future: giphyBloc.validateIfSearchGiphy(query),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          case ConnectionState.none:
            return Center(child: CircularProgressIndicator());
          default:
            if (snapshot.hasData) {
              giphyBloc.setGiphys(snapshot.data);
              return snapshot.data.isEmpty
                  ? gifNotFound()
                  : GifGridView(snapshot.data, giphyBloc);
            }
            return Text(snapshot.error.toString());
        }
      },
    );
  }

  Widget gifNotFound() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.error,
            color: Colors.white,
            size: 75.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              "Nenhum gif encontrado...",
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print("BUILD HOME");
    final appBar = AppBar(
      title: Image.network(
        "https://developers.giphy.com/static/img/dev-logo-lg.7404c00322a8.gif",
        height: 30.0,
      ),
      centerTitle: true,
    );

    final scaffold = Scaffold(
      appBar: appBar,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchTextField(),
          ),
          Expanded(
            child: Consumer<SearchBloc>(builder: (context, searchBloc, _) {
              print("BUILD SEARCH BLOC / FUTURE BUILDER");
              return _futureTrendingsOrSearch(context, searchBloc.getSearch);
            }),
          ),
        ],
      ),
    );

    return scaffold;
  }
}
