// import 'package:flutter/material.dart';

// class FavoriteScreenView extends StatelessWidget {
//   const FavoriteScreenView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: Text(
//         'Favorite',
//         style: TextStyle(fontFamily: 'Montserrat Regular', fontSize: 20),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class FavoriteScreenView extends StatelessWidget {
  const FavoriteScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'My favorite',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Montserrat Bold',
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.black),
            onPressed: () {
              // Handle delete action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '0 estates',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Montserrat Regular',
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.8,
                ),
                itemCount: 3, // Replace with dynamic data count
                itemBuilder: (context, index) {
                  // Dummy data
                  final estates = [
                    {
                      'name': 'The Laurels Villa',
                      'location': 'Kathmandu',
                      'price': 'Rs3200000000',
                      'rating': '4.9',
                      'image': 'assets/images/house1.png'
                    },
                    {
                      'name': 'Wayside Modern House',
                      'location': 'Lalitpur',
                      'price': 'Rs3200000000',
                      'rating': '4.4',
                      'image': 'assets/images/house2.png'
                    },
                    {
                      'name': 'Wings Tower',
                      'location': 'Patan',
                      'price': 'Rs3200000000',
                      'rating': '4.9',
                      'image': 'assets/images/house3.png'
                    },
                  ];

                  final estate = estates[index];

                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey.shade100,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                              child: Image.asset(
                                estate['image']!,
                                height: 120,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 8,
                              right: 8,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: const Icon(
                                  Icons.favorite,
                                  color: Colors.green,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                estate['name']!,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Montserrat Bold',
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                estate['location']!,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Montserrat Regular',
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    estate['price']!,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Montserrat Bold',
                                      color: Colors.green,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                        size: 16,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        estate['rating']!,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'Montserrat Regular',
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
