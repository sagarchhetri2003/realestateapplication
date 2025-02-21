// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:permission_handler/permission_handler.dart'
//     as permissionHandler;

// import '../view/login_page.dart';
// import '../view_model/signup/bloc/signup_bloc.dart';
// import '../view_model/signup/bloc/signup_event.dart';
// import '../view_model/signup/bloc/signup_state.dart';

// class SignUpScreenView extends StatefulWidget {
//   @override
//   _SignUpScreenViewState createState() => _SignUpScreenViewState();
// }

// class _SignUpScreenViewState extends State<SignUpScreenView> {
//   final TextEditingController fullNameController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController addressController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController =
//       TextEditingController();

//   // File? _profileImage;

//   // Future<void> _pickImage(ImageSource source) async {
//   //   final pickedFile = await ImagePicker().pickImage(source: source);
//   //   if (pickedFile != null) {
//   //     setState(() {
//   //       _profileImage = File(pickedFile.path);
//   //     });
//   //   }
//   // }

//   // Check camera permission
//   Future<void> _checkCameraPermission() async {
//     if (await permissionHandler.Permission.camera.request().isRestricted ||
//         await permissionHandler.Permission.camera.request().isDenied) {
//       await permissionHandler.Permission.camera.request();
//     }
//   }

//   // Image variables
//   File? _img;

//   // Browse image from gallery or camera
//   Future<void> _browseImage(ImageSource imageSource) async {
//     try {
//       final image = await ImagePicker().pickImage(source: imageSource);
//       if (image != null) {
//         setState(() {
//           _img = File(image.path);
//           // Send image to RegisterBloc
//           context.read<SignupBloc>().add(LoadImage(file: _img!));
//         });
//       } else {
//         return;
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }

//   void _onSignupButtonPressed() {
//     final signupBloc = context.read<SignupBloc>();
//     signupBloc.add(SignupButtonPressed(
//       fullName: fullNameController.text.trim(),
//       phonenumber: phoneController.text.trim(),
//       address: addressController.text.trim(),
//       email: emailController.text.trim(),
//       password: passwordController.text.trim(),
//       confirmPassword: confirmPasswordController.text.trim(),
//     ));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => SignupBloc(),
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("Sign Up"),
//           centerTitle: true,
//           backgroundColor: Colors.blueAccent,
//         ),
//         body: SafeArea(
//           child: BlocListener<SignupBloc, SignupState>(
//             listener: (context, state) {
//               if (state is SignupSuccess) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                       content: Text('Registration Successful!'),
//                       backgroundColor: Colors.green),
//                 );
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(builder: (context) => LoginScreenView()),
//                 );
//               } else if (state is SignupFailure) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                       content: Text(state.error), backgroundColor: Colors.red),
//                 );
//               }
//             },
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.all(24),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   // GestureDetector(
//                   //   onTap: _pickImage,
//                   //   child: CircleAvatar(
//                   //     radius: 50,
//                   //     backgroundColor: Colors.grey[300],
//                   //     backgroundImage: _profileImage != null
//                   //         ? FileImage(_profileImage!)
//                   //         : null,
//                   //     child: _profileImage == null
//                   //         ? Icon(Icons.camera_alt, size: 50, color: Colors.grey)
//                   //         : null,
//                   //   ),
//                   // ),
//                   const SizedBox(height: 20),
//                   CustomTextField(
//                       controller: fullNameController,
//                       hintText: "Full Name",
//                       icon: Icons.person),
//                   CustomTextField(
//                       controller: phoneController,
//                       hintText: "Phone Number",
//                       icon: Icons.phone),
//                   CustomTextField(
//                       controller: addressController,
//                       hintText: "Address",
//                       icon: Icons.home),
//                   CustomTextField(
//                       controller: emailController,
//                       hintText: "Email",
//                       icon: Icons.email),
//                   CustomTextField(
//                       controller: passwordController,
//                       hintText: "Password",
//                       icon: Icons.lock,
//                       obscureText: true),
//                   CustomTextField(
//                       controller: confirmPasswordController,
//                       hintText: "Confirm Password",
//                       icon: Icons.lock,
//                       obscureText: true),
//                   const SizedBox(height: 30),
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         padding: EdgeInsets.symmetric(vertical: 15),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10)),
//                         backgroundColor: Colors.blueAccent,
//                       ),
//                       onPressed: _onSignupButtonPressed,
//                       child: Text("Sign Up",
//                           style: TextStyle(color: Colors.white, fontSize: 19)),
//                     ),
//                   ),
//                 ],
//               ),
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
//     Key? key,
//     required this.controller,
//     required this.hintText,
//     required this.icon,
//     this.obscureText = false,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: TextField(
//         controller: controller,
//         obscureText: obscureText,
//         decoration: InputDecoration(
//           prefixIcon: Icon(icon, color: Colors.blueAccent),
//           labelText: hintText,
//           border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//           filled: true,
//           fillColor: Colors.grey[200],
//           contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
//         ),
//       ),
//     );
//   }
// }

