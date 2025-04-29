import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(ForgotPasswordApp());
}

class ForgotPasswordApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ForgotPasswordScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ForgotPasswordScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Text(
                "Oh , NO !",
                style: GoogleFonts.inknutAntiqua(
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "I forgot",
                style: GoogleFonts.inknutAntiqua(
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Enter your email address to reset your password.",
                style: TextStyle(color: Colors.grey[600]),
              ),
              SizedBox(height: 80),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Email Address',
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // TODO: handle password reset
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "Forgot password",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 16),
              Text(
                "A password reset link will be sent to your email.",
                style: TextStyle(fontSize: 12, color: Colors.grey[700]),
              ),
              Spacer(),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    ); // TODO: Navigate back to login screen
                  },
                  child: Text.rich(
                    TextSpan(
                      text: "Back to ",
                      style: TextStyle(color: Colors.grey[700]),
                      children: [
                        TextSpan(
                          text: "Login",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
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
