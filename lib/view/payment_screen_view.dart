import 'package:flutter/material.dart';

class PaymentScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(8),
            backgroundColor: Colors.grey.shade200,
          ),
          onPressed: () {
            Navigator.pop(context); // Destroy the current page and go back
          },
          child: Icon(Icons.arrow_back, color: Colors.black, size: 20),
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(8),
              backgroundColor: Colors.grey.shade200,
            ),
            onPressed: () {
              Navigator.pop(context); // Destroy the current page and skip
            },
            child: Text(
              "Skip",
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
          ),
          SizedBox(width: 8),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32),
            Text(
              "Add your payment method",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "You can edit this later on your account setting.",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    // No hover effect anymore, just highlight selected
                  },
                  child: PaymentOptionWidget(
                    assetPath: 'assets/icons/esewa.png',
                    isSelected: true, // Highlight eSewa
                  ),
                ),
                PaymentOptionWidget(
                  assetPath: 'assets/icons/khalti.png',
                  isSelected: false,
                ),
                PaymentOptionWidget(
                  assetPath: 'assets/icons/visa.png',
                  isSelected: false,
                ),
              ],
            ),
            SizedBox(height: 32),
            TextField(
              decoration: InputDecoration(
                labelText: "Esewa ID",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 32),
            TextField(
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: Colors.blue,
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
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentOptionWidget extends StatelessWidget {
  final String assetPath;
  final bool isSelected;

  PaymentOptionWidget({required this.assetPath, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? Colors.green : Colors.grey.shade300,
          width: isSelected ? 2 : 1,
        ),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: Colors.green.withOpacity(0.3),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ]
            : [],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          assetPath,
          // You can apply a bold style to the icon or adjust the visual elements here
        ),
      ),
    );
  }
}
