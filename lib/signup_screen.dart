import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              const Text(
                "Hi!",
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
              const Text(
                "Welcome",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text(
                "lets create your account",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 30),

              const TextField(
                decoration: InputDecoration(
                  labelText: "Email Address",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              const TextField(
                decoration: InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.visibility),
                ),
              ),
              const SizedBox(height: 16),

              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Confirm Password",
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.visibility),
                ),
              ),
              const SizedBox(height: 10),

              const Text(
                "Password must be at least 8 characters.",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const Spacer(),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                      ); // Assuming LoginScreen is the previous screen
                    },
                    child: const Text("Login"),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
