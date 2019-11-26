import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PhotoJsonPage extends StatefulWidget {
  @override
  _PhotoJsonPageState createState() => _PhotoJsonPageState();
}

class _PhotoJsonPageState extends State<PhotoJsonPage> {

  String url="https://jsonplaceholder.typicode.com/photos";

  List<Map<String,dynamic>> list=[];

  getData()async{
    await http.get(url).then((response){

      List<dynamic> list1=json.decode(response.body);
      List<Map<String,dynamic>> list2=[];

      list1.forEach((listData){

        Map<String,dynamic> map={
          "t":listData['title'],
          "u":listData['url']
        };

        list2.add(map);

      });

      setState(() {
        list=list2;
      });

    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Photos"),
      ),
      body: list.length==0?Center(
        child: CircularProgressIndicator(),
      ):ListView(
        children: list.map((listData){
          return Card(
            child: Column(
              children: <Widget>[
                Image.network(listData['u']),
                Text(listData['t'])
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
