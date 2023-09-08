import 'package:flutter/material.dart';
import 'package:tiktok_hackers/pages/film_video_page.dart';
import 'package:tiktok_hackers/pages/product_page.dart';

class ProductReviewPage extends StatelessWidget {
  final String productID;
  const ProductReviewPage({Key? key, required this.productID});

  // function to return the image of the product
  AssetImage getProductImage(String productID) {
    switch (productID) {
      case "alarm_clock":
        return const AssetImage('assets/images/clock.jpg');
      case "dice_in_dice":
        return const AssetImage('assets/images/dice.jpeg');
      case "headphones":
        return const AssetImage('assets/images/headphones.jpg');
      case "measuring_tape":
        return const AssetImage('assets/images/measure.jpeg');
      case "kodak_polaroid_camera":
        return const AssetImage('assets/images/polaroid.jpg');
      case "smeg_toaster":
        return const AssetImage('assets/images/toaster.jpeg');
      default:
        return const AssetImage('assets/images/clock.jpg');
    }
  }

  String getProductName(String productID) {
    switch (productID) {
      case "alarm_clock":
        return "Alarm Clock";
      case "dice_in_dice":
        return "Dice in Dice";
      case "headphones":
        return "Sony Headphones";
      case "measuring_tape":
        return "Measuring Tape";
      case "kodak_polaroid_camera":
        return "Kodak Polaroid Camera";
      case "smeg_toaster":
        return "Smeg Toaster";
      default:
        return "Alarm Clock";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // have an image of the product, then to its right is the description
          // then below is the option to do the review
          const Divider(
            thickness: 1,
            height: 1,
          ),
          const SizedBox(height: 30),
          ListTile(
            contentPadding:
                const EdgeInsets.all(16.0), // Adjust padding as needed
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                Transform.scale(
                  scale:
                      2.0, // Adjust the scale factor as needed to make it larger
                  child: Container(
                    width:
                        50, // Adjust width as needed for the original image size
                    height:
                        50, // Adjust height as needed for the original image size
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image(
                        image: getProductImage(productID),
                        fit: BoxFit.cover, // Crop and cover the square
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      getProductName(productID),
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Purchased from EverydayItemsStore',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Container(
            height: 4,
            color: Colors.grey.shade300,
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'How\'s the product?',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.5,
                    ),
                  ),
                  Spacer(),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  // only have borders top and bottom
                  border: Border(
                    top: BorderSide(width: 0.5, color: Colors.grey.shade400),
                    bottom: BorderSide(width: 0.5, color: Colors.grey.shade400),
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const FilmVideoPage(reviewType: "video");
                    }));
                  },
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(
                        Colors.grey.shade200), // Change overlay color
                  ),
                  child: const Row(
                    children: [
                      Text(
                        "Share a video review on TikTok!",
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.black),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const Spacer(),
                  // oval conatiner with text inside
                  Container(
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        "500 coins",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  // only have borders top and bottom
                  border: Border(
                    top: BorderSide(width: 0.5, color: Colors.grey.shade400),
                    bottom: BorderSide(width: 0.5, color: Colors.grey.shade400),
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const FilmVideoPage(reviewType: "video");
                    }));
                  },
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(
                        Colors.grey.shade200), // Change overlay color
                  ),
                  child: const Row(
                    children: [
                      Text(
                        "Share a video review to your followers!",
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.black),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const Spacer(),
                  Container(
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        "300 coins",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  // only have borders top and bottom
                  border: Border(
                    top: BorderSide(width: 0.5, color: Colors.grey.shade400),
                    bottom: BorderSide(width: 0.5, color: Colors.grey.shade400),
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ProductPage(productID: productID);
                    }));
                  },
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(
                        Colors.grey.shade200), // Change overlay color
                  ),
                  child: const Row(
                    children: [
                      Text(
                        "Share a text review on tiktok!",
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.black),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const Spacer(),
                  Container(
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.yellow.shade600,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        "100 coins",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}
