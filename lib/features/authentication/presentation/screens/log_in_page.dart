import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          InkWell(
            onTap: () {},
            child: const Text('log in'),
          ),
          ElevatedButton(
            onPressed: () {
              context.push('/sign_up');
            },
            child: Text('sign up'),
          ),
          ElevatedButton(
            onPressed: () {
              context.push('/recover_password');
            },
            child: Text('recover password'),
          ),
        ],
      ),
    );
  }
}
