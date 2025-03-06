// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:food_hub/app/di/di.dart';
// import 'package:food_hub/features/auth/presentation/view/login_page_view.dart';
// import 'package:food_hub/features/auth/presentation/view_model/signup/bloc/signup_bloc.dart';

// class SignUpPage extends StatefulWidget {
//   const SignUpPage({super.key});

//   @override
//   State<SignUpPage> createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController fnameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   bool _isPasswordVisible = false;

//   void _registerUser(BuildContext context) {
//     if (_formKey.currentState!.validate()) {
//       EasyLoading.show(status: 'Signing Up...');
//       context.read<SignupBloc>().add(
//         RegisterUser(
//           context: context,
//           name: fnameController.text,
//           email: emailController.text,
//           phone: phoneController.text,
//           password: passwordController.text,
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => getIt<SignupBloc>(),
//       child: BlocListener<SignupBloc, SignupState>(
//         listener: (context, state) {
//           Future.delayed(
//             const Duration(seconds: 1),
//             () => EasyLoading.dismiss(),
//           );
//           if (state is SignUpSuccess) {
//             ScaffoldMessenger.of(context).clearSnackBars();
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text('Registration Successful'),
//                 backgroundColor: Colors.green,
//               ),
//             );

//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => const LoginPage()),
//             );
//           }

//           if (state is SignUpError) {
//             ScaffoldMessenger.of(context).clearSnackBars();
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text(state.message),
//                 backgroundColor: Colors.red,
//               ),
//             );
//           }
//         },
//         child: Builder(
//           builder: (context) {
//             return Scaffold(
//               backgroundColor: Colors.orange.shade100,
//               body: SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                   child: Form(
//                     key: _formKey,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         // const SizedBox(height: 50),
//                         // Image.asset('assets/images/logo.png', fit: BoxFit.cover, height: 200),
//                         // const SizedBox(height: 50),
//                         const Text(
//                           "Create An Account",
//                           style: TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                             fontFamily: 'Rockwell',
//                           ),
//                         ),
//                         const SizedBox(height: 20),
//                         _buildTextField(
//                           fnameController,
//                           "Your Name",
//                           "Enter your name",
//                           Icons.person,
//                         ),
//                         const SizedBox(height: 20),
//                         _buildTextField(
//                           emailController,
//                           "Your Email",
//                           "Enter your email",
//                           Icons.email,
//                         ),
//                         const SizedBox(height: 20),
//                         _buildTextField(
//                           phoneController,
//                           "Phone Number",
//                           "Enter your phone number",
//                           Icons.phone,
//                         ),
//                         const SizedBox(height: 20),
//                         _buildPasswordField(),
//                         const SizedBox(height: 30),
//                         SizedBox(
//                           width: double.infinity,
//                           child: ElevatedButton(
//                             onPressed: () => _registerUser(context),
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor:
//                                   Colors.blueAccent, // Use blue accent color
//                               padding: const EdgeInsets.symmetric(
//                                 vertical: 14,
//                                 horizontal: 50,
//                               ),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                             ),
//                             child: const Text(
//                               "Sign Up",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.normal,
//                                 fontFamily: "Rockwell",
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 20),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             const Text(
//                               "Already have an account?",
//                               style: TextStyle(fontFamily: 'Rockwell'),
//                             ),
//                             TextButton(
//                               onPressed: () {
//                                 Navigator.pushReplacement(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => const LoginPage(),
//                                   ),
//                                 );
//                               },
//                               child: const Text(
//                                 "Sign In",
//                                 style: TextStyle(
//                                   color: Color(0xFF3579FF),
//                                   fontFamily: 'Rockwell',
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField(
//     TextEditingController controller,
//     String labelText,
//     String hintText,
//     IconData icon,
//   ) {
//     return TextFormField(
//       controller: controller,
//       decoration: InputDecoration(
//         prefixIcon: Icon(icon, size: 18),
//         labelText: labelText,
//         hintText: hintText,
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//         filled: true,
//         fillColor: Colors.white,
//       ),
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'Please enter $labelText';
//         }
//         return null;
//       },
//     );
//   }

//   Widget _buildPasswordField() {
//     return TextFormField(
//       controller: passwordController,
//       obscureText: !_isPasswordVisible,
//       decoration: InputDecoration(
//         prefixIcon: const Icon(Icons.lock, size: 18),
//         labelText: "Password",
//         hintText: "Enter your password",
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//         filled: true,
//         fillColor: Colors.white,
//         suffixIcon: IconButton(
//           icon: Icon(
//             _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
//           ),
//           onPressed: () {
//             setState(() {
//               _isPasswordVisible = !_isPasswordVisible;
//             });
//           },
//         ),
//       ),
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'Please enter password';
//         } else if (value.length < 6) {
//           return 'Password must be at least 6 characters long';
//         }
//         return null;
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:food_hub/app/di/di.dart';
import 'package:food_hub/features/auth/presentation/view/login_page_view.dart';
import 'package:food_hub/features/auth/presentation/view_model/signup/bloc/signup_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController fnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _registerUser(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      EasyLoading.show(status: 'Signing Up...');
      context.read<SignupBloc>().add(
        RegisterUser(
          context: context,
          name: fnameController.text,
          email: emailController.text,
          phone: phoneController.text,
          password: passwordController.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignupBloc>(),
      child: BlocListener<SignupBloc, SignupState>(
        listener: (context, state) {
          Future.delayed(
            const Duration(seconds: 1),
            () => EasyLoading.dismiss(),
          );
          if (state is SignUpSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Registration Successful'),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          } else if (state is SignUpError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: IntrinsicHeight(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 60.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/signup_logo.png',
                            height: 150,
                          ),
                          const SizedBox(height: 30),
                          const Text(
                            'Create Account',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                _buildTextField(
                                  fnameController,
                                  'Full Name',
                                  Icons.person,
                                ),
                                const SizedBox(height: 15),
                                _buildTextField(
                                  emailController,
                                  'E-mail',
                                  Icons.email,
                                ),
                                const SizedBox(height: 15),
                                _buildTextField(
                                  phoneController,
                                  'Phone Number',
                                  Icons.phone,
                                ),
                                const SizedBox(height: 15),
                                _buildPasswordField(),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: 15,
                              ),
                            ),
                            onPressed: () => _registerUser(context),
                            child: const Text(
                              'SIGN UP',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Already have an account?"),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginPage(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Sign In',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String labelText,
    IconData icon,
  ) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        prefixIcon: Icon(icon),
      ),
      validator:
          (value) =>
              value == null || value.isEmpty ? 'Please enter $labelText' : null,
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: passwordController,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        prefixIcon: const Icon(Icons.lock),
      ),
      validator:
          (value) =>
              value == null || value.isEmpty
                  ? 'Please enter password'
                  : (value.length < 6
                      ? 'Password must be at least 6 characters'
                      : null),
    );
  }
}
