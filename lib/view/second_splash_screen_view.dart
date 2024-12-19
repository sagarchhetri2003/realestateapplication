import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'login_screen_view.dart'; // Ensure this file exists
import 'register_screen_view.dart'; // Ensure this file exists

class SecondSplashScreenView extends StatelessWidget {
  const SecondSplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              // Adjust space for Back and Skip buttons
              const SizedBox(height: 80),
              // Image Grid Section
              Expanded(
                flex: 5,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: [
                      Image.asset('assets/images/house1.png',
                          fit: BoxFit.cover),
                      Image.asset('assets/images/house2.png',
                          fit: BoxFit.cover),
                      Image.asset('assets/images/house3.png',
                          fit: BoxFit.cover),
                      Image.asset('assets/images/house4.png',
                          fit: BoxFit.cover),
                    ],
                  ),
                ),
              ),
              // Text and Buttons Section
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'Ready to explore?',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                              255, 98, 176, 240), // Light green color
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          // Navigate to Login Page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreenView(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.email, color: Colors.white),
                        label: const Text(
                          'Continue with Email',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Google Icon Button
                          IconButton(
                            onPressed: () {
                              // Add Google login functionality
                            },
                            icon: const FaIcon(
                              FontAwesomeIcons.google,
                              color: Colors.red,
                              size: 30,
                            ),
                            tooltip: 'Login with Google',
                          ),
                          // Facebook Icon Button
                          IconButton(
                            onPressed: () {
                              // Add Facebook login functionality
                            },
                            icon: const FaIcon(
                              FontAwesomeIcons.facebook,
                              color: Colors.blue,
                              size: 30,
                            ),
                            tooltip: 'Login with Facebook',
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigate to Register Page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterScreenView(),
                            ),
                          );
                        },
                        child: const Text(
                          "Don't have an account? Register",
                          style: TextStyle(
                            color: Color.fromARGB(255, 98, 176, 240),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Back Button (Top Left)
          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, size: 28),
              onPressed: () {
                // Navigate back to the previous screen
                Navigator.pop(context);
              },
            ),
          ),
          // Skip Button (Top Right)
          Positioned(
            top: 40,
            right: 20,
            child: TextButton(
              onPressed: () {
                // Navigate directly to Login Page (or another screen)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreenView()),
                );
              },
              child: const Text(
                'Skip',
                style: TextStyle(
                  color: Color.fromARGB(255, 98, 176, 240),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
