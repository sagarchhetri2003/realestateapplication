// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:realestateapplication/app/di/di.dart';
// import 'package:realestateapplication/features/auth/presentation/view/login_page.dart';
// import 'package:realestateapplication/features/auth/presentation/view_model/signup/bloc/signup_bloc.dart';
// import 'package:realestateapplication/features/home/presentation/view/dashboard_screen_view.dart';

// import '../view_model/login/bloc/login_bloc.dart';

// class SignUpScreenView extends StatefulWidget {
//   @override
//   _SignUpScreenViewState createState() => _SignUpScreenViewState();
// }

// class _SignUpScreenViewState extends State<SignUpScreenView> {
//   final TextEditingController fullNameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController =
//       TextEditingController();
//   bool isPasswordVisible = false;

//   @override
//   void initState() {
//     super.initState();
//     Hive.initFlutter();
//   }

//   void _saveUserData() async {
//     if (passwordController.text != confirmPasswordController.text) {
//       _showErrorDialog("Passwords do not match.");
//       return;
//     }

//     var userBox = await Hive.openBox('users');
//     userBox.put(emailController.text, {
//       "name": fullNameController.text,
//       "email": emailController.text,
//       "password": passwordController.text,
//     });

//     _showSuccessDialog("Account created successfully!");
//   }

//   void _showErrorDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text("Error"),
//         content: Text(message),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text("OK"),
//           ),
//         ],
//       ),
//     );
//   }

//   void _showSuccessDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text("Success"),
//         content: Text(message),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (context) => DashboardScreenView()),
//               );
//             },
//             child: const Text("OK"),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<SignupBloc>(create: (context) => getIt<SignupBloc>()),
//         BlocProvider<LoginBloc>(create: (context) => getIt<LoginBloc>()),
//       ],
//       child: Scaffold(
//         body: SafeArea(
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.symmetric(horizontal: 24),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const SizedBox(height: 10),
//                 Image.asset(
//                   'assets/images/Logo.png',
//                   height: 250,
//                   width: 250,
//                 ),
//                 const SizedBox(height: 20),
//                 const Text(
//                   "Create your Account",
//                   style: TextStyle(
//                     fontSize: 28,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.blue,
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 CustomTextField(
//                   controller: fullNameController,
//                   hintText: "Full Name",
//                   icon: Icons.person,
//                 ),
//                 const SizedBox(height: 20),
//                 CustomTextField(
//                   controller: emailController,
//                   hintText: "Email",
//                   icon: Icons.email,
//                 ),
//                 const SizedBox(height: 20),
//                 CustomTextField(
//                   controller: passwordController,
//                   hintText: "Password",
//                   icon: Icons.lock,
//                   obscureText: true,
//                 ),
//                 const SizedBox(height: 20),
//                 CustomTextField(
//                   controller: confirmPasswordController,
//                   hintText: "Confirm Password",
//                   icon: Icons.lock,
//                   obscureText: true,
//                 ),
//                 const SizedBox(height: 30),
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: _saveUserData,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blue,
//                       padding: const EdgeInsets.symmetric(vertical: 15),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     child: const Text(
//                       "Sign Up",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 19,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text("Already have an account?"),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => LoginScreenView()),
//                         );
//                       },
//                       child: const Text(
//                         "Sign In",
//                         style: TextStyle(color: Colors.blue),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CustomTextField extends StatelessWidget {
//   final TextEditingController controller;
//   final String hintText;
//   final IconData icon;
//   final bool obscureText;

//   const CustomTextField({
//     required this.controller,
//     required this.hintText,
//     required this.icon,
//     this.obscureText = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: controller,
//       obscureText: obscureText,
//       decoration: InputDecoration(
//         prefixIcon: Icon(icon),
//         labelText: hintText,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         filled: true,
//         fillColor: Colors.grey[200],
//         contentPadding:
//             const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:realestateapplication/app/di/di.dart';
import 'package:realestateapplication/features/auth/presentation/view/login_page.dart';
import 'package:realestateapplication/features/auth/presentation/view_model/signup/bloc/signup_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../view_model/login/bloc/login_bloc.dart';

class SignUpScreenView extends StatefulWidget {
  @override
  _SignUpScreenViewState createState() => _SignUpScreenViewState();
}

class _SignUpScreenViewState extends State<SignUpScreenView> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    Hive.initFlutter();
  }

  // Function to save user data in Hive and SharedPreferences
  Future<void> _saveUserData() async {
    final String fullName = fullNameController.text.trim();
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();
    final String confirmPassword = confirmPasswordController.text.trim();

    if (password != confirmPassword) {
      _showErrorDialog("Passwords do not match.");
      return;
    }

    var userBox = await Hive.openBox('users');
    userBox.put(email, {
      "name": fullName,
      "email": email,
      "password": password,
    });

    // Save credentials in SharedPreferences
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_email', email);
    await prefs.setString('user_password', password);

    _showSuccessDialog("Account created successfully!");
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Error"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  void _showSuccessDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Success"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreenView()),
              );
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignupBloc>(create: (context) => getIt<SignupBloc>()),
        BlocProvider<LoginBloc>(create: (context) => getIt<LoginBloc>()),
      ],
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                // Image.asset(
                //   'assets/images/Logo.png',
                //   height: 250,
                //   width: 250,
                // ),
                const SizedBox(height: 20),
                const Text(
                  "Create your Account",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 30),
                CustomTextField(
                  controller: fullNameController,
                  hintText: "Full Name",
                  icon: Icons.person,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: emailController,
                  hintText: "Email",
                  icon: Icons.email,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: passwordController,
                  hintText: "Password",
                  icon: Icons.lock,
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: confirmPasswordController,
                  hintText: "Confirm Password",
                  icon: Icons.lock,
                  obscureText: true,
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _saveUserData,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreenView()),
                        );
                      },
                      child: const Text(
                        "Sign In",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final bool obscureText;

  const CustomTextField({
    required this.controller,
    required this.hintText,
    required this.icon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        labelText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Colors.grey[200],
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      ),
    );
  }
}
