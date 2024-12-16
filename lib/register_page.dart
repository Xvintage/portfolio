import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/components/mybutton.dart';
import 'package:portfolio/components/mytextfields.dart';
import 'package:portfolio/components/square_tile.dart';
import 'package:portfolio/services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Sign up method
  void signUserUp() async {
    // Show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // Try creating the user
    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
      } else {
        Navigator.pop(context);
        showErrorMessage("Passwords don't match!");
      }

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showErrorMessage(e.code);
    }
  }

  // Show error message
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey[300],
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              // Header text
              const Text(
                "Iynah's Portfolio",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // Subtitle
              const Text(
                "Create an account",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Let's get started by filling out the form below.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),

              const SizedBox(height: 30),

              // Email TextField
              MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),
              const SizedBox(height: 20),

              // Password TextField
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 20),

              // Confirm Password TextField
              MyTextField(
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
                obscureText: true,
              ),
              const SizedBox(height: 30),

              // Create Account Button
              Mybutton(
                text: "Create Account",
                onTap: signUserUp,
              ),

              const SizedBox(height: 20),

              // OR Divider
              const Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "OR",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Google Sign-In Button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTile(
                    onTap: () => AuthService().signInWithGoogle(),
                    imagePath: 'assets/google-logo.png',
                  ),
                ],
              ),

              const SizedBox(height: 50),

              // Login redirect
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Login now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
