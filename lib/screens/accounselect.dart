import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instaAd/models/authentication/bloc/authentication_bloc.dart';

class SelectAccount extends StatefulWidget {
  @override
  _SelectAccountState createState() => _SelectAccountState();
}

class _SelectAccountState extends State<SelectAccount> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (BuildContext context, state) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Adgram',
                  style: TextStyle(fontSize: 40.0),
                ),
                SizedBox(height: 100.0),
                MaterialButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  minWidth: 130.0,
                  child: Text('Influencer'),
                  onPressed: () {},
                ),
                SizedBox(height: 20.0),
                MaterialButton(
                  color: Colors.green,
                  textColor: Colors.white,
                  minWidth: 130.0,
                  child: Text('Advertiser'),
                  onPressed: () {
                    BlocProvider.of<AuthenticationBloc>(context)
                        .add(AuthenticationStarted());
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
