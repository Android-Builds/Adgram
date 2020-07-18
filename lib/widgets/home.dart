import 'package:flutter/material.dart';
import 'package:instaAd/utils/variables.dart';

import 'cardwidgets.dart';

class HomeList extends StatefulWidget {
  @override
  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: allaccounts,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.all(10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: DetailWidget(
                  url: snapshot.data[index].image,
                  name: snapshot.data[index].name,
                  likes: snapshot.data[index].likes.toString(),
                  followers: snapshot.data[index].followers.toString(),
                  posts: snapshot.data[index].posts.toString(),
                  messages: snapshot.data[index].messages.toString(),
                ),
              );
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
