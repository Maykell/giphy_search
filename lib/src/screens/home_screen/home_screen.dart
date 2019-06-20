import 'package:flutter/material.dart';
import 'package:giphy_search/src/blocs/search_bloc.dart';
import 'package:giphy_search/src/screens/home_screen/widgets/future_search.dart';
import 'package:giphy_search/src/screens/home_screen/widgets/future_trendings.dart';
import 'package:giphy_search/src/screens/home_screen/widgets/search_text_field.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              final query = searchBloc.getSearch;
              return query == null || query.isEmpty
                  ? FutureTrendings()
                  : FutureSearch(
                      query: query,
                    );
            }),
          ),
        ],
      ),
    );

    return scaffold;
  }
}
