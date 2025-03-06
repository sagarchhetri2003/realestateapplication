// import 'package:flutter/material.dart';

// class AppTheme {
//   AppTheme._(); // Private constructor to prevent instantiation

//   static ThemeData getApplicationTheme({required bool isDark}) {
//     return ThemeData(
//       primarySwatch: Colors.orange,
//       fontFamily: 'Montserrat',
//       scaffoldBackgroundColor: Colors.white,

//       // AppBar Theme
//       appBarTheme: AppBarTheme(
//         backgroundColor: Colors.orangeAccent[100],
//         elevation: 0, // Removes shadow
//         centerTitle: true,
//         titleTextStyle: const TextStyle(
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//           color: Colors.black,
//         ),
//       ),

//       // Bottom Navigation Bar Theme
//       bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//         backgroundColor: Colors.amber,
//         selectedItemColor: Colors.white,
//         unselectedItemColor: Colors.black,
//         selectedLabelStyle: TextStyle(fontSize: 12),
//         unselectedLabelStyle: TextStyle(fontSize: 12),
//         type: BottomNavigationBarType.fixed,
//       ),

//       // Text Theme
//       textTheme: const TextTheme(
//         bodyMedium: TextStyle(
//           color: Colors.black87,
//           fontSize: 16,
//         ),
//         titleLarge: TextStyle(
//           fontSize: 24,
//           fontWeight: FontWeight.bold,
//           color: Colors.orangeAccent,
//         ),
//       ),

//       // Card Theme
//       cardTheme: CardTheme(
//         color: Colors.white,
//         shadowColor: Colors.grey[200],
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//       ),

//       // Elevated Button Theme
//       elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.orange,
//           foregroundColor: Colors.white,
//           textStyle: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//           ),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//         ),
//       ),

//       // Input Decoration Theme
//       inputDecorationTheme: InputDecorationTheme(
//         filled: true,
//         fillColor: Colors.white,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide.none,
//         ),
//         hintStyle: const TextStyle(
//           color: Colors.grey,
//         ),
//       ),
//     );
//   }
// // }

// import 'package:flutter/material.dart';

// class AppTheme {
//   AppTheme._(); // Private constructor to prevent instantiation

//   static ThemeData getApplicationTheme({required bool isDark}) {
//     return ThemeData(
//       primaryColor: Colors.white,
//       fontFamily: 'Montserrat',
//       scaffoldBackgroundColor: Colors.white,

//       // AppBar Theme
//       appBarTheme: AppBarTheme(
//         backgroundColor: Colors.white,
//         elevation: 0, // Removes shadow
//         centerTitle: true,
//         titleTextStyle: const TextStyle(
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//           color: Colors.black,
//         ),
//       ),

//       // Bottom Navigation Bar Theme
//       bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//         backgroundColor: Colors.white,
//         selectedItemColor: Colors.black,
//         unselectedItemColor: Colors.grey,
//         selectedLabelStyle: TextStyle(fontSize: 12),
//         unselectedLabelStyle: TextStyle(fontSize: 12),
//         type: BottomNavigationBarType.fixed,
//       ),

//       // Text Theme
//       textTheme: const TextTheme(
//         bodyMedium: TextStyle(
//           color: Colors.black87,
//           fontSize: 16,
//         ),
//         titleLarge: TextStyle(
//           fontSize: 24,
//           fontWeight: FontWeight.bold,
//           color: Colors.white,
//         ),
//       ),

//       // Card Theme
//       cardTheme: CardTheme(
//         color: Colors.white,
//         shadowColor: Colors.grey[200],
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//       ),

//       // Elevated Button Theme
//       elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.white,
//           foregroundColor: Colors.black,
//           textStyle: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//           ),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//         ),
//       ),

