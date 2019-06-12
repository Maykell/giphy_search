import 'package:flutter/material.dart';
import 'package:giphy_search/src/blocs/giphy_bloc.dart';
import 'package:giphy_search/src/models/giphy.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class GifGridView extends StatefulWidget {
  final List<Giphy> gifs;
  final GiphyBloc bloc;

  GifGridView(this.gifs, this.bloc);

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

        widget.bloc.loadMore();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // bool _showPogressIndicator() => isLoading = true;
  // bool _hidePogressIndicator() => isLoading = false;

  @override
  Widget build(BuildContext context) {
    print("BUILD GRIDVIEW");
    final giphyBloc = Provider.of<GiphyBloc>(context);
    return _buildGridView(giphyBloc);
  }

  Widget _buildGridView(GiphyBloc bloc) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
                (context, index) =>
                    _buildGridRow(context, index, bloc.getGiphys),
                childCount: bloc.getGiphys.length > 0
                    ? bloc.getGiphys.length
                    : widget.gifs.length),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 8.0, mainAxisSpacing: 8.0),
          ),
          SliverToBoxAdapter(
              child: bloc.isLoading ? _buildLoadMoreProgressIndicator() : null)
        ],
      ),
    );

    // return GridView.builder(
    //   padding: EdgeInsets.all(8.0),
    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //       crossAxisCount: 2, crossAxisSpacing: 8.0, mainAxisSpacing: 8.0),
    //   itemCount: widget.gifs.length + 1,
    //   itemBuilder: (context, index) {
    //     if (index == widget.gifs.length) {
    //       return _buildLoadMoreProgressIndicator();
    //     } else {
    //       return _buildGridRow(context, index);
    //     }
    //   },
    //   controller: _scrollController,
    // );
  }

  Widget _buildGridRow(context, index, gifs) {
    return GestureDetector(
      child: FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: gifs[index].images.previewWebp.url,
          fit: BoxFit.cover),
    );
  }

  Widget _buildLoadMoreProgressIndicator() {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
