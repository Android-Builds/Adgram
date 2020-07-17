import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instaAd/models/login/bloc/login_bloc.dart';

class LoginWidget extends StatefulWidget {
  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(
        LoginButtonPressed(
          username: _usernameController.text,
          password: _passwordController.text,
        ),
      );
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('${state.error}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Adgram',
                  style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Username',
                      hintText: 'Enter your Username',
                      border: OutlineInputBorder(),
                    ),
                    controller: _usernameController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your Password',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscure ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            obscure = !obscure;
                          });
                        },
                      ),
                    ),
                    controller: _passwordController,
                    obscureText: obscure,
                  ),
                ),
                MaterialButton(
                  onPressed:
                      state is! LoginInProgress ? _onLoginButtonPressed : null,
                  child: Text('Login'),
                  color: Colors.blue,
                  textColor: Colors.white,
                  minWidth: 150.0,
                ),
                MaterialButton(
                  onPressed:
                      state is! LoginInProgress ? _onLoginButtonPressed : null,
                  child: Text('Sign Up'),
                  color: Colors.grey,
                  minWidth: 150.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Forgot Password ?',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
                Container(
                  child: state is LoginInProgress
                      ? CircularProgressIndicator()
                      : null,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
