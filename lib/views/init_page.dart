import 'package:flutter_redux_bp/connector/auth_connector.dart';
import 'package:flutter_redux_bp/views/home/home_page.dart';
import 'package:flutter_redux_bp/views/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux_bp/views/loader/app_loader.dart';

class InitPage extends StatefulWidget {
  const InitPage({super.key});

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  @override
  Widget build(BuildContext context) {
    return AuthConnector(
      builder: (BuildContext context, AuthViewModel authViewModel) {
        if (authViewModel.isInitializing) {
          return const AppLoader();
        }
        return authViewModel.currentUser == null
            ? const LoginPage()
            : const HomePage();
      },
    );
  }
}
