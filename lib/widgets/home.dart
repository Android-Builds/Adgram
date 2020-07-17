import 'package:flutter/material.dart';
import 'package:instaAd/utils/variables.dart';

class HomeList extends StatefulWidget {
  @override
  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  var acc;

  @override
  void initState() {
    super.initState();
    allaccounts = acc;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: acc,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: allaccounts.length,
            itemBuilder: (context, index) {
              return Text(allaccounts[index].name);
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
    // return ListView.builder(
    //   itemCount: allaccounts.length,
    //   itemBuilder: (context, index) {
    //     return Text(allaccounts[index].name);
    //   },
    // );
  }
}
