import 'package:flutter/material.dart';
import 'package:plag/resources/api_calls.dart';
import 'reusable_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<int> _id = [];
  Map<int, GetTopStories> items = Map();

  void loadFeed() async {
    var id = await fTopStoriesList();
    setState(() {
      this._id = id;
      this.items = Map();
    });
  }

  Future<GetTopStories> content;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
        appBar: AppBar(
          title: Text("Yo Moma"),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, int index) {
              return FutureBuilder<GetTopStories>(
            future: gTopStories(_id[index]),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.title);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
      );
           } //subtitle: Check(_post).subText(),
                ),
              ));
          }

          @override
  void initState() {
    super.initState();
    loadFeed();
  }
  }


