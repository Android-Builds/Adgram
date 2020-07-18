import 'package:flutter/material.dart';

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
