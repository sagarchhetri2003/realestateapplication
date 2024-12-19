import 'package:flutter/material.dart';
import 'package:realestateapplication/view/first_splash_screen_view.dart';
import 'package:realestateapplication/view/login_screen_view.dart';

class LocationScreenView extends StatelessWidget {
  const LocationScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 100), // Space for back and skip buttons
                const Text(
                  "Add your location",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "You can edit this later on your account setting.",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                const SizedBox(height: 16),
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/location.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Location detail",
                    prefixIcon:
                        const Icon(Icons.location_on, color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                  onChanged: (value) {
                    // Handle the location input change if needed
                  },
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 32.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: const Color.fromARGB(255, 98, 176, 240),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      // Navigate to FirstSplashScreenView when "Next" is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FirstSplashScreenView(),
                        ),
                      );
                    },
                    child: const Text(
                      "Next",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Back Button (Top Left)
          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, size: 28),
              onPressed: () {
                Navigator.pop(context); // Navigate back to the previous screen
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                    const Color.fromARGB(255, 240, 240, 240)), // Grey circle
                shape: WidgetStateProperty.all(const CircleBorder()),
              ),
            ),
          ),
          // Skip Button (Top Right)
          Positioned(
            top: 40,
            right: 20,
            child: TextButton(
              onPressed: () {
                // Navigate to LoginScreenView when "Skip" is pressed
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
