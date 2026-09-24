import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/UI/SplashScreen.dart';
import 'Models/Model.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => ProductModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );

  }
}
