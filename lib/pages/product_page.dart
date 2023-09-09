import 'package:flutter/material.dart';
import 'package:tiktok_hackers/pages/add_review_page.dart';
import 'package:tiktok_hackers/pages/purchase_page.dart';
import 'package:tiktok_hackers/pages/shop_page.dart';
import 'package:video_player/video_player.dart';

class ProductPage extends StatefulWidget {
  String? newReview;
  final String productID;
  ProductPage({Key? key, required this.productID, this.newReview})
      : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
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

  bool liked = false;

  // List of review data
  final List<ReviewPost> reviewPosts = [
    ReviewPost(
        username: 'Sourick @sourick',
        content: 'Great product!',
        upvotes: 42,
        downvotes: 3,
        indentationLevel: 0),
    ReviewPost(
        username: 'JohnDoe @doeee',
        content: "You're capping",
        upvotes: 0,
        downvotes: 30,
        indentationLevel: 1),
    ReviewPost(
        username: 'Gabriel Seethor @gabrielseethor',
        content: 'Ya this product is great...',
        upvotes: 8,
        downvotes: 5,
        indentationLevel: 1),
    ReviewPost(
        username: 'Yu Ji @yuji',
        content: 'I love it!',
        upvotes: 20,
        downvotes: 1,
        indentationLevel: 0),
    ReviewPost(
        username: 'Ben @benjamin',
        content: "meh I don't think so",
        upvotes: 20,
        downvotes: 3,
        indentationLevel: 1),
    // Add more review posts as needed
  ];

  @override
  void initState() {
    super.initState();
    if (widget.newReview != null) {
      reviewPosts.insert(
          0,
          ReviewPost(
              username: 'TestUser @testuser',
              content: widget.newReview!,
              upvotes: 0,
              downvotes: 0,
              indentationLevel: 0));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.productID),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const ShopPage();
            }));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Product Image
            Image(
              image: getAssetImage(widget.productID),
              fit: BoxFit.fitWidth,
            ),
            // Product Title
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.productID,
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
                'Product description goes here. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            // Product Price
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  RichText(
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
                  Spacer(),
                  // heart button to like product
                  IconButton(
                    onPressed: () {
                      // Like product logic here
                      setState(() {
                        liked = !liked;
                      });
                    },
                    icon: Icon(liked ? Icons.favorite : Icons.favorite_border),
                    color: Colors.red,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Add to Cart logic here
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PurchasePage(productID: widget.productID);
                  }));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                child: const Text('Buy now'),
              ),
            ),
            // Additional Product Information
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Product information goes here. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            // add a horizontally scrolling video review section
            // Video Review Section Title
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Video Reviews',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            // Divider
            Divider(
              thickness: 1,
              height: 1,
              color: Colors.grey[300],
            ),
            VideoList(),
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return AddReviewPage(
                          productID: widget.productID,
                        );
                      }));
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
            for (ReviewPost reviewPost in reviewPosts)
              buildReviewPost(reviewPost),

            // buildReviewPost('Sourick @sourick', 'Great product!', 42, 3, 0),
            // buildReviewPost('JohnDoe @doeee', "You're capping", 0, 30, 1),
            // buildReviewPost('Gabriel Seethor @gabrielseethor',
            //     'Ya this product is great...', 8, 5, 1),
            // buildReviewPost('Yu Ji @yuji', 'I love it!', 20, 1, 0),
            // buildReviewPost('Ben @benjamin', 'meh I don\'t think so', 20, 3, 1),
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
  ReviewPost reviewPost,
) {
  return Card(
    margin: EdgeInsets.only(
      left: 8 +
          reviewPost.indentationLevel * 30.0, // Add indentation based on level
      top: 5,
      bottom: 5,
      right: 5,
    ),
    elevation: 1,
    child: Column(
      children: <Widget>[
        if (reviewPost.indentationLevel != 0)
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
            backgroundColor: Colors.grey.shade600,
            foregroundColor: Colors.white,
            child: Text(reviewPost.username[0]),
          ),
          title:
              Text(reviewPost.username, style: const TextStyle(fontSize: 15)),
          subtitle:
              Text(reviewPost.content, style: const TextStyle(fontSize: 16)),
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
              reviewPost.upvotes.toString(),
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
              '${reviewPost.downvotes}\t\t\t',
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

class VideoList extends StatelessWidget {
  // List of video thumbnail image file names in the assets/images directory
  final List<String> thumbnailImages = [
    'review_0.PNG',
    'review_1.PNG',
    'review_2.PNG',
    'review_3.PNG',
    // Add more thumbnail image file names as needed
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.225,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: thumbnailImages.length,
        itemBuilder: (context, index) {
          // Construct the asset path for the video thumbnail image
          String thumbnailAssetPath = 'assets/images/${thumbnailImages[index]}';

          return Container(
            height: 140,
            width: MediaQuery.of(context).size.width * 0.3,
            child: Card(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        thumbnailAssetPath,
                        fit: BoxFit.fitWidth, // Adjust the fit as needed
                        width: double.infinity,
                        height:
                            150, // Set the desired height for the thumbnails
                      ),
                      Positioned(
                        // mainAxisAlignment: MainAxisAlignment.end,
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        top: 45,
                        right: 30,
                        child: Icon(
                          Icons.play_arrow,
                          size: 60,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'user$index @user$index', // Customize user information as needed
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ReviewPost {
  final String username;
  final String content;
  final int upvotes;
  final int downvotes;
  final int indentationLevel;

  ReviewPost({
    required this.username,
    required this.content,
    required this.upvotes,
    required this.downvotes,
    required this.indentationLevel,
  });
}
