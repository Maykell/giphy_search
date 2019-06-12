import 'package:flutter/material.dart';
import 'package:giphy_search/src/blocs/giphy_bloc.dart';
import 'package:giphy_search/src/blocs/search_bloc.dart';

import 'package:giphy_search/src/themes/theme_default.dart';
import 'package:provider/provider.dart';

import 'screens/home_screen/home_screen.dart';

final _theme = DefaultTheme().themeData();

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Giphy Search",
      theme: _theme,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<SearchBloc>(
              builder: (context) => SearchBloc()),
          ChangeNotifierProvider<GiphyBloc>(builder: (context) => GiphyBloc()),
        ],
        child: HomeScreen(),
      ),
    );
  }
}
