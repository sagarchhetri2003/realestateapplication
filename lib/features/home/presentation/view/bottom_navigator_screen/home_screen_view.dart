import 'package:flutter/material.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Location and Profile
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.location_on,
                              color: Color.fromARGB(255, 98, 176, 240)),
                          SizedBox(width: 8),
                          Text(
                            'Butwal, Nepal',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/profileimg.JPG'),
                      radius: 20,
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Greeting Text
                const Text(
                  'Hey, Sagar!\nLet\'s start exploring',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),

                // Search Bar
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(30), // Oval shape
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey),
                      SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search House, Apartment, etc',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Icon(Icons.mic, color: Colors.grey),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Categories
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildCategoryChip('All', isSelected: true),
                      _buildCategoryChip('House'),
                      _buildCategoryChip('Apartment'),
                      _buildCategoryChip('Villa'),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Featured Estates
                _buildSectionTitle('Featured Estates', onTap: () {}),
                const SizedBox(height: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildFeaturedEstateCard(
                        image: 'assets/images/house1.png',
                        title: 'Sky Dandelions Apartment',
                        price: 'Rs32000000',
                      ),
                      _buildFeaturedEstateCard(
                        image: 'assets/images/house2.png',
                        title: 'Sunny Modern House',
                        price: 'Rs32000000',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Top Locations
                _buildSectionTitle('Top Locations', onTap: () {}),
                const SizedBox(height: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildCircleItem(
                          'Kathmandu', 'assets/icons/lalitpur.png'),
                      _buildCircleItem('Dharan', 'assets/icons/lalitpur.png'),
                      _buildCircleItem('Lalitpur', 'assets/icons/lalitpur.png'),
                    ],
                  ),
                ),

                // Top Estate Agents
                _buildSectionTitle('Top Estate Agent', onTap: () {}),
                const SizedBox(height: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildCircleItem(
                          'Narmaya', 'assets/images/profileimg.JPG'),
                      _buildCircleItem('Rohan', 'assets/images/profileimg.JPG'),
                      _buildCircleItem('Uncle', 'assets/images/profileimg.JPG'),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Explore Nearby Estates
                _buildSectionTitle('Explore Nearby Estates', onTap: () {}),
                const SizedBox(height: 16),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    final estates = [
                      {
                        'name': 'Wings Tower',
                        'price': 'Rs32000000',
                        'image': 'assets/images/house1.png',
                      },
                      {
                        'name': 'Mill Sper House',
                        'price': 'Rs2332222',
                        'image': 'assets/images/house2.png',
                      },
                      {
                        'name': 'Bungalow House',
                        'price': 'Rs23242424',
                        'image': 'assets/images/house3.png',
                      },
                      {
                        'name': 'Sky Dandelions',
                        'price': 'Rs23232323',
                        'image': 'assets/images/house4.png',
                      },
                    ];
                    final estate = estates[index];
                    return _buildNearbyEstateCard(
                      image: estate['image']!,
                      title: estate['name']!,
                      price: estate['price']!,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label, {bool isSelected = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Chip(
        backgroundColor: isSelected
            ? const Color.fromARGB(255, 98, 176, 240)
            : Colors.grey.shade200,
        label: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 14,
            ),
          ),
        ),
        shape: const StadiumBorder(), // Makes it oval
      ),
    );
  }

  Widget _buildSectionTitle(String title, {required VoidCallback onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: onTap,
          child: const Text(
            'View all',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }

  Widget _buildFeaturedEstateCard(
      {required String image, required String title, required String price}) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey.shade100,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Image.asset(
                image,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    price,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircleItem(String title, String image) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(image),
            radius: 28,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildNearbyEstateCard({
    required String image,
    required String title,
    required String price,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.asset(
              image,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  price,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
