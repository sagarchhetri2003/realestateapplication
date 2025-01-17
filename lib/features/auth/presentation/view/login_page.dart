// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:realestateapplication/auth/presentation/view_model/login/bloc/login_bloc.dart';
// import 'package:realestateapplication/features/auth/presentation/view_model/login/bloc/login_bloc.dart';

// import '../../../core/common/snackbar/my_snackbar.dart';

// class LoginPage extends StatelessWidget {
//   LoginPage({super.key});

//   final _formKey = GlobalKey<FormState>();
//   final _usernameController = TextEditingController(text: 'kiran');
//   final _passwordController = TextEditingController(text: 'kiran123');

//   final _gap = const SizedBox(height: 8);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Form(
//           key: _formKey,
//           child: Center(
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(8),
//                 child: Column(
//                   children: [
//                     const Text(
//                       'Login',
//                       style: TextStyle(
//                         fontSize: 30,
//                         fontFamily: 'Brand Bold',
//                       ),
//                     ),
//                     _gap,
//                     TextFormField(
//                       key: const ValueKey('username'),
//                       controller: _usernameController,
//                       decoration: const InputDecoration(
//                         border: OutlineInputBorder(),
//                         labelText: 'Username',
//                       ),
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'Please enter username';
//                         }
//                         return null;
//                       },
//                     ),
//                     _gap,
//                     TextFormField(
//                       key: const ValueKey('password'),
//                       controller: _passwordController,
//                       obscureText: true,
//                       decoration: const InputDecoration(
//                         labelText: 'Password',
//                       ),
//                       validator: ((value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter password';
//                         }
//                         return null;
//                       }),
//                     ),
//                     _gap,
//                     ElevatedButton(
//                       onPressed: () async {
//                         if (_formKey.currentState!.validate()) {
//                           if (_usernameController.text == 'kiran' &&
//                               _passwordController.text == 'kiran123') {
//                             context.read<LoginBloc>().add(
//                                   NavigateHomeScreenEvent(
//                                     destination: HomeView(),
//                                     context: context,
//                                   ),
//                                 );
//                           } else {
//                             showMySnackBar(
//                               context: context,
//                               message: 'Invalid username or password',
//                               color: Colors.red,
//                             );
//                           }
//                         }
//                       },
//                       child: const SizedBox(
//                         height: 50,
//                         child: Center(
//                           child: Text(
//                             'Login',
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontFamily: 'Brand Bold',
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     ElevatedButton(
//                       key: const ValueKey('registerButton'),
//                       onPressed: () {
//                         context.read<LoginBloc>().add(
//                               NavigateRegisterScreenEvent(
//                                 destination: LoginPage(),
//                                 context: context,
//                               ),
//                             );
//                       },
//                       child: const SizedBox(
//                         height: 50,
//                         child: Center(
//                           child: Text(
//                             'Register',
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontFamily: 'Brand Bold',
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:realestateapplication/features/auth/presentation/view/signup_page.dart';
// import 'package:realestateapplication/features/home/presentation/view/dashboard_screen_view.dart';

// class LoginScreenView extends StatefulWidget {
//   LoginScreenView({Key? key}) : super(key: key);

//   @override
//   _LoginScreenViewState createState() => _LoginScreenViewState();
// }

// class _LoginScreenViewState extends State<LoginScreenView> {
//   // Static admin credentials
//   final String adminEmail = 'admin';
//   final String adminPassword = 'admin';

//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   bool _isPasswordVisible = false;

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
//                   TextField(
//                     controller: emailController,
//                     decoration: InputDecoration(
//                       labelText: 'Email',
//                       prefixIcon: const Icon(Icons.email),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 12),

//                   // Password Input
//                   TextField(
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
//                     ),
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
//                     onPressed: () => _validateLogin(context),
//                     child: const Text('Sign In'),
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
//                             // Navigate to RegisterScreenView
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => SignUpScreenView()),
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
  LoginScreenView({Key? key}) : super(key: key);

  @override
  _LoginScreenViewState createState() => _LoginScreenViewState();
}

class _LoginScreenViewState extends State<LoginScreenView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  // Validate login credentials
  Future<void> _validateLogin(BuildContext context) async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final storedEmail = prefs.getString('user_email');
    final storedPassword = prefs.getString('user_password');

    if (email == storedEmail && password == storedPassword) {
      // Navigate to DashboardScreenView
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardScreenView()),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Image that covers 30% of the screen
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
            child: Image.asset(
              'assets/logo/login_logo.png',
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),

          // Main content section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Let's Sign In Text
                  const Text(
                    "Let's Sign In",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),

                  // Email Input
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Password Input
                  TextField(
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
                    ),
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
                    onPressed: () => _validateLogin(context),
                    child: const Text('Sign In'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Divider with OR text
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(thickness: 1, color: Colors.grey),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          'OR',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      const Expanded(
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

                  const Spacer(),

                  // Don't have an account? Register
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t have an account? '),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreenView()),
                            );
                          },
                          child: const Text(
                            'Register',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
