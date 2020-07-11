import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travelblog/Screens/DetailPage.dart';
import 'package:travelblog/models/Travel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> data;

  @override
  void initState() {
    super.initState();
    _loadData().then((value) {
      setState(() {
        data = value;
      });
    });
    print("*********************************************");
    _loadDataToTravelList().then((value) => print("**********************************************" + value[0].title));
  }

  Future<List<dynamic>> _loadData() async {
    String jsonString = await rootBundle.loadString('assets/data.json');
    return json.decode(jsonString).toList();
  }

  Future<List<Travel>> _loadDataToTravelList() async {
    String jsonString = await rootBundle.loadString('assets/data.json');
    List<dynamic> jsonResponse = json.decode(jsonString).toList();
    return jsonResponse.map((v) => Travel.fromJson(v)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Travel Blog",
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        elevation: 20,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: _createBody(),
    );
  }

  Widget _createBody() {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(data.length, (index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailPage(data: data[index],)),
            );
          },
          child:
              _travelCard("${data[index]["title"]}", "${data[index]["photo"]}"),
        );
      }),
    );
  }

  Widget _travelCard(String title, String photo) {
    return Card(
      semanticContainer: true,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            '$photo',
            fit: BoxFit.cover,
          ),
          Positioned(
              left: 10,
              bottom: 10,
              child: Text(
                "$title",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black,
                        offset: Offset(5.0, 5.0),
                      ),
                    ]),
              ))
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      margin: EdgeInsets.all(10),
    );
  }
}
