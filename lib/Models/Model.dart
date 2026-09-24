import 'package:flutter/material.dart';

class ProductModel extends ChangeNotifier {

  final List<String> _categories = [
    "All",
    "Electronics",
    "Fashion",
    "Home",
    "Beauty",
    "Sports",
    "Books"
  ];
  get categories => _categories;
  int _bottomNavIndex = 0;
  int get bottomNavIndex => _bottomNavIndex;

  void setBottomNavIndex(int index) {
    _bottomNavIndex = index;
    notifyListeners();
  }

  final List<Map<String, dynamic>> _products = [
    {
      "title": "Wireless Headphones",
      "subtitle": "High sound quality",
      "price": "৳ 1,500",
      "imageUrl": "https://pngimg.com/uploads/headphones/headphones_PNG101980.png",
      "quantity": 1,
    },
    {
      "title": "Smart Watch",
      "subtitle": "Fitness & Health Tracker",
      "price": "৳ 2,500",
      "imageUrl": "https://pngimg.com/uploads/smart_watch/smart_watch_PNG14.png",
      "quantity": 1,
    },
    {
      "title": "Backpack",
      "subtitle": "Travel & College",
      "price": "৳ 1,200",
      "imageUrl": "https://pngimg.com/uploads/backpack/backpack_PNG6328.png",
      "quantity": 1,
    },
    {
      "title": "Running Shoes",
      "subtitle": "Comfortable & Stylish",
      "price": "৳ 2,800",
      "imageUrl": "https://pngimg.com/uploads/running_shoes/running_shoes_PNG5817.png",
      "quantity": 1,
    },
    {
      "title": "Water Bottle",
      "subtitle": "Stay Hydrated",
      "price": "৳ 500",
      "imageUrl": "https://pngimg.com/uploads/water_bottle/water_bottle_PNG98822.png",
      "quantity": 1,
    },
    {
      "title": "Bluetooth Speaker",
      "subtitle": "Powerful Sound",
      "price": "৳ 1,800",
      "imageUrl": "https://pngimg.com/uploads/wireless_speaker/wireless_speaker_PNG36.png",
      "quantity": 1,
    },
    {
      "title": "Power Bank",
      "subtitle": "10000mAh Fast Charge",
      "price": "৳ 1,400",
      "imageUrl": "https://pngimg.com/uploads/powerbank/powerbank_PNG20.png",
      "quantity": 1,
    },
    {
      "title": "Wireless Mouse",
      "subtitle": "Ergonomic Design",
      "price": "৳ 850",
      "imageUrl": "https://pngimg.com/uploads/computer_mouse/computer_mouse_PNG7685.png",
      "quantity": 1,
    },
    {
      "title": "Gaming Keyboard",
      "subtitle": "RGB Mechanical",
      "price": "৳ 2,200",
      "imageUrl": "https://pngimg.com/uploads/keyboard/keyboard_PNG101835.png",
      "quantity": 1,
    },
    {
      "title": "Sunglasses",
      "subtitle": "UV400 Protection",
      "price": "৳ 950",
      "imageUrl": "https://pngimg.com/uploads/sunglasses/sunglasses_PNG27.png",
      "quantity": 1,
    }
  ];
  List<Map<String, dynamic>> get products => _products;


  final List<Map<String, dynamic>> _cart = [];
  List<Map<String, dynamic>> get cart => _cart;

  void addToCart(Map<String, dynamic> product) {
    int existingIndex = _cart.indexWhere((element) => element['title'] == product['title']);
    if (existingIndex != -1) {
      _cart[existingIndex]['quantity'] = (_cart[existingIndex]['quantity'] as int) + 1;
    } else {
      Map<String, dynamic> newItem = Map.from(product);
      newItem['quantity'] = 1;
      _cart.add(newItem);
    }
    notifyListeners();
  }

  void increment(int index) {
    if (index >= 0 && index < _cart.length) {
      int currentQty = (_cart[index]['quantity'] as int?) ?? 1;
      _cart[index]['quantity'] = currentQty + 1;
      notifyListeners();
    }
  }

  void decrement(int index) {
    if (index >= 0 && index < _cart.length) {
      int currentQty = (_cart[index]['quantity'] as int?) ?? 1;
      if (currentQty > 1) {
        _cart[index]['quantity'] = currentQty - 1;
        notifyListeners();
      }
    }
  }

  void removeItem(int index) {
    if (index >= 0 && index < _cart.length) {
      _cart.removeAt(index);
      notifyListeners();
    }
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }


  double get subtotalPrice {
    double total = 0.0;
    for (var item in _cart) {
      String cleanedPrice = item['price'].toString().replaceAll(RegExp(r'[^0-9.]'), '');
      double price = double.tryParse(cleanedPrice) ?? 0.0;
      int quantity = (item['quantity'] as int?) ?? 1;
      total += price * quantity;
    }
    return total;
  }

  double get discountAmount {
    return subtotalPrice * 0.10;
  }

  double get totalPriceWithDiscount {
    return subtotalPrice - discountAmount;
  }


  String getFormattedSubtotal() => '৳ ${subtotalPrice.toStringAsFixed(2)}';
  String getFormattedDiscount() => '-৳ ${discountAmount.toStringAsFixed(2)}';
  String getFormattedTotal() => '৳ ${totalPriceWithDiscount.toStringAsFixed(2)}';



}