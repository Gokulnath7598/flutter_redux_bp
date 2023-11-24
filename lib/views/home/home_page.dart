import 'package:flutter/material.dart';
import 'package:flutter_redux_bp/connector/auth_connector.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthConnector(
      builder: (BuildContext context, AuthViewModel authModel) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Welcome ${authModel.currentUser?.firstName ?? ''}'),
          ),
          body: Center(
            child: Column(
              children: [
                const Spacer(),
                authModel.isLoading
                    ? const Text('Logging out...')
                    : ElevatedButton(
                        onPressed: () {
                          authModel.logOut();
                        },
                        child: const Text('Logout')),
                const Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }
}
