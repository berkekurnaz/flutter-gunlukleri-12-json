import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {

  dynamic data;

  DetailPage({this.data});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _createBody(
          "${widget.data["photo"]}",
          "${widget.data["title"]}",
          "${widget.data["content"]}",
          "${widget.data["date"]}"),
    );
  }

  Widget _createBody(
      String photo, String title, String description, String date) {
    return Column(
      children: [
        Image.network(
          '$photo',
          fit: BoxFit.cover,
        ),
        SizedBox(height: 20,),
        Text("$title",textAlign: TextAlign.center ,style: TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),),
        SizedBox(height: 10,),
        Text("Eklenme Tarihi : $date", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400),),
        SizedBox(height: 20,),
        Padding(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), child: Text("$description", style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w400),),),
        SizedBox(height: 20,),
        Text("Yorumlar",textAlign: TextAlign.center, style: TextStyle(fontSize: 25),),
        SizedBox(height: 20,),
        _showComments(),
      ],
    );
  }

  Widget _showComments(){
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (context, index) {
         return Text("${widget.data["comments"][index]["comment"]}", textAlign: TextAlign.center,);
      },
    );
  }
  
}
