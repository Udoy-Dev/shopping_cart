import 'package:flutter/material.dart';

import '../UI/MyCart.dart';

void showAlertDialogAdd(BuildContext context, String title) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Column(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.green,
              child: Icon(Icons.check, size: 30, color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              "Added to cart",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "${title}\nhas been added your cart",
              style: TextStyle(fontSize: 14,color: Colors.grey[700]),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyCart()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: Size(double.infinity, 45),
              ),
              child: Text(
                "Continue Shopping",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: Colors.white),
              )
            ),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[200],
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(double.infinity, 45),
                ),
                child: Text(
                  "Product List",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: Colors.black),
                )
            ),
          ],
        ),
      );
    },
  );
}
