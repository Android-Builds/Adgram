import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

String api = 'https://randomuser.me/api/';

Random random = Random();
int next(int min, int max) => min + random.nextInt(max - min);

class Account {
  String name;
  int posts;
  int messages;
  int likes;
  int followers;
  String image;

  Account({
    this.name,
    this.posts,
    this.messages,
    this.likes,
    this.followers,
    this.image,
  });

  // Map<String, dynamic> toJson() => {
  //       'cases': cases,
  //       'deaths': deaths,
  //       'active': active,
  //       'recovered': recovered,
  //     };

  factory Account.fromJson(var json) {
    return Account(
      name: json['name']['first'] + ' ' + json['name']['last'],
      posts: next(100, 1000),
      messages: next(50, 500),
      likes: next(10000, 50000),
      followers: next(50000, 10000000),
      image: json['picture']['medium'],
    );
  }
}

List<Account> accounts = List<Account>();

Future<List<Account>> getAccounts() async {
  for (int i = 0; i < random.nextInt(10); i++) {
    final response = await http.get(api);
    var responseJson = json.decode(response.body);
    responseJson = responseJson['results'][0];
    accounts.add(Account.fromJson(responseJson));
  }
  return accounts;
}
