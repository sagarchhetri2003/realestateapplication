import 'package:flutter/material.dart';

class LocationScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {},
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              shape: BoxShape.circle,
            ),
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Skip",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Text(
              "Add your location",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "You can edit this later on your account setting.",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            SizedBox(height: 16),
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
                image: DecorationImage(
                  image: AssetImage('assets/images/location.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.grey),
                        SizedBox(width: 8),
                        Text(
                          "Location detail",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                  ],
                ),
              ),
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {},
              child: Text(
                "Next",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
