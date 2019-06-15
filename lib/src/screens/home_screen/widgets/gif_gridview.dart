import 'package:flutter/material.dart';
import 'package:giphy_search/src/blocs/giphy_bloc.dart';
import 'package:giphy_search/src/screens/home_screen/widgets/gif_gridview_item.dart';
import 'package:provider/provider.dart';

class GifGridView extends StatefulWidget {
  
  @override
  _GifGridViewState createState() => _GifGridViewState();
}

class _GifGridViewState extends State<GifGridView> {

  final _scrollController = new ScrollController();
  GiphyBloc bloc;

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print("FIM DA LISTA");
        bloc.loadMore();
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
  void didChangeDependencies() {
    print("RECUPEROU BLOC");
    bloc = Provider.of<GiphyBloc>(context, listen: false);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print("BUILD GRIDVIEW");
 
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          Consumer<GiphyBloc>(builder: (context, giphyBloc, _) {
            print("BUILD SLIVERGRID");
                 return SliverGrid( delegate: SliverChildBuilderDelegate(
                (context, index) => GifGridViewItem(
                      giphy: giphyBloc.getGiphys[index],
                    ),
                childCount: giphyBloc.getGiphys.length),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 8.0, mainAxisSpacing: 8.0),);
          }),
        ],
      ),
    );
  }
}
