import 'package:flutter/material.dart';
import 'package:flutter_redux_bp/connector/auth_connector.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return AuthConnector(
        builder: (BuildContext context, AuthViewModel authViewModel) {
      return Scaffold(
          body: Stack(children: [
        SafeArea(
            child: Column(children: [
          Expanded(
              child: Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Center(
                    child: authViewModel.isLoading
                        ? const Text('Logging in...')
                        : ElevatedButton(
                            onPressed: () {
                              authViewModel.loginWithPassword(
                                  '7598573658', 'Password@123');
                            },
                            child: const Text('Login')),
                  ))),
        ])),
        // globalLoader(authViewModel.isLoading)
      ]));
    });
  }
}
