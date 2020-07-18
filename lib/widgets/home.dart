import 'package:flutter/material.dart';
import 'package:instaAd/models/peopledata.dart';
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
    // acc = getAccounts();
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

class DetailWidget extends StatelessWidget {
  const DetailWidget({
    Key key,
    @required this.likes,
    @required this.followers,
    @required this.messages,
    @required this.posts,
    @required this.url,
    @required this.name,
  }) : super(key: key);

  final String likes;
  final String followers;
  final String messages;
  final String posts;
  final String url;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(url),
              ),
              SizedBox(
                height: 20,
              ),
              Text(name),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CardInfo(
                icon: Icons.photo_library,
                text: posts,
              ),
              SizedBox(height: 10.0),
              CardInfo(
                icon: Icons.message,
                text: messages,
              ),
            ],
          ),
          SizedBox(width: 50.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CardInfo(
                icon: Icons.account_circle,
                text: followers,
              ),
              SizedBox(height: 10.0),
              CardInfo(
                icon: Icons.favorite,
                text: likes,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CardInfo extends StatelessWidget {
  const CardInfo({
    Key key,
    @required this.icon,
    @required this.text,
  }) : super(key: key);

  final icon;
  final text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 10.0),
        Text(text),
      ],
    );
  }
}
