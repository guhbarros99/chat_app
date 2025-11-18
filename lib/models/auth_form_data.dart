/*
Enum Representa um grupo fixo de valores possíveis. Neste caso, podendo ser login ou cadastro.

-Define dois "modos"
*/

import 'dart:io';

enum AuthMode { signup, login}

class AuthFormData {
  //criação dos atributos

String name = '';
String email = '';
String password = '';
File? image;
AuthMode _mode = AuthMode.login;

bool get isLogin{
  return _mode == AuthMode.login;
}

bool get isSignup{
  return _mode == AuthMode.signup;
}


void toggleAuthMode(){ // modo responsável para fazer a alternancia entre os módulos 
  _mode = isLogin ? AuthMode.signup : AuthMode.login;
}
}
