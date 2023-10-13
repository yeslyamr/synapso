import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:synapso/core/navigation/go_router.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: InkWell(
          onTap: () {
            isSignedIn = true;
            context.go('/');
          },
          child: const Text('log in'),
        ),
      ),
    );
  }
}
