import 'package:flutter/material.dart';
import 'package:realestateapplication/features/home/presentation/view/bottom_navigator_screen/Search_screen_view.dart';
import 'package:realestateapplication/features/home/presentation/view/bottom_navigator_screen/favorite_screen_view.dart';
import 'package:realestateapplication/features/home/presentation/view/bottom_navigator_screen/home_screen_view.dart';
import 'package:realestateapplication/features/home/presentation/view/bottom_navigator_screen/profile_screen_view.dart';

class DashboardScreenView extends StatefulWidget {
  const DashboardScreenView({super.key});

  @override
  State<DashboardScreenView> createState() => _DashboardScreenViewState();
}

class _DashboardScreenViewState extends State<DashboardScreenView> {
  int _selectedIndex = 0;

  // Define the list of screens
  final List<Widget> _lstBottomScreen = [
    const HomeScreenView(),
    const SearchScreenView(),
    const FavoriteScreenView(),
    const ProfileScreenView(),
  ];

  // Define the list of titles for the AppBar
  final List<String> _appBarTitles = [
    'Home',
    'Search',
    'Favorite',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(_appBarTitles[_selectedIndex]), // Update title dynamically
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: _lstBottomScreen[_selectedIndex], // Show selected screen
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index; // Update the selected index
          });
        },
      ),
    );
  }
}
