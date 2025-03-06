// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:food_hub/app/di/di.dart';
// import 'package:food_hub/app/shared_prefs/token_shared_prefs.dart';
// import 'package:food_hub/features/auth/presentation/view/login_page_view.dart';
// import 'package:food_hub/features/cart/presentation/view_model/cart_cubit.dart';
// import 'package:food_hub/features/products/presentation/view_model/products/products_cubit.dart';
// import 'package:food_hub/features/profile/presentation/view_model/profile_cubit.dart';
// import 'package:food_hub/view/bottom_view/search.dart';

// import '../../cart/presentation/view/cart_page.dart';
// import '../../profile/presentation/view/profile_page.dart';
// import 'view_model/cubit/home_cubit.dart';

// class DashboardPageView extends StatelessWidget {
//   DashboardPageView({super.key});

//   final List<Widget> lstBottomScreen = [
//     const Search(),
//     const CartPage(),
//     const ProfilePage(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(create: (context) => getIt<HomeCubit>()),
//         BlocProvider(
//           create: (context) => getIt<ProductsCubit>()..loadProducts(),
//         ),
//         BlocProvider(create: (context) => getIt<CartCubit>()..getCart()),
//         BlocProvider(create: (context) => getIt<ProfileCubit>()..getProfile()),
//       ],
//       child: BlocBuilder<HomeCubit, HomeState>(
//         builder: (context, state) {
//           final int selectedIndex =
//               context.watch<HomeCubit>().state.selectedIndex;

//           return Scaffold(
//             appBar: AppBar(
//               title: const Text('Afnai Real Estate'),
//               centerTitle: true,
//               backgroundColor: Colors.blueAccent[30],
//               actions: [
//                 IconButton(
//                   icon: const Icon(Icons.logout),
//                   onPressed: () async {
//                     getIt<Dio>().options.headers.remove('Authorization');
//                     getIt<TokenSharedPrefs>().clearToken();

//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const LoginPage(),
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//             body: IndexedStack(index: selectedIndex, children: lstBottomScreen),
//             bottomNavigationBar: BottomNavigationBar(
//               type: BottomNavigationBarType.fixed,
//               items: const [
//                 BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.shopping_cart),
//                   label: 'Cart',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.person),
//                   label: 'Profile',
//                 ),
//               ],
//               backgroundColor: Colors.blue,
//               selectedItemColor: Colors.white,
//               unselectedItemColor: Colors.black,
//               currentIndex: selectedIndex,
//               onTap: context.read<HomeCubit>().changeIndex,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }


// import 'dart:async';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:food_hub/app/di/di.dart';
// import 'package:food_hub/app/shared_prefs/token_shared_prefs.dart';
// import 'package:food_hub/features/auth/presentation/view/login_page_view.dart';
// import 'package:food_hub/features/cart/presentation/view_model/cart_cubit.dart';
// import 'package:food_hub/features/products/presentation/view_model/products/products_cubit.dart';
// import 'package:food_hub/features/profile/presentation/view_model/profile_cubit.dart';
// import 'package:food_hub/view/bottom_view/search.dart';
// import 'package:sensors_plus/sensors_plus.dart';
// import 'dart:math';

// import '../../cart/presentation/view/cart_page.dart';
// import '../../profile/presentation/view/profile_page.dart';
// import 'view_model/cubit/home_cubit.dart';

// typedef ShakeCallback = void Function();

// class ShakeDetector {
//   final double shakeThresholdGravity;
//   final int minTimeBetweenShakes;
//   final ShakeCallback onPhoneShake;

//   StreamSubscription? _accelerometerSubscription;
//   int _lastShakeTimestamp = 0;

//   ShakeDetector({
//     this.shakeThresholdGravity = 2.7,
//     this.minTimeBetweenShakes = 1000,
//     required this.onPhoneShake,
//   });

//   void startListening() {
//     _accelerometerSubscription =
//         accelerometerEvents.listen((AccelerometerEvent event) {
//       double gX = event.x / 9.80665;
//       double gY = event.y / 9.80665;
//       double gZ = event.z / 9.80665;

//       double gForce = sqrt(gX * gX + gY * gY + gZ * gZ);

//       if (gForce > shakeThresholdGravity) {
//         int now = DateTime.now().millisecondsSinceEpoch;
//         if (now - _lastShakeTimestamp > minTimeBetweenShakes) {
//           _lastShakeTimestamp = now;
//           onPhoneShake();
//         }
//       }
//     });
//   }

//   void stopListening() {
//     _accelerometerSubscription?.cancel();
//   }
// }

// class DashboardPageView extends StatefulWidget {
//   DashboardPageView({super.key});

//   @override
//   _DashboardPageViewState createState() => _DashboardPageViewState();
// }

// class _DashboardPageViewState extends State<DashboardPageView> {
//   late ShakeDetector _shakeDetector;

