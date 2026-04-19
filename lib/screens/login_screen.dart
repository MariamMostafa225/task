import 'package:flutter/material.dart';
import 'package:task/screens/home_screen.dart';
import '../widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isObscure = true;

  bool isValidEmail(String email) {
    return RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email);
  }

  void showMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(height: 60),

              const CircleAvatar(
                radius: 70,
                backgroundColor: Colors.black,
                child: Icon(Icons.person, size: 100, color: Colors.white),
              ),

              const SizedBox(height: 50),

              CustomTextField(
                hint: "Email",
                controller: emailController,
              ),

              const SizedBox(height: 20),

              CustomTextField(
                hint: "Password",
                controller: passwordController,
                isPassword: true,
                obscureText: isObscure,
                onSuffixTap: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
              ),

              const SizedBox(height: 40),

              SizedBox(
                width: 160,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    String email = emailController.text.trim();
                    String password = passwordController.text.trim();

                    if (email.isEmpty) {
                      showMessage("Email cannot be empty");
                      return;
                    }

                    if (!isValidEmail(email)) {
                      showMessage("Enter a valid email");
                      return;
                    }

                    if (password.isEmpty) {
                      showMessage("Password cannot be empty");
                      return;
                    }

                    if (password.length < 6) {
                      showMessage("Password must be at least 6 characters");
                      return;
                    }

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4FC3F7),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    "Log In",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              TextButton(
                onPressed: () {},
                child: const Text(
                  "Forgot password?",
                  style: TextStyle(
                    color: Color(0xFF616161),
                    fontSize: 16,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              TextButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => HomeScreen()),
                  // );
                },
                child: const Text(
                  "Not a member? Sign up now",
                  style: TextStyle(
                    color: Color(0xFF616161),
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}