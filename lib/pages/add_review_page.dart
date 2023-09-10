import 'package:flutter/material.dart';
import 'package:strix_tok/pages/product_page.dart';
import 'package:strix_tok/pages/shop_page.dart';

class AddReviewPage extends StatefulWidget {
  final String productID;
  const AddReviewPage({super.key, required this.productID});

  @override
  State<AddReviewPage> createState() => _AddReviewPageState();
}

class _AddReviewPageState extends State<AddReviewPage> {
  TextEditingController _reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          title: const Text(
            'Add Review',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          children: [
            // Show green checkmark with verified purchase details.
            // then standard add review form
            // Verified Purchase
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Verified Purchase',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // Review Form
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _reviewController,
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                  hintText: 'Write your review here',
                  iconColor: Colors.black,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                maxLines: 10,
              ),
            ),
            // Submit Button
            Row(
              children: [
                const Spacer(),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.grey),
                  ),
                  onPressed: () {
                    // simulate adding of review to feed.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content:
                            Text('Thanks for your review! 50 coins awarded.'),
                      ),
                    );
                    // show snack bar
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductPage(
                                  productID: widget.productID,
                                  newReview: _reviewController.text,
                                )));
                    // Navigator.pop(context);
                    TextEditingController().clear();
                  },
                  child: const Text('Submit'),
                ),
                const SizedBox(
                  width: 10,
                )
              ],
            ),
          ],
        ));
  }
}
