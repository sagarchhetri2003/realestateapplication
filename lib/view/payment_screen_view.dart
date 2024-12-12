import 'package:flutter/material.dart';

class PaymentScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Skip",
              style: TextStyle(color: Colors.grey, fontSize: 16),
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
              "Add your payment method",
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PaymentOptionWidget(assetPath: 'assets/icons/esewa.png'),
                PaymentOptionWidget(assetPath: 'assets/icons/khalti.png'),
                PaymentOptionWidget(assetPath: 'assets/icons/visa.png'),
              ],
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: "Esewa ID",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
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

class PaymentOptionWidget extends StatelessWidget {
  final String assetPath;

  PaymentOptionWidget({required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(assetPath), // Replace with your payment method logos
      ),
    );
  }
}
