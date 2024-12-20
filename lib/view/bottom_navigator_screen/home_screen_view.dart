// import 'package:flutter/material.dart';

// class HomeScreenView extends StatefulWidget {
//   const HomeScreenView({super.key});

//   @override
//   _homeScreenViewState createState() => _homeScreenViewState();
// }

// class _homeScreenViewState extends State<HomeScreenView> {
//   // Controllers to handle text input
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   // Default credentials
//   final String defaultEmail = 'admin';
//   final String defaultPassword = 'admin';

//   // Variable to track button click state
//   bool isButtonPressed = false;

//   // Function to validate login
//   void _login() {
//     final email = emailController.text.trim();
//     final password = passwordController.text.trim();

//     if (email == defaultEmail && password == defaultPassword) {
//       // Show success dialog
//       _showDialog('Success', 'Successfully logged in');
//     } else {
//       // Show failure dialog
//       _showDialog('Error', 'Invalid email or password');
//     }
//   }

//   // Function to show dialog
//   void _showDialog(String title, String message) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(title),
//           content: Text(message),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // Email TextField
//               TextFormField(
//                 controller: emailController,
//                 decoration: InputDecoration(
//                   border: const OutlineInputBorder(),
//                   hintText: 'Enter Email',
//                   fillColor:
//                       isButtonPressed ? Colors.grey.shade300 : Colors.white,
//                   filled: true,
//                 ),
//               ),
//               const SizedBox(height: 16),
//               // Password TextField
//               TextFormField(
//                 controller: passwordController,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   border: const OutlineInputBorder(),
//                   hintText: 'Enter Password',
//                   fillColor:
//                       isButtonPressed ? Colors.grey.shade300 : Colors.white,
//                   filled: true,
//                 ),
//               ),
//               const SizedBox(height: 32),
//               // Login Button
//               ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     isButtonPressed = true; // Change color when pressed
//                   });
//                   _login();
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: isButtonPressed
//                       ? Colors.blue.shade400
//                       : Colors.blue, // Change color when pressed
//                 ),
//                 child: const Text('Login'),
//               ),
//               const SizedBox(height: 16),
//               // Register Button
//               ElevatedButton(
//                 onPressed: () {
//                   // You can implement the registration logic here
//                   _showDialog('Register',
//                       'Registration feature is not implemented yet');
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.green,
//                 ),
//                 child: const Text('Register'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Home'),
    );
  }
}
