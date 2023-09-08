import 'dart:async';

import 'package:flutter/material.dart';
import 'package:slide_action/slide_action.dart';

// this class simulates purchase of the product
class PurchasePage extends StatefulWidget {
  const PurchasePage({super.key});

  @override
  State<PurchasePage> createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Purchase Page'),
      // ),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            const Text(
              'This page simulates the purchase process.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SlideAction(
                trackBuilder: (context, state) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text("Swipe to purchase"),
                    ),
                  );
                },
                thumbBuilder: (context, state) {
                  return Container(
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
                action: () {
                  // show dialog
                  debugPrint("Hello World");
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