// import 'package:e_learning/app/di/di.dart';
// import 'package:e_learning/features/auth/presentation/view/login_view.dart';
// import 'package:e_learning/features/auth/presentation/view_model/signup/register_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class RegisterView extends StatefulWidget {
//   const RegisterView({super.key});

//   @override
//   _RegisterViewState createState() => _RegisterViewState();
// }

// class _RegisterViewState extends State<RegisterView> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   bool _isPasswordVisible = false;

//   void _registerUser() {
//     if (_formKey.currentState!.validate()) {
//       context.read<RegisterBloc>().add(
//             RegisterUser(
//               context: context,
//               name: nameController.text,
//               email: emailController.text,
//               phone: phoneController.text,
//               password: passwordController.text,
//             ),
//           );

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Registered Successfully!'),
//           backgroundColor: Colors.green,
//         ),
//       );
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const LoginPage()),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) =>
//           getIt<RegisterBloc>(), // Ensures RegisterBloc is available
//       child: Scaffold(
//         body: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Color(0xFF81D4FA), // Light blue
//                 Color(0xFFFFFFFF), // White
//               ],
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//             ),
//           ),
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.symmetric(horizontal: 25.0),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   const SizedBox(height: 50),

//                   // Logo
//                   Image.asset(
//                     'assets/images/logo.png',
//                     height: 150,
//                   ),
//                   const SizedBox(height: 20),

//                   // Title
//                   const Text(
//                     'SIGN UP',
//                     style: TextStyle(
//                       fontSize: 30,
//                       fontFamily: 'Poppins',
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                   const SizedBox(height: 10),

//                   // Subtitle
//                   const Text(
//                     'Create your account to embark on your \neducational adventure',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontFamily: 'Poppins',
//                       color: Colors.black54,
//                     ),
//                   ),
//                   const SizedBox(height: 30),

//                   // Form Fields
//                   _buildTextField(nameController, "Your Name",
//                       "Enter your name", Icons.person),
//                   const SizedBox(height: 20),
//                   _buildTextField(emailController, "Your Email",
//                       "Enter your email", Icons.email),
//                   const SizedBox(height: 20),
//                   _buildTextField(phoneController, "Phone Number",
//                       "Enter your phone number", Icons.phone),
//                   const SizedBox(height: 20),
//                   _buildPasswordField(),
//                   const SizedBox(height: 30),

//                   SizedBox(
//                     width: double.infinity,
//                     child: Container(
//                       decoration: BoxDecoration(
//                         gradient: const LinearGradient(
//                           colors: [Colors.black, Colors.blue], // Gradient Color
//                           begin: Alignment.centerLeft,
//                           end: Alignment.centerRight,
//                         ),
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                       child: ElevatedButton(
//                         onPressed: _registerUser,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors
//                               .transparent, // Transparent to show gradient
//                           shadowColor: Colors.transparent, // No extra shadow
//                           padding: const EdgeInsets.symmetric(vertical: 15),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(
//                                 8.0), // Match border radius
//                           ),
//                         ),
//                         child: const Text(
//                           'SIGN UP',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 18,
//                             fontFamily: "Rockwell",
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),

