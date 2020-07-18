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
    acc = allaccounts;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAccounts(),
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
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage:
                                NetworkImage(snapshot.data[index].image),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(snapshot.data[index].name),
                        ],
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CardInfo(
                            icon: Icons.photo_library,
                            text: snapshot.data[index].posts.toString(),
                          ),
                          SizedBox(height: 10.0),
                          CardInfo(
                            icon: Icons.message,
                            text: snapshot.data[index].messages.toString(),
                          ),
                        ],
                      ),
                      SizedBox(width: 50.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CardInfo(
                            icon: Icons.account_circle,
                            text: snapshot.data[index].followers.toString(),
                          ),
                          SizedBox(height: 10.0),
                          CardInfo(
                            icon: Icons.favorite,
                            text: snapshot.data[index].likes.toString(),
                          ),
                        ],
                      ),
                    ],
                  ),
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
        Text(text),
      ],
    );
  }
}
