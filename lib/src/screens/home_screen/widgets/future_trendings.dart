import 'package:flutter/material.dart';
import 'package:giphy_search/src/blocs/giphy_bloc.dart';
import 'package:giphy_search/src/models/giphy.dart';
import 'package:giphy_search/src/screens/home_screen/widgets/gif_gridview.dart';
import 'package:giphy_search/src/screens/home_screen/widgets/gif_gridview_empty.dart';
import 'package:provider/provider.dart';

class FutureTrendings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<GiphyBloc>(context);

    return FutureBuilder<List<Giphy>>(
      future: bloc.getTrendingGifs(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          case ConnectionState.none:
            return Center(child: CircularProgressIndicator());
          default:
            if (snapshot.hasData) {
              bloc.addGiphys(snapshot.data);
            }
            return Text(snapshot.error.toString());
        }
      },
    );
  }
}