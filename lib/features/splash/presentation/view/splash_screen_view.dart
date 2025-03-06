// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:food_hub/features/splash/presentation/view_model/cubit/splash_cubit.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();

//     context.read<SplashCubit>().init(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Get screen dimensions
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Stack(
//         children: [
//           // Center content
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset(
//                   'assets/images/logo.png', // Replace with actual logo path
//                   height: screenHeight * 0.5, // 50% of screen height
//                   width: screenWidth * 0.8, // 80% of screen width
//                 ),
//                 const SizedBox(height: 20),
//                 const CircularProgressIndicator(), // Loading indicator
//                 const SizedBox(height: 10),
//                 const Text('Version: 1.0.0'),
//               ],
//             ),
//           ),
//           // Footer
//           Positioned(
//             bottom: 10,
//             left: MediaQuery.of(context).size.width / 4,
//             child: const Text(
//               'Developed by: Nitu Uncle', // Replace with your name
//               style: TextStyle(fontSize: 10),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_hub/features/splash/presentation/view_model/cubit/splash_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<SplashCubit>().init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Full-Screen Background Image
          Positioned.fill(
            child: Image.asset('assets/images/splashbg.png', fit: BoxFit.cover),
          ),
          // Semi-transparent overlay to darken the background slightly
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.3)),
          ),
          Column(
            children: [
              // Upper half with logo
              Expanded(
                flex: 6,
                child: Center(
                  child: Image.asset(
                    'assets/images/splashlogo.png',
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                ),
              ),
              // Lower half with second image and text/button content
              Expanded(
                flex: 5,
                child: Stack(
                  children: [
                    // Lower Background Image positioned properly
                    // Positioned.fill(
                    //   child: Align(
                    //     alignment: Alignment.bottomCenter,
                    //     child: Image.asset(
                    //       // 'assets/images/splashbgcolor.png',
                    //       // fit: BoxFit.cover,
                    //       // height: MediaQuery.of(context).size.height * 0.5,
                    //     ),
                    //   ),
                    // ),
                    // Text and Button Overlay
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Removed Navigation logic
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  98,
                                  176,
                                  240,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 40,
                                  vertical: 15,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: const Text(
                                "Let's start",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            // Footer Text
                            const Column(
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
                          ],
                        ),
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
