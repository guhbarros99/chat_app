import 'package:chat_app/components/auth_form.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isLoading
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: const Center(
        child: SingleChildScrollView( // para que seja visível em qualquer dispositivo.
          child: AuthForm(),
        ),
      ),
    );
  }
}
