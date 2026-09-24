import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/CartDesign/ProductListCart.dart';
import 'package:shopping_cart/Models/Model.dart';

import '../Style/Style.dart';
import 'MyCart.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: Text(
          "Product List",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyCart()));
              },
              icon: Icon(Icons.shopping_cart, size: 30),
            ),
          ),
        ],
      ),

      body: Column(
        children: [
          Expanded(
            child: Consumer<ProductModel>(
              builder: (context, productModel, child) {
                return ListView.builder(
                  itemCount: productModel.products.length,
                  itemBuilder: (context, index) {
                    final imageUrl = productModel.products[index]["imageUrl"]!;
                    final title = productModel.products[index]["title"]!;
                    final subtitle = productModel.products[index]["subtitle"]!;
                    final price = productModel.products[index]["price"]!;
                    return ProductCardUI(
                      imageUrl: imageUrl,
                      title: title,
                      subtitle: subtitle,
                      price: price,
                      onTap: () {
                        showAlertDialogAdd(context,title);
                        Provider.of<ProductModel>(context, listen: false).addToCart(
                          {
                            "imageUrl": imageUrl,
                            "title": title,
                            "subtitle": subtitle,
                            "price": price,
                          }
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),

      bottomNavigationBar: Consumer<ProductModel>(
        builder: (context, provider, child) {
          return BottomNavigationBar(
            currentIndex: provider.bottomNavIndex,
            onTap: (index) {
              if(index==0){

              }else if(index==1){

              }else if(index==2){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyCart()));
                provider.setBottomNavIndex(index);
              }else if(index==3){

              }
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Color(0xFF0066FF),
            backgroundColor: Colors.white,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline),
                activeIcon: Icon(Icons.favorite),
                label: "Favorite",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined),
                activeIcon: Icon(Icons.shopping_cart),
                label: "Cart",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                activeIcon: Icon(Icons.person),
                label: "Profile",
              ),
            ],
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>MyCart()));
        },
        backgroundColor: Colors.green,
        child: Icon(Icons.shopping_bag, size: 30,color: Colors.white,),
      ),


    );
  }
}
