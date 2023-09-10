import 'package:flutter/material.dart';
import 'package:slide_action/slide_action.dart';
import 'package:strix_tok/pages/purchase_confirmation_page.dart';

// this class simulates purchase of the product
class PurchasePage extends StatefulWidget {
  final String productID;
  const PurchasePage({super.key, required this.productID});

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
              'This page simulates the payment process.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SlideAction(
                thumbWidth: 90,
                trackBuilder: (context, state) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text("Swipe to purchase"),
                    ),
                  );
                },
                thumbBuilder: (context, state) {
                  return Container(
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade600,
                      borderRadius: BorderRadius.circular(30),
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
                  debugPrint("Hello World");
                  // show dialog
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PurchaseConfirmationPage(
                        productID: widget.productID);
                  }));
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
