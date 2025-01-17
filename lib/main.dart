// import 'package:flutter/material.dart';
// import 'package:realestateapplication/app/app.dart';
// import 'package:realestateapplication/app/di/di.dart';
// import 'package:realestateapplication/core/network/hive_service.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   // Initialize Hive Database
//   await HiveService.init();

//   // Delete all the hive data and boxes
//   // await HiveService().clearAll();
//   // Initialize Dependencies
//   await initDependencies();

//   runApp(
//     App(),
//   );
// }

import 'package:flutter/material.dart';
import 'package:realestateapplication/app/app.dart';
import 'package:realestateapplication/app/di/di.dart';
import 'package:realestateapplication/core/network/hive_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //  Ensure HiveService initializes properly
  await HiveService.init();

  // Avoid clearing data unless necessary
  // await HiveService().clearAll();

  // ,,,,,,,,,,,,,,,,,,, Initialize Dependencies
  await initDependencies();

  //  Run the App
  runApp(const App());
}
