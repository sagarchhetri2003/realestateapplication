import 'package:flutter/material.dart';

class FavoriteScreenView extends StatelessWidget {
  const FavoriteScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Favorite',
        style: TextStyle(fontFamily: 'Montserrat Regular', fontSize: 20),
      ),
    );
  }
}
