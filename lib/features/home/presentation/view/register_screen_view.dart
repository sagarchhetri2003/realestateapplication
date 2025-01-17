// import 'package:flutter/material.dart';

// class RegisterScreenView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 24),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Back Button
//               IconButton(
//                 onPressed: () {
//                   Navigator.pop(context); // Handle back navigation
//                 },
//                 icon: Icon(Icons.arrow_back),
//               ),
//               SizedBox(height: 16),

//               // Title and Subtitle
//               Text(
//                 "Create your\naccount",
//                 style: TextStyle(
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//               SizedBox(height: 8),

//               SizedBox(height: 32),

//               // Full Name Input
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Full name',
//                   prefixIcon: Icon(Icons.person),
//                   filled: true,
//                   fillColor: Colors.grey[200],
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 16),

//               // Email Input
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                   prefixIcon: Icon(Icons.email),
//                   filled: true,
//                   fillColor: Colors.grey[200],
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 16),

//               // Password Input
//               TextField(
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                   prefixIcon: Icon(Icons.lock),
//                   suffixText: 'Show password',
//                   suffixStyle: TextStyle(color: Colors.blue),
//                   filled: true,
//                   fillColor: Colors.grey[200],
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 32),

//               // Register Button
//               Center(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     // Handle registration
//                   },
//                   child: Text(
//                     "Register",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blue,
//                     foregroundColor: Colors.white,
//                     minimumSize: Size(double.infinity, 50),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                 ),
//               ),

//               // Spacer to keep button at the bottom
//               Spacer(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
