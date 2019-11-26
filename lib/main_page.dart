import 'package:flutter/material.dart';
import 'package:flutter_app/photo_json_page.dart';

import 'dota_hero_json_parsing.dart';
import 'post_json_page.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main"),
      ),
      body: ListView(
        children: <Widget>[
          RaisedButton(
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context){
                  return PostJsonPage();
                }
              ));
            },
            child: Text("Post Json Parsing"),
          ),
            RaisedButton(
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context){
                  return PhotoJsonPage();
                }
              ));
            },
            child: Text("Photo Json Parsing"),
          ),
          RaisedButton(
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context){
                  return DotaHeroJsonParsing();
                }
              ));
            },
            child: Text("Dota Hero Json Parsing"),
          ),


        ],
      ),
    );
  }
}