//       // Input Decoration Theme
//       inputDecorationTheme: InputDecorationTheme(
//         filled: true,
//         fillColor: Colors.white,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide.none,
//         ),
//         hintStyle: const TextStyle(
//           color: Colors.grey,
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class AppTheme {
//   AppTheme._(); // Private constructor to prevent instantiation

//   static ThemeData getApplicationTheme({required bool isDark}) {
//     return ThemeData(
//       primaryColor: Colors.blue, // Set the primary color to blue
//       fontFamily: 'Montserrat',
//       scaffoldBackgroundColor: isDark ? Colors.black : Colors.white,

//       // AppBar Theme
//       appBarTheme: AppBarTheme(
//         backgroundColor: Colors.blue, // Blue AppBar background
//         elevation: 0, // Removes shadow
//         centerTitle: true,
//         titleTextStyle: const TextStyle(
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//           color: Colors.white, // White text on blue background
//         ),
//       ),

//       // Bottom Navigation Bar Theme
//       bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//         backgroundColor: Colors.blue, // Blue background for BottomNav
//         selectedItemColor: Colors.white, // White for selected item
//         unselectedItemColor: Colors.grey, // Grey for unselected item
//         selectedLabelStyle: TextStyle(fontSize: 12),
//         unselectedLabelStyle: TextStyle(fontSize: 12),
//         type: BottomNavigationBarType.fixed,
//       ),

//       // Text Theme
//       textTheme: TextTheme(
//         bodyMedium: TextStyle(
//           color:
//               isDark
//                   ? Colors.white
//                   : Colors.black87, // Adapt text color based on theme
//           fontSize: 16,
//         ),
//         titleLarge: TextStyle(
//           fontSize: 24,
//           fontWeight: FontWeight.bold,
//           color:
//               isDark
//                   ? Colors.white
//                   : Colors.blue, // Blue for title on light theme
//         ),
//       ),

//       // Card Theme
//       cardTheme: CardTheme(
//         color:
//             isDark
//                 ? Colors.grey[800]!
//                 : Colors.white, // Dark mode cards should be darker
//         shadowColor:
//             Colors.blueGrey, // Slight blue-grey shadow for a real estate feel
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       ),

//       // Elevated Button Theme
//       elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.blue, // Blue button
//           foregroundColor: Colors.white, // White text on button
//           textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//         ),
//       ),

//       // Input Decoration Theme
//       inputDecorationTheme: InputDecorationTheme(
//         filled: true,
//         fillColor: isDark ? Colors.grey[800]! : Colors.white,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide.none,
//         ),
//         hintStyle: const TextStyle(
//           color: Colors.blueGrey, // Lighter grey for hint text
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._(); // Private constructor to prevent instantiation

  static ThemeData getApplicationTheme({required bool isDark}) {
    return ThemeData(
      primaryColor: Colors.blue, // Set the primary color to blue
      fontFamily: 'Montserrat',
      scaffoldBackgroundColor: isDark ? Colors.black : Colors.white,

      // AppBar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blue, // Blue AppBar background
        elevation: 0, // Removes shadow
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white, // White text on blue background
        ),
      ),

      // Bottom Navigation Bar Theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.blue, // Blue background for BottomNav
        selectedItemColor: Colors.white, // White for selected item
        unselectedItemColor: Colors.grey, // Grey for unselected item
        selectedLabelStyle: const TextStyle(fontSize: 12),
        unselectedLabelStyle: const TextStyle(fontSize: 12),
        type: BottomNavigationBarType.fixed,
      ),

      // Text Theme
      textTheme: TextTheme(
        bodyMedium: TextStyle(
          color:
              isDark
                  ? Colors.white
                  : Colors.black87, // Adapt text color based on theme
          fontSize: 16,
        ),
        titleLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color:
              isDark
                  ? Colors.white
                  : Colors.blue, // Blue for title on light theme
        ),
      ),

      // Card Theme
      cardTheme: CardTheme(
        color:
            isDark
                ? Colors.blue[800]!
                : Colors.white, // Dark mode cards should be darker
        shadowColor:
            Colors.blueGrey, // Slight blue-grey shadow for a real estate feel
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),

      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue, // Blue button
          foregroundColor: Colors.white, // White text on button
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: isDark ? Colors.grey[800]! : Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        hintStyle: const TextStyle(
          color: Colors.blueGrey, // Lighter grey for hint text
        ),
      ),
    );
  }
}
