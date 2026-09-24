import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/Model.dart';
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

          ],
        ),
      );
    },
  );
}

void deleteCartAlert(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.delete_outline_rounded,
              color: Color(0xFFFF4D4D),
              size: 80,
            ),
            SizedBox(height: 10),
            Text(
              "Clear Cart",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text("Are you sure you want to delete all items?"),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                context.read<ProductModel>().clearCart();
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFF4D4D),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: Size(double.infinity, 45),
              ),
              child: Text(
                "Clear",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.grey[700]!),
                ),
                minimumSize: Size(double.infinity, 45),
              ),
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.grey[700]),
              ),
            ),
          ],
        ),
      );
    },
  );
}
