import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/components/mybutton.dart';
import 'package:portfolio/components/mytextfields.dart';
import 'package:portfolio/components/square_tile.dart';
import 'package:portfolio/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Sign user in method
  void signUserIn() async {
    // Show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // Try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      // Pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // Pop the loading circle
      Navigator.pop(context);
      // Show error message
      showErrorMessage(e.code);
    }
  }

  // Wrong email message popup
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color.fromRGBO(233, 229, 173, 1),
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color.fromRGBO(233, 229, 173, 1), // Light grey background color
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Circular profile imaged
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('assets/profile.png'),
                  ),
                  const SizedBox(height: 35),
                  // Welcome Back Text
                  const Text(
                    "Welcome Back!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4a4a4a), // Dark grey text color
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Sign in to continue",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(
                          233, 229, 173, 1), // Medium grey text color
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Email TextField
                  MyTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false,
                  ),
                  const SizedBox(height: 16),
                  // Password TextField
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 24),
                  // Forgot Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Mybutton(
                    text: "Sign In",
                    onTap: signUserIn,
                  ),
                  const SizedBox(height: 32),
                  const Divider(
                    thickness: 1,
                    height: 20,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () => AuthService().signInWithGoogle(),
                    icon: const Icon(Icons.g_mobiledata, color: Colors.black),
                    label: const Text(
                      "Sign in with Google",
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: const BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                          color: Color(0xFF7f7f7f),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
