import 'package:flutter/material.dart';
import 'package:realestateapplication/view/login_screen_view.dart';
import 'package:realestateapplication/view/second_splash_screen_view.dart';

class FirstSplashScreenView extends StatelessWidget {
  const FirstSplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(),
              Column(
                children: [
                  Image.asset(
                    'assets/icons/splash1icon.png',
                    width: 60, // Set the desired width
                    height: 60, // Set the desired height
                    // Optional: Applies color overlay
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Find best place\nto stay in good price',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit, sed.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(20), // Leaves space on all sides
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/firstsplashscreen.png',
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height * 0.6,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 98, 176, 240),
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    // Navigate to the second screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SecondSplashScreenView()),
                    );
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white, // Set the text color to white
                    ),
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
                // Navigate directly to the second screen
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
