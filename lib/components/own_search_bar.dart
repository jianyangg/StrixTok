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
        IconButton(
          icon: Icon(Icons.monetization_on, color: Colors.orange[600]),
          tooltip: 'Earn Money',
          iconSize: 28,
          onPressed: () {
            // show dialog saying you have how much TikTok coins
            // and how much you can earn
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.white,
                  content: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(height: 20),
                      Icon(
                        Icons.monetization_on,
                        color: Colors.orange,
                        size: 70,
                      ),
                      SizedBox(height: 30),
                      Text(
                        'You have 1000 TikTok coins!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'You also have 500 TikTok coins pending approval once your video reviews get approved.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'OK',
                        style: TextStyle(
                          color: Colors.orange[400],
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
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
