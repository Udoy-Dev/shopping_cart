import 'package:flutter/material.dart';

class ProductCardUI extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String price;
  final VoidCallback onTap;

  const ProductCardUI({super.key, required this.imageUrl, required this.title, required this.subtitle, required this.price, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 15,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 85,
            height: 85,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xFFF3F6FA),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.network(
              imageUrl,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E2843),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),

                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF8C98A8),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 12),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E2843),
                      ),
                    ),

                    ElevatedButton(
                      onPressed: onTap,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF0066FF),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        "Add to Cart",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
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