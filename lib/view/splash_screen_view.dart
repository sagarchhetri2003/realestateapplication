import 'package:flutter/material.dart';
import 'package:realestateapplication/view/location_screen_view.dart';

class SplashScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Full-Screen Background
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/splashbg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Semi-transparent overlay
          Container(
            color: Colors.black.withOpacity(0.3),
          ),
          Column(
            children: [
              // Upper half with logo
              Expanded(
                flex: 6,
                child: Center(
                  child: Image.asset(
                    'assets/logo/splashlogo.png',
                    height: MediaQuery.of(context).size.height * 0.9,
                  ),
                ),
              ),
              // Lower half with second image and text/button content
              Expanded(
                flex: 5,
                child: Stack(
                  children: [
                    // Lower Background Image
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/splashbgcolor.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Text and Button Overlay
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // Button
                          ElevatedButton(
                            onPressed: () {
                              // Navigate to LocationScreenView
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LocationScreenView(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              padding: EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 15,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Text(
                              "Let's start",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          // Footer Text
                          Column(
                            children: [
                              Text(
                                'Made with love',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'v1.0',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 50),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
