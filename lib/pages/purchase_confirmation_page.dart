// this page loads the purchase confirmation page.
import 'package:flutter/material.dart';
import 'package:tiktok_hackers/pages/home_page.dart';
import 'package:tiktok_hackers/pages/shop_page.dart';

class PurchaseConfirmationPage extends StatefulWidget {
  final String productID;
  const PurchaseConfirmationPage({super.key, required this.productID});

  @override
  State<PurchaseConfirmationPage> createState() =>
      _PurchaseConfirmationPageState();
}

class _PurchaseConfirmationPageState extends State<PurchaseConfirmationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        // automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const ShopPage();
            }));
          },
        ),
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          const OrderPlacedWidget(),
          const SizedBox(height: 8),
          Container(
            height: MediaQuery.of(context).size.height * 0.56,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    // only top and bottom borders
                    border: Border(
                      top: BorderSide(width: 0.5, color: Colors.grey.shade400),
                      bottom:
                          BorderSide(width: 0.5, color: Colors.grey.shade400),
                    ),
                    color: Colors.white, // Background color
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ShopPage(
                          newOrder:
                              "TestUser just bought a ${widget.productID}!",
                        );
                      }));
                      // show snack bar
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Order shared! 100 coins awarded.',
                            textAlign: TextAlign.center,
                          ),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    },
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          " Share with your friends!",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        Spacer(),
                        Icon(
                          Icons.chevron_right,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 0.5, color: Colors.grey.shade400),
                      bottom:
                          BorderSide(width: 0.5, color: Colors.grey.shade400),
                    ),
                    color: Colors.white, // Background color
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const ShopPage();
                      }));
                    },
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          " Skip sharing",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        Spacer(),
                        Icon(
                          Icons.chevron_right,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OrderPlacedWidget extends StatelessWidget {
  const OrderPlacedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.28,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Icon(Icons.check_circle, color: Colors.green, size: 70),
            const SizedBox(height: 10),
            const Text(
              "Order placed",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Your order will be shipped to: John Doe . (+65) 1234 9834",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.35,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade300, // Border color
                      width: 2.0, // Border width
                    ),
                    color: Colors.white, // Background color
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Change address",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.35,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade300, // Border color
                      width: 2.0, // Border width
                    ),
                    color: Colors.white, // Background color
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "View order",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
