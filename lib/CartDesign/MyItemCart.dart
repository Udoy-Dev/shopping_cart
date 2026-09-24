import 'package:flutter/material.dart';

class CartItemCardUI extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onDelete;

  const CartItemCardUI({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color(0xFFE2E8F0), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Image Container
          Container(
            width: 80,
            height: 80,
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Color(0xFFF0F4F9),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.network(
              imageUrl,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Image.network(
                  'https://pngimg.com/uploads/headphones/headphones_PNG101980.png',
                  fit: BoxFit.contain,
                );
              },
            ),
          ),
          SizedBox(width: 14),

          // Details Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E2843),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),

                // Price
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E2843),
                  ),
                ),
                SizedBox(height: 8),

                // Bottom Row: Quantity Controller & Delete Icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Quantity Increment/Decrement Capsule
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                      decoration: BoxDecoration(
                        color: Color(0xFFF0F4F9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Decrement Button
                          InkWell(
                            onTap: onDecrement,
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.remove,
                                size: 16,
                                color: Color(0xFF1E2843),
                              ),
                            ),
                          ),

                          // Quantity Text
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              '$quantity',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1E2843),
                              ),
                            ),
                          ),

                          // Increment Button
                          InkWell(
                            onTap: onIncrement,
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.add,
                                size: 16,
                                color: Color(0xFF1E2843),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Delete Button
                    IconButton(
                      onPressed: onDelete,
                      constraints: BoxConstraints(),
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.delete_outline_rounded,
                        color: Color(0xFFFF4D4D),
                        size: 22,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}