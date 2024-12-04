import 'package:flutter/material.dart';
import 'package:flutter_app_1/home/home.dart';
import 'package:flutter_app_1/user/User.dart';

void main() => runApp(const MaterialApp(home: LoginPage()));

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleLogin() {
    final email = _emailController.text;
    final password = _passwordController.text;
    var isUserAuthenticated = false;
    if (email == "deepak" && password == "2003") {
      isUserAuthenticated = true;
    }
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Login Details"),
        content: isUserAuthenticated
            ? const Text("Login Successful")
            : const Text("Incorrect credentials"),
        actions: [
          TextButton(
            onPressed: () => isUserAuthenticated
                ? _navigateToDashboard(context)
                : Navigator.pop(context),
            child: const Text("Continue"),
          )
        ],
      ),
    );
  }

  void _navigateToDashboard(BuildContext context) {
    Navigator.pop(context);
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            Dashboard(user: User(_emailController.text, "admin"))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "My Login Page",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Sign in to your application"),
            const SizedBox(height: 30),
            CustomTextField(
              title: "Email",
              controller: _emailController,
            ),
            const SizedBox(height: 30),
            CustomTextField(
              title: "Password",
              controller: _passwordController,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _handleLogin,
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.title,
    required this.controller,
  });

  final String title;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: TextField(
        controller: controller,
        obscureText: title == "Email" ? false : true,
        decoration: InputDecoration(
            border: const OutlineInputBorder(), labelText: title),
      ),
    );
  }
}
