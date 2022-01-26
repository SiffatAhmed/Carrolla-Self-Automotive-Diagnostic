import 'package:flutter/material.dart';
import 'dart:convert';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List _items = [];
  List itemsDisplay = [];

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await DefaultAssetBundle.of(context)
        .loadString("assets/Codes/obdcodes.json");
    final data = await json.decode(response);
    setState(() {
      _items = data["codes"];
      itemsDisplay = _items;
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return index == 0 ? _searchBar() : _listItem(index - 1);
        },
        itemCount: itemsDisplay.length + 1,
      ),
    );
  }

  _searchBar() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.1,
      ),
      padding: EdgeInsets.only(
        top: 10,
      ),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          hintText: 'Search.....',
          labelText: "Search Code",
        ),
        onChanged: (text) {
          text = text.toUpperCase();
          setState(() {
            itemsDisplay = _items.where((items) {
              var noteTile = items["code"];
              return noteTile.contains(text);
            }).toList();
          });
        },
      ),
    );
  }

  _listItem(index) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        leading: Text(itemsDisplay[index]["code"]),
        title: Text(itemsDisplay[index]["description"]),
        //subtitle: Text(_items[index]["description"]),
      ),
    );
  }
}
