import 'package:flutter/material.dart';

class Drink extends StatelessWidget {
  const Drink({
    super.key,
    required this.image,
    required this.name,
    required this.title,
    required this.price,
  });

  final String image;
  final String name;
  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          /// Card background
          Container(
            height: 140, // Increased from 120
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 120, right: 20), // wider for bigger image
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// Texts
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        price,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),

                  /// Arrow icon
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black12),
                    ),
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black54,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// Image with shadow
          Positioned(
            top: -40, // Moved slightly up for bigger image
            left: -9,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: 80,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade500,
                        blurRadius: 30,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  image,
                  width: 150, // Increased width
                  height: 150, // Increased height
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
