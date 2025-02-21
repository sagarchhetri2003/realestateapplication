// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:realestateapplication/features/auth/presentation/view/login_page.dart';

// import '../view_model/splash_cubit.dart';

// class SplashScreenView extends StatefulWidget
//   const SplashScreenView({super.key});

//   @override
//   State<SplashScreenView> createState() => _SplashScreenState();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Full-Screen Background
//           Container(
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/images/splashbg.png'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           // Semi-transparent overlay
//           Container(
//             color: Colors.black.withOpacity(0.3),
//           ),
//           Column(
//             children: [
//               // Upper half with logo
//               Expanded(
//                 flex: 6,
//                 child: Center(
//                   child: Image.asset(
//                     'assets/logo/splashlogo.png',
//                     height: MediaQuery.of(context).size.height * 0.9,
//                   ),
//                 ),
//               ),
//               // Lower half with second image and text/button content
//               Expanded(
//                 flex: 5,
//                 child: Stack(
//                   children: [
//                     // Lower Background Image
//                     Container(
//                       decoration: const BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage('assets/images/splashbgcolor.png'),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     // Text and Button Overlay
//                     Center(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           // Button
//                           ElevatedButton(
//                             onPressed: () {
//                               // Navigate to LocationScreenView
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => LoginScreenView(),
//                                 ),
//                               );
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor:
//                                   const Color.fromARGB(255, 98, 176, 240),
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 40,
//                                 vertical: 15,
//                               ),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(30),
//                               ),
//                             ),
//                             child: const Text(
//                               "Let's start",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 18,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           // Footer Text
//                           const Column(
//                             children: [
//                               Text(
//                                 'Made with love',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 14,
//                                 ),
//                               ),
//                               SizedBox(height: 5),
//                               Text(
//                                 'v1.0',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 14,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 50),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// // class _SplashScreenState extends State<SplashScreenView> {
// //   @override
// //   void initState() {
// //     super.initState();
// //     context.read<SplashCubit>().init(context); // Initialize navigation logic
// //   }
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Stack(
// //         children: [
// //           // Full-Screen Background
// //           Container(
// //             decoration: const BoxDecoration(
// //               image: DecorationImage(
// //                 image: AssetImage('assets/images/splashbg.png'),
// //                 fit: BoxFit.cover,
// //               ),
// //             ),
// //           ),
// //           // Semi-transparent overlay
// //           Container(
// //             color: Colors.black.withOpacity(0.3),
// //           ),
// //           Column(
// //             children: [
// //               // Upper half with logo
// //               Expanded(
// //                 flex: 6,
// //                 child: Center(
// //                   child: Image.asset(
// //                     'assets/logo/splashlogo.png',
// //                     height: MediaQuery.of(context).size.height * 0.9,
// //                   ),
// //                 ),
// //               ),
// //               // Lower half with second image and text/button content
// //               Expanded(
// //                 flex: 5,
// //                 child: Stack(
// //                   children: [
// //                     // Lower Background Image
// //                     Container(
// //                       decoration: const BoxDecoration(
// //                         image: DecorationImage(
// //                           image: AssetImage('assets/images/splashbgcolor.png'),
// //                           fit: BoxFit.cover,
// //                         ),
// //                       ),
// //                     ),
// //                     // Text and Button Overlay
// //                     Center(
// //                       child: Column(
// //                         mainAxisAlignment: MainAxisAlignment.end,
// //                         children: [
// //                           // Button
// //                           ElevatedButton(
// //                             onPressed: () {
// //                               // Navigate to LocationScreenView
// //                               Navigator.push(
// //                                 context,
// //                                 MaterialPageRoute(
// //                                   builder: (context) => LoginScreenView(),
// //                                 ),
// //                               );
// //                             },
// //                             style: ElevatedButton.styleFrom(
// //                               backgroundColor:
// //                                   const Color.fromARGB(255, 98, 176, 240),
// //                               padding: const EdgeInsets.symmetric(
// //                                 horizontal: 40,
// //                                 vertical: 15,
// //                               ),
// //                               shape: RoundedRectangleBorder(
// //                                 borderRadius: BorderRadius.circular(30),
// //                               ),
// //                             ),
// //                             child: const Text(
// //                               "Let's start",
// //                               style: TextStyle(
// //                                 color: Colors.white,
// //                                 fontSize: 18,
// //                               ),
// //                             ),
// //                           ),
// //                           const SizedBox(height: 10),
// //                           // Footer Text
// //                           const Column(
// //                             children: [
// //                               Text(
// //                                 'Made with love',
// //                                 style: TextStyle(
// //                                   color: Colors.white,
// //                                   fontSize: 14,
// //                                 ),
// //                               ),
// //                               SizedBox(height: 5),
// //                               Text(
// //                                 'v1.0',
// //                                 style: TextStyle(
// //                                   color: Colors.white,
// //                                   fontSize: 14,
// //                                 ),
// //                               ),
// //                             ],
// //                           ),
// //                           const SizedBox(height: 50),
// //                         ],
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

import 'package:flutter/material.dart';
import 'package:realestateapplication/features/auth/presentation/view/login_page.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();
    // Assuming you need to initialize some logic related to the SplashCubit here
    // context.read<SplashCubit>().init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Full-Screen Background
          Container(
            decoration: const BoxDecoration(
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
                      decoration: const BoxDecoration(
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
                              // Navigate to LoginScreenView
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreenView(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 98, 176, 240),
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
                          const SizedBox(height: 50),
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
