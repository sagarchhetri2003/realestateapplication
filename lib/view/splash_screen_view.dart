// import 'package:flutter/material.dart';

// class SplashScreenView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Background Image
//           Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage(
//                     'assets/images/splashbg.png'), // Add your background image here
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           // Semi-transparent overlay
//           Container(
//             color: Colors.black
//                 .withOpacity(0.3), // Adjust the opacity for the overlay effect
//           ),
//           // Content
//           Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               // Upper half with logo
//               Expanded(
//                 flex: 10, // Upper half (10% height)
//                 child: Center(
//                   child: Image.asset(
//                     'assets/logo/splashlogo.png', // Add your logo image here
//                     height: MediaQuery.of(context).size.height *
//                         10, // 10% of screen height
//                   ),
//                 ),
//               ),
//               SizedBox(height: 30), // Space between logo and text

//               // Button and text section
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // Button
//                   ElevatedButton(
//                     onPressed: () {
//                       // Navigate to the next screen
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blue, // Button color
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                     ),
//                     child: Text(
//                       "Let's start",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 30), // Space between button and footer
//                   // Footer Text
//                   Column(
//                     children: [
//                       Text(
//                         'Made with love',
//                         style: TextStyle(color: Colors.white, fontSize: 14),
//                       ),
//                       SizedBox(height: 5),
//                       Text(
//                         'v1.0',
//                         style: TextStyle(color: Colors.white, fontSize: 14),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               Spacer(flex: 1), // Pushes footer content upwards
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

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
                image: AssetImage(
                    'assets/images/splashbg.png'), // Background image
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Semi-transparent overlay
          Container(
            color: Colors.black.withOpacity(0.3), // Adjust overlay opacity
          ),
          Column(
            children: [
              // Upper half with logo
              Expanded(
                flex: 6, // 50% of the screen
                child: Center(
                  child: Image.asset(
                    'assets/logo/splashlogo.png', // Logo image
                    height:
                        MediaQuery.of(context).size.height * 0.9, // 30% height
                  ),
                ),
              ),
              // Lower half with second image and text/button content
              Expanded(
                flex: 5, // 50% of the screen
                child: Stack(
                  children: [
                    // Lower Background Image
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/splashbgcolor.png'), // Second image for lower half
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
                              // Navigate to the next screen
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue, // Button color
                              padding: EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 15),
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
                          SizedBox(
                              height: 10), // Space between button and footer
                          // Footer Text
                          Column(
                            children: [
                              Text(
                                'Made with love',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'v1.0',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
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
