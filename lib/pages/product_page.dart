import 'package:flutter/material.dart';
import 'package:tiktok_hackers/pages/purchase_page.dart';

class ProductPage extends StatelessWidget {
  final String productID;
  ProductPage({Key? key, required this.productID}) : super(key: key);

  final List<AssetImage> images = [
    const AssetImage('assets/images/clock.jpg'),
    const AssetImage('assets/images/headphones.jpg'),
    const AssetImage('assets/images/polaroid.jpg'),
    const AssetImage('assets/images/dice.jpeg'),
    const AssetImage('assets/images/toaster.jpeg'),
    const AssetImage('assets/images/measure.jpeg'),
  ];

  final List<String> productLabel = [
    'Clock',
    'Headphones',
    'Polaroid',
    'Dice',
    'Toaster',
    'Measure',
  ];

  AssetImage getAssetImage(String productID) {
    switch (productID) {
      case 'Clock':
        return images[0];
      case 'Headphones':
        return images[1];
      case 'Polaroid':
        return images[2];
      case 'Dice':
        return images[3];
      case 'Toaster':
        return images[4];
      case 'Measuring Tape':
        return images[5];
      default:
        return images[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productID),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Product Image
            Image(
              image: getAssetImage(productID),
              fit: BoxFit.fitWidth,
            ),
            // Product Title
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                productID,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Product Description
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Product description goes here. This is a sample product description that can be quite long and informative.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            // Product Price
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: RichText(
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: '\$99.99',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        decoration:
                            TextDecoration.lineThrough, // Add strikethrough
                        color: Colors.grey, // Color for the strikethrough
                      ),
                    ),
                    TextSpan(
                      text: '  \$79.99', // Add the lower price
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Add to Cart Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Add to Cart logic here
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const PurchasePage();
                  }));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                child: const Text('Buy with coupon'),
              ),
            ),
            // Additional Product Information
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Additional product information or specifications can go here.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            // Divider
            Divider(
              thickness: 1,
              height: 1,
              color: Colors.grey[300],
            ),
            // Review Section Title
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Reviews',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // add review button
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Add review logic here
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.grey.shade400),
                    ),
                    child: const Text('+  Add Review'),
                  ),
                ),
              ],
            ),
            // Review Posts (Sample)
            buildReviewPost('Sourick @sourick', 'Great product!', 42, 3, 0),
            buildReviewPost('JohnDoe @doeee', "You're capping", 0, 30, 1),
            buildReviewPost('Gabriel Seethor @gabrielseethor',
                'Ya this product is great...', 8, 5, 1),
            buildReviewPost('Yu Ji @yuji', 'I love it!', 20, 1, 0),
            buildReviewPost('Ben @benjamin', 'meh I don\'t think so', 20, 3, 1),
            // Add more review posts as needed
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}

Widget buildReviewPost(
  String username,
  String content,
  int upvotes,
  int downvotes,
  int indentationLevel,
) {
  return Card(
    margin: EdgeInsets.only(
      left: 8 + indentationLevel * 30.0, // Add indentation based on level
      top: 5,
      bottom: 5,
      right: 5,
    ),
    elevation: 1,
    child: Column(
      children: <Widget>[
        if (indentationLevel != 0)
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "\tIn reply to",
                  textAlign: TextAlign.start,
                ),
              ),
              // arrow point to right then up
              Icon(
                Icons.arrow_upward,
                size: 10,
              ),
            ],
          ),
        ListTile(
          leading: CircleAvatar(
            child: Text(username[0]),
            backgroundColor: Colors.grey.shade600,
            foregroundColor: Colors.white,
          ),
          title: Text(username, style: const TextStyle(fontSize: 15)),
          subtitle: Text(content, style: const TextStyle(fontSize: 16)),
        ),
        ButtonBar(
          alignment: MainAxisAlignment.end,
          children: <Widget>[
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                // Upvote logic
              },
              icon: const Icon(Icons.arrow_upward),
              color: Colors.blue,
            ),
            Text(
              upvotes.toString(),
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                // Downvote logic
              },
              icon: const Icon(Icons.arrow_downward),
              color: Colors.red,
            ),
            Text(
              '$downvotes\t\t\t',
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
