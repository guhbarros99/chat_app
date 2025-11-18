import 'package:chat_app/models/auth_form_data.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final _formData = AuthFormData();

  void _submit() {
    // Se retornar true, significa que tudo foi validado corretamente
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) return;

    // Salva os valores dos campos
    _formKey.currentState?.save();

    // Aqui você pode seguir para o login/cadastro
    print("Form válido!");
    print("Nome: ${_formData.name}");
    print("Email: ${_formData.email}");
    print("Senha: ${_formData.password}");
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              if (_formData.isSignup)
                TextFormField(
                  key: const ValueKey('name'),
                  initialValue: _formData.name,
                  onSaved: (name) => _formData.name = name ?? '',
                  validator: (value) {
                    if (_formData.isSignup && (value == null || value.trim().length < 5)) {
                      return 'O nome deve ter pelo menos 5 caracteres.';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(labelText: 'Nome'),
                ),

              TextFormField(
                key: const ValueKey('email'),
                initialValue: _formData.email,
                onSaved: (email) => _formData.email = email ?? '',
                validator: (value) {
                  if (value == null || value.trim().isEmpty || !value.contains('@')) {
                    return 'Informe um e-mail válido.';
                  }
                  return null;
                },
                decoration: const InputDecoration(labelText: 'E-mail'),
              ),

              TextFormField(
                key: const ValueKey('password'),
                initialValue: _formData.password,
                onSaved: (password) => _formData.password = password ?? '',
                validator: (value) {
                  if (value == null || value.trim().length < 8) {
                    return 'A senha deve ter no mínimo 8 caracteres.';
                  }
                  return null;
                },
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Senha'),
              ),

              const SizedBox(height: 12),

              ElevatedButton(
                onPressed: _submit,
                child: Text(_formData.isLogin ? 'Entrar' : 'Cadastrar'),
              ),

              TextButton(
                onPressed: () {
                  setState(() {
                    _formData.toggleAuthMode();
                  });
                },
                child: Text(
                  _formData.isLogin
                      ? 'Criar uma nova conta?'
                      : 'Já possui conta?',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
