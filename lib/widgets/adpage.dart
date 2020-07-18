import 'dart:math';
import 'package:flutter/material.dart';
import 'package:instaAd/utils/variables.dart';

import 'cardwidgets.dart';

class AdList extends StatefulWidget {
  @override
  _AdListState createState() => _AdListState();
}

Random random = Random();

class _AdListState extends State<AdList> {
  showAddDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text('Post new Ad'),
          contentPadding: EdgeInsets.all(20.0),
          children: [
            AdWidget(
              text: 'ID: ',
            ),
            AdWidget(
              text: 'Message: ',
            ),
            AdWidget(
              text: 'Total Bid: ',
            ),
            AdWidget(
              text: 'Average Bid: ',
            ),
            SizedBox(height: 10.0),
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Add'),
            )
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adgram'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => showAddDialog(),
          )
        ],
      ),
      body: FutureBuilder(
        future: adaccounts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5.0,
                  margin: EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: [
                      DetailWidget(
                        url: snapshot.data[index].image,
                        name: snapshot.data[index].name,
                        likes: snapshot.data[index].likes.toString(),
                        followers: snapshot.data[index].followers.toString(),
                        posts: snapshot.data[index].posts.toString(),
                        messages: snapshot.data[index].messages.toString(),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Column(
                          children: [
                            Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.'),
                            SizedBox(height: 10.0),
                            Row(
                              children: [
                                AdCardWidget(
                                  text: 'Total Bid:',
                                  count: 50,
                                ),
                                Spacer(),
                                AdCardWidget(
                                  text: 'Average Bid:',
                                  count: 3000,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
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
      ),
    );
  }
}

class AdWidget extends StatelessWidget {
  const AdWidget({
    Key key,
    @required this.text,
  }) : super(key: key);

  final text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text),
        Spacer(),
        SizedBox(
          width: 100.0,
          child: TextFormField(),
        ),
      ],
    );
  }
}

class AdCardWidget extends StatelessWidget {
  const AdCardWidget({
    Key key,
    @required this.text,
    @required this.count,
  }) : super(key: key);

  final text;
  final count;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          random.nextInt(count).toString(),
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
