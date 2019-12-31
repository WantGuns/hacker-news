 import 'dart:async';
 import 'package:flutter/material.dart';
 import 'package:http/http.dart' as http;
 import 'dart:convert';
 import 'package:json_annotation/json_annotation.dart';

 part 'api_calls.g.dart';

 Future<List<int>> fTopStoriesList() async {
  final response = 
      await http.get('https://hacker-news.firebaseio.com/v0/topstories.json');
        
  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    final parsed = (json.decode(response.body));
    final lTopStories = List<int>.from(parsed);
    return lTopStories;
  } else {  
    // If that call was not successful, throw an error.
    throw Exception('Failed to load Stories ids');
  }
}

Future<GetTopStories> gTopStories(int lTopStoriesId) async {
    var response = await http.get('https://hacker-news.firebaseio.com/v0/item/$lTopStoriesId.json');

    if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return GetTopStories.fromJson(json.decode(response.body));
      } else {  
        // If that call was not successful, throw an error.
        throw Exception('Failed to load Stories data');
      }
    }

@JsonSerializable(nullable: true)   
class GetTopStories {
  final int id;
  final bool deleted;
  final String type;
  final String by;
  final int time;
  final String text;
  final bool dead;
  final String parent;
  final int poll;
  final List<int> kids;
  final String url;
  final int score;
  final String title;
  final List<int> parts;
  final int descendants;

  
  GetTopStories({
    this.id,
    this.deleted,
    this.type,
    this.by,
    this.time,
    this.text,
    this.dead,
    this.parent,
    this.poll,
    this.kids,
    this.url,
    this.score,
    this.title,
    this.parts,
    this.descendants,
  });
    
    factory GetTopStories.fromJson(Map<String, dynamic> json) => _$GetTopStoriesFromJson(json);

    Map<String, dynamic> toJson() => _$GetTopStoriesToJson(this);
}


class Check {

  final Future<GetTopStories> lol;
  Check(this.lol);

  sampleText() {
    
  }

  // subText() {
  //   return FutureBuilder<Post>(
  //           future: lol,
  //           builder: (context, snapshot) {
  //             if (snapshot.hasData) {
  //               return Text(snapshot.data.id.toString());
  //             } else if (snapshot.hasError) {
  //               return Text("${snapshot.error}");
  //             }
  //             // By default, show a loading spinner.
  //             return CircularProgressIndicator();
  //           },
  //     );
  // }
}