//   final List<Widget> lstBottomScreen = [
//     const Search(),
//     const CartPage(),
//     const ProfilePage(),
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _shakeDetector = ShakeDetector(
//       onPhoneShake: () {
//         // Handle logout functionality here
//         getIt<Dio>().options.headers.remove('Authorization');
//         getIt<TokenSharedPrefs>().clearToken();

//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => const LoginPage(),
//           ),
//         );
//       },
//     );
//     _shakeDetector.startListening();
//   }

//   @override
//   void dispose() {
//     _shakeDetector.stopListening();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(create: (context) => getIt<HomeCubit>()),
//         BlocProvider(
//           create: (context) => getIt<ProductsCubit>()..loadProducts(),
//         ),
//         BlocProvider(create: (context) => getIt<CartCubit>()..getCart()),
//         BlocProvider(create: (context) => getIt<ProfileCubit>()..getProfile()),
//       ],
//       child: BlocBuilder<HomeCubit, HomeState>(
//         builder: (context, state) {
//           final int selectedIndex =
//               context.watch<HomeCubit>().state.selectedIndex;

//           return Scaffold(
//             appBar: AppBar(
//               title: const Text('Afnai Real Estate'),
//               centerTitle: true,
//               backgroundColor: Colors.blueAccent[30],
//               actions: [
//                 IconButton(
//                   icon: const Icon(Icons.logout),
//                   onPressed: () async {
//                     getIt<Dio>().options.headers.remove('Authorization');
//                     getIt<TokenSharedPrefs>().clearToken();

//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const LoginPage(),
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//             body:
//                 IndexedStack(index: selectedIndex, children: lstBottomScreen),
//             bottomNavigationBar: BottomNavigationBar(
//               type: BottomNavigationBarType.fixed,
//               items: const [
//                 BottomNavigationBarItem(
//                     icon: Icon(Icons.home), label: 'Home'),
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.shopping_cart),
//                   label: 'Cart',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.person),
//                   label: 'Profile',
//                 ),
//               ],
//               backgroundColor: Colors.blue,
//               selectedItemColor: Colors.white,
//               unselectedItemColor: Colors.black,
//               currentIndex: selectedIndex,
//               onTap: context.read<HomeCubit>().changeIndex,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }


import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_hub/core/common/snackbar/shake_detector/proximitydetector.dart';
import 'package:proximity_sensor/proximity_sensor.dart';
import 'package:food_hub/app/di/di.dart';
import 'package:food_hub/app/shared_prefs/token_shared_prefs.dart';
import 'package:food_hub/features/auth/presentation/view/login_page_view.dart';
import 'package:food_hub/features/cart/presentation/view_model/cart_cubit.dart';
import 'package:food_hub/features/products/presentation/view_model/products/products_cubit.dart';
import 'package:food_hub/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:food_hub/view/bottom_view/search.dart';
import '../../cart/presentation/view/cart_page.dart';
import '../../profile/presentation/view/profile_page.dart';
import 'view_model/cubit/home_cubit.dart';

class DashboardPageView extends StatefulWidget {
  DashboardPageView({Key? key}) : super(key: key);

  @override
  _DashboardPageViewState createState() => _DashboardPageViewState();
}

class _DashboardPageViewState extends State<DashboardPageView> {
  late ProximityDetector _proximityDetector;

  final List<Widget> lstBottomScreen = [
    const Search(),
    const CartPage(),
    const ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    _proximityDetector = ProximityDetector(
      onProximityChange: (isNear) {
        if (isNear) {
          // Handle logout functionality here
          getIt<Dio>().options.headers.remove('Authorization');
          getIt<TokenSharedPrefs>().clearToken();

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ),
          );
        }
      },
    );
    _proximityDetector.startListening();
  }

  @override
  void dispose() {
    _proximityDetector.stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<HomeCubit>()),
        BlocProvider(
          create: (context) => getIt<ProductsCubit>()..loadProducts(),
        ),
        BlocProvider(create: (context) => getIt<CartCubit>()..getCart()),
        BlocProvider(create: (context) => getIt<ProfileCubit>()..getProfile()),
      ],
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final int selectedIndex =
              context.watch<HomeCubit>().state.selectedIndex;

          return Scaffold(
            appBar: AppBar(
              title: const Text('Afnai Real Estate'),
              centerTitle: true,
              backgroundColor: Colors.blueAccent[30],
              actions: [
                IconButton(
                  icon: const Icon(Icons.logout),
                  onPressed: () async {
                    getIt<Dio>().options.headers.remove('Authorization');
                    getIt<TokenSharedPrefs>().clearToken();

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
            body: IndexedStack(
              index: selectedIndex,
              children: lstBottomScreen,
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
              backgroundColor: Colors.blue,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.black,
              currentIndex: selectedIndex,
              onTap: context.read<HomeCubit>().changeIndex,
            ),
          );
        },
      ),
    );
  }
}
