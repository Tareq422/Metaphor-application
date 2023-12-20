import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isRegistering = false;
  String? _errorMessage;

  final _storage = FlutterSecureStorage();

  Future<void> _handleLogin() async {
    final storedUsername = await _storage.read(key: 'username');
    final storedPassword = await _storage.read(key: 'password');

    if (_usernameController.text == storedUsername &&
        _passwordController.text == storedPassword) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      setState(() => _errorMessage = "Invalid username or password");
    }
  }

  Future<void> _handleRegister() async {
    if (_usernameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      await _storage.write(key: 'username', value: _usernameController.text);
      await _storage.write(key: 'password', value: _passwordController.text);
      Navigator.pushReplacementNamed(context, '/login');
    } else {
      setState(() => _errorMessage = "Please enter username and password");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_isRegistering ? 'Register' : 'Log In')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _isRegistering ? _handleRegister : _handleLogin,
              child: Text(_isRegistering ? 'Register' : 'Log In'),
            ),
            if (_errorMessage != null)
              Text(
                _errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            const SizedBox(height: 16.0),
            Text('New User?'),
            TextButton(
              onPressed: () {
                setState(() => _isRegistering = !_isRegistering);
              },
              child: Text(_isRegistering ? 'Log In' : 'Register'),
            ),
          ],
        ),
      ),
    );
  }
}
