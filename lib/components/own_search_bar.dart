import 'package:flutter/material.dart';

class OwnSearchBar extends StatelessWidget {
  const OwnSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // search bar
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white, // Set the background color to white
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.all(0),
                hintText: 'multi usb',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: TextButton(
                  child: const Text(
                    "Search   ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: 13),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ),
        // cart buttomn
        const IconButton(
          icon: Icon(Icons.shopping_cart_outlined, color: Colors.black),
          tooltip: 'Cart',
          onPressed: null,
        ),
      ],
    );
  }
}
