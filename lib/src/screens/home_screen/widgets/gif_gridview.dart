import 'package:flutter/material.dart';
import 'package:giphy_search/src/blocs/giphy_bloc.dart';
import 'package:giphy_search/src/models/giphy.dart';
import 'package:giphy_search/src/screens/home_screen/widgets/gif_gridview_item.dart';
import 'package:provider/provider.dart';

class GifGridView extends StatefulWidget {
  @override
  _GifGridViewState createState() => _GifGridViewState();
}

class _GifGridViewState extends State<GifGridView> {
  final _scrollController = new ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print("FIM DA LISTA");

        //widget.bloc.loadMore();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("BUILD GRIDVIEW");
    final giphyBloc = Provider.of<GiphyBloc>(context);

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
                (context, index) => GifGridViewItem(
                      giphy: giphyBloc.getGiphys[index],
                    ),
                childCount: giphyBloc.getGiphys.length),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 8.0, mainAxisSpacing: 8.0),
          ),
          SliverToBoxAdapter(
            child: null,
          )
        ],
      ),
    );
  }
}