//                   const SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text("Already have an account?",
//                           style: TextStyle(fontFamily: 'Rockwell')),
//                       TextButton(
//                         onPressed: () {
//                           Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const LoginPage()),
//                           );
//                         },
//                         child: const Text(
//                           "Sign In",
//                           style: TextStyle(
//                             color: Color(0xFF3579FF),
//                             fontFamily: 'Rockwell',
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField(TextEditingController controller, String labelText,
//       String hintText, IconData icon) {
//     return TextFormField(
//       controller: controller,
//       decoration: InputDecoration(
//         prefixIcon: Icon(icon, size: 18, color: Colors.black),
//         labelText: labelText,
//         labelStyle: const TextStyle(color: Colors.black),
//         hintText: hintText,
//         hintStyle: const TextStyle(color: Colors.black54),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: const BorderSide(color: Colors.black),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: const BorderSide(color: Colors.black),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: const BorderSide(color: Colors.black),
//         ),
//         filled: true,
//         fillColor: Colors.transparent,
//       ),
//       style: const TextStyle(color: Colors.black),
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
//         prefixIcon: const Icon(Icons.lock, size: 18, color: Colors.black),
//         labelText: "Password",
//         labelStyle: const TextStyle(color: Colors.black),
//         hintText: "Enter your password",
//         hintStyle: const TextStyle(color: Colors.black54),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: const BorderSide(color: Colors.black),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: const BorderSide(color: Colors.black),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: const BorderSide(color: Colors.black),
//         ),
//         filled: true,
//         fillColor: Colors.transparent,
//         suffixIcon: IconButton(
//           icon: Icon(
//             _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
//             color: Colors.black,
//           ),
//           onPressed: () {
//             setState(() {
//               _isPasswordVisible = !_isPasswordVisible;
//             });
//           },
//         ),
//       ),
//       style: const TextStyle(color: Colors.black),
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'Please enter password';
//         } else if (value.length < 8) {
//           return 'Password must be at least 8 characters long';
//         }
//         return null;
//       },
//     );
//   }
// }

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:realestateapplication/app/di/di.dart';
import 'package:realestateapplication/features/auth/presentation/view/login_page.dart';
import 'package:realestateapplication/features/auth/presentation/view_model/signup/bloc/signup_bloc.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  bool _isPasswordVisible = false;

  Future<void> _checkCameraPermission() async {
    var status = await Permission.camera.request();
    if (status.isDenied || status.isRestricted) {
      await Permission.camera.request();
    }
  }

  File? _img;

  Future<void> _browseImage(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image != null) {
        setState(() {
          _img = File(image.path);
          context.read<SignupBloc>().add(LoadImage(file: _img!));
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignupBloc>(),
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF007BFF), Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 75,
                        backgroundImage: _img != null
                            ? FileImage(_img!)
                            : const AssetImage('assets/images/profile.png')
                                as ImageProvider,
                      ),
                      IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            builder: (context) => Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton.icon(
                                    onPressed: () async {
                                      await _checkCameraPermission();
                                      _browseImage(ImageSource.camera);
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(Icons.camera),
                                    label: const Text('Camera'),
                                  ),
                                  ElevatedButton.icon(
                                    onPressed: () async {
                                      await _checkCameraPermission();
                                      _browseImage(ImageSource.gallery);
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(Icons.image),
                                    label: const Text('Gallery'),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        icon: const Icon(Icons.camera_alt, color: Colors.blue),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'SIGN UP',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildTextField(
                      fullNameController, "Full Name", Icons.person),
                  _buildTextField(addressController, "Address", Icons.home),
                  _buildTextField(emailController, "Email", Icons.email),
                  _buildTextField(phoneController, "Phone Number", Icons.phone),
                  _buildPasswordField(),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final signupState = context.read<SignupBloc>().state;
                          final imageName = signupState.imageName;

                          context.read<SignupBloc>().add(
                                SignupUser(
                                  context: context,
                                  fullName: fullNameController.text,
                                  email: emailController.text,
                                  phonenumber: phoneController.text,
                                  address: addressController.text,
                                  password: passwordController.text,
                                  image: imageName,
                                ),
                              );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text(
                        'SIGN UP',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
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
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreenView()),
                          );
                        },
                        child: const Text("Sign In",
                            style: TextStyle(color: Colors.blue)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String labelText, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.blue),
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: (value) =>
            value == null || value.isEmpty ? 'Enter $labelText' : null,
      ),
    );
  }

  Widget _buildPasswordField() {
    return _buildTextField(passwordController, "Password", Icons.lock);
  }
}
