// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:realestateapplication/features/home/presentation/view/register_screen_view.dart';

// import 'dashboard_screen_view.dart';

// class LoginScreenView extends StatelessWidget {
//   // Static admin credentials
//   final String adminEmail = 'admin';
//   final String adminPassword = 'admin';

//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   // Validate login credentials
//   void _validateLogin(BuildContext context) {
//     final email = emailController.text.trim();
//     final password = passwordController.text.trim();

//     if (email == adminEmail && password == adminPassword) {
//       // Navigate to DashboardScreenView
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => DashboardScreenView()),
//       );
//     } else {
//       // Show error message
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Invalid email or password')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           // Image that covers 30% of the screen
//           Container(
//             height: MediaQuery.of(context).size.height * 0.3,
//             width: double.infinity,
//             child: Image.asset(
//               'assets/logo/login_logo.png',
//               fit: BoxFit.fitWidth,
//               alignment: Alignment.topCenter,
//             ),
//           ),

//           // Main content section
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 24),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   // Let's Sign In Text
//                   Text(
//                     "Let's Sign In",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 20),

//                   // Email Input
//                   TextField(
//                     controller: emailController,
//                     decoration: InputDecoration(
//                       labelText: 'Email',
//                       prefixIcon: Icon(Icons.email),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 12),

//                   // Password Input
//                   TextField(
//                     controller: passwordController,
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       labelText: 'Password',
//                       prefixIcon: Icon(Icons.lock),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 12),

//                   // Forgot Password and Show Button Row
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       TextButton(
//                         onPressed: () {},
//                         child: Text(
//                           'Forgot password?',
//                           style: TextStyle(color: Colors.blue),
//                         ),
//                       ),
//                       TextButton(
//                         onPressed: () {},
//                         child: Text(
//                           'Show',
//                           style: TextStyle(color: Colors.blue),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 12),

//                   // Sign In Button
//                   ElevatedButton(
//                     onPressed: () => _validateLogin(context),
//                     child: Text('Sign In'),
//                     style: ElevatedButton.styleFrom(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),

//                   SizedBox(height: 16),

//                   // Divider with OR text
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Divider(thickness: 1, color: Colors.grey),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 8),
//                         child: Text(
//                           'OR',
//                           style: TextStyle(color: Colors.grey),
//                         ),
//                       ),
//                       Expanded(
//                         child: Divider(thickness: 1, color: Colors.grey),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 12),

//                   // Facebook and Google Buttons
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: ElevatedButton.icon(
//                           onPressed: () {},
//                           icon: FaIcon(FontAwesomeIcons.facebook,
//                               color: Colors.white),
//                           label: Text('Facebook'),
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.blue,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 12),
//                       Expanded(
//                         child: ElevatedButton.icon(
//                           onPressed: () {},
//                           icon: FaIcon(FontAwesomeIcons.google,
//                               color: Colors.white),
//                           label: Text('Google'),
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.red,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),

//                   Spacer(),

//                   // Don't have an account? Register
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 20),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text('Don\'t have an account? '),
//                         GestureDetector(
//                           onTap: () {
//                             // Navigate to RegisterScreenView
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => RegisterScreenView()),
//                             );
//                           },
//                           child: Text(
//                             'Register',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
