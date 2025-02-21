// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:realestateapplication/features/auth/presentation/view/signup_page.dart';
// import 'package:realestateapplication/features/home/presentation/view/dashboard_screen_view.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class LoginScreenView extends StatefulWidget {
//   LoginScreenView({Key? key}) : super(key: key);

//   @override
//   _LoginScreenViewState createState() => _LoginScreenViewState();
// }

// class _LoginScreenViewState extends State<LoginScreenView> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   bool _isPasswordVisible = false;

//   // Validate login credentials
//   Future<void> _validateLogin(BuildContext context) async {
//     final email = emailController.text.trim();
//     final password = passwordController.text.trim();

//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     final storedEmail = prefs.getString('user_email');
//     final storedPassword = prefs.getString('user_password');

//     if (email == storedEmail && password == storedPassword) {
//       // Navigate to DashboardScreenView
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => DashboardScreenView()),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Invalid email or password'),
//           backgroundColor: Colors.red,
//         ),
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
//               padding: const EdgeInsets.symmetric(horizontal: 24),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   // Let's Sign In Text
//                   const Text(
//                     "Let's Sign In",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 20),

//                   // Email Input
//                   TextFormField(
//                     key: Key('email'),
//                     controller: emailController,
//                     decoration: InputDecoration(
//                       labelText: 'Email',
//                       prefixIcon: const Icon(Icons.email),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       hintText: 'Enter your email',
//                     ),
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Please enter email';
//                       }
//                       final emailRegex =
//                           RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
//                       if (!emailRegex.hasMatch(value)) {
//                         return 'Enter a valid email address';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 12),

//                   // Password Input
//                   TextFormField(
//                     key: Key('password'),
//                     controller: passwordController,
//                     obscureText: !_isPasswordVisible,
//                     decoration: InputDecoration(
//                       labelText: 'Password',
//                       prefixIcon: const Icon(Icons.lock),
//                       suffixIcon: IconButton(
//                         icon: Icon(
//                           _isPasswordVisible
//                               ? Icons.visibility
//                               : Icons.visibility_off,
//                         ),
//                         onPressed: () {
//                           setState(() {
//                             _isPasswordVisible = !_isPasswordVisible;
//                           });
//                         },
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       hintText: 'Enter your password',
//                     ),
//                     validator: ((value) {
//                       if (value == null || value.length < 8) {
//                         return 'Password must be at least 8 characters';
//                       }
//                       return null;
//                     }),
//                   ),
//                   const SizedBox(height: 12),

//                   // Forgot Password Button
//                   Align(
//                     alignment: Alignment.centerRight,
//                     child: TextButton(
//                       onPressed: () {},
//                       child: const Text(
//                         'Forgot password?',
//                         style: TextStyle(color: Colors.blue),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 12),

//                   // Sign In Button
//                   ElevatedButton(
//                     // key: Key('LoginButton'),
//                     onPressed: () => _validateLogin(context),
//                     child: const Text(key: Key('loginButton'), 'Sign In'),

//                     style: ElevatedButton.styleFrom(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),

//                   const SizedBox(height: 16),

//                   // Divider with OR text
//                   Row(
//                     children: [
//                       const Expanded(
//                         child: Divider(thickness: 1, color: Colors.grey),
//                       ),
//                       const Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 8),
//                         child: Text(
//                           'OR',
//                           style: TextStyle(color: Colors.grey),
//                         ),
//                       ),
//                       const Expanded(
//                         child: Divider(thickness: 1, color: Colors.grey),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 12),

//                   // Facebook and Google Buttons
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: ElevatedButton.icon(
//                           onPressed: () {},
//                           icon: const FaIcon(
//                             FontAwesomeIcons.facebook,
//                             color: Colors.white,
//                           ),
//                           label: const Text('Facebook'),
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.blue,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 12),
//                       Expanded(
//                         child: ElevatedButton.icon(
//                           onPressed: () {},
//                           icon: const FaIcon(
//                             FontAwesomeIcons.google,
//                             color: Colors.white,
//                           ),
//                           label: const Text('Google'),
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

//                   const Spacer(),

//                   // Don't have an account? Register
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 20),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Text('Don\'t have an account? '),
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => SignupView()),
//                             );
//                           },
//                           child: const Text(
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

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:realestateapplication/features/auth/presentation/view/signup_page.dart';
import 'package:realestateapplication/features/home/presentation/view/dashboard_screen_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreenView extends StatefulWidget {
  const LoginScreenView({super.key});

  @override
  _LoginScreenViewState createState() => _LoginScreenViewState();
}

class _LoginScreenViewState extends State<LoginScreenView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // FormKey for form validation
  bool _isPasswordVisible = false;

  // Validate login credentials
  Future<void> _validateLogin(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final storedEmail = prefs.getString('user_email');
      final storedPassword = prefs.getString('user_password');

      if (email == storedEmail && password == storedPassword) {
        // Navigate to DashboardScreenView
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const DashboardScreenView()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Invalid email or password'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // Wrap everything in SingleChildScrollView to make it scrollable
        child: Column(
          children: [
            // Image that covers 30% of the screen
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              child: Image.asset(
                'assets/logo/login_logo.png',
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
            ),

            // Main content section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: _formKey, // Add the form key
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Let's Sign In Text
                    const Text(
                      "Let's Sign In",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),

                    // Email Input
                    TextFormField(
                      key: const Key('email'),
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Enter your email',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter email';
                        }
                        final emailRegex =
                            RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                        if (!emailRegex.hasMatch(value)) {
                          return 'Enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),

                    // Password Input
                    TextFormField(
                      key: const Key('password'),
                      controller: passwordController,
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Enter your password',
                      ),
                      validator: ((value) {
                        if (value == null || value.length < 8) {
                          return 'Password must be at least 8 characters';
                        }
                        return null;
                      }),
                    ),
                    const SizedBox(height: 12),

                    // Forgot Password Button
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot password?',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Sign In Button
                    ElevatedButton(
                      key: const Key('loginButton'), // Added key for testing
                      onPressed: () => _validateLogin(context),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Sign In'),
                    ),

                    const SizedBox(height: 16),

                    // Divider with OR text
                    const Row(
                      children: [
                        Expanded(
                          child: Divider(thickness: 1, color: Colors.grey),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            'OR',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Expanded(
                          child: Divider(thickness: 1, color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Facebook and Google Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: const FaIcon(
                              FontAwesomeIcons.facebook,
                              color: Colors.white,
                            ),
                            label: const Text('Facebook'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: const FaIcon(
                              FontAwesomeIcons.google,
                              color: Colors.white,
                            ),
                            label: const Text('Google'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                        height: 20), // Added space to prevent overflow

                    // Don't have an account? Register
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t have an account? '),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignupView()),
                            );
                          },
                          child: const Text(
                            'Register',
                            style: TextStyle(fontWeight: FontWeight.bold),
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
    );
  }
}
