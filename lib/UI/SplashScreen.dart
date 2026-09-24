import 'package:flutter/material.dart';
import 'package:shopping_cart/UI/ProductList.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    moveNextScreen();
  }

  Future<void>moveNextScreen() async{
    await Future.delayed(Duration(seconds: 2));
    Navigator.push( context, MaterialPageRoute(builder: (context)=>ProductList()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1D61ED),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 20),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.shopping_bag_rounded,
                    size: 150,
                    color: Colors.white,
                  ),
                  SizedBox(height: 20),

                  Text(
                    "ShopEase",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(height: 12),

                  // Subtitles
                  Text(
                    "Better Products\nBetter Life",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      height: 1.3,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),

              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.85),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  "Your Favorite Products\nAre Just a Tap Away",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1D61ED),
                    height: 1.3,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}