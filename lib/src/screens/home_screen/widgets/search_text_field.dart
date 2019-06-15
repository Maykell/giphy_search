import 'package:flutter/material.dart';
import 'package:giphy_search/src/blocs/search_bloc.dart';
import 'package:giphy_search/src/utils/debouncer.dart';
import 'package:provider/provider.dart';

class SearchTextField extends StatelessWidget {
  final debouncer = Debouncer(milliseconds: 1000);

  @override
  Widget build(BuildContext context) {
    print("BUILD TEXTFIELD");
    final searchBloc = Provider.of<SearchBloc>(context, listen: false);

    return TextField(
        decoration: InputDecoration(
            labelText: "Buscar gifs",
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            hintText: "Ex: animais..."),
        cursorColor: Colors.white,
        style: TextStyle(fontSize: 18.0),
        textAlign: TextAlign.center,
        onChanged: (value) {
          debouncer.run(() => searchBloc.setSearch(value));
        });
  }
}
