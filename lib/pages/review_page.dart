import 'package:flutter/material.dart';
import 'package:tiktok_hackers/components/bottom_nav_bar.dart';
import 'package:tiktok_hackers/pages/product_review_page.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text("Review Page"),
        elevation: 0,
        automaticallyImplyLeading: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: const ProductsWidget(),
      // bottomNavigationBar: const BottomNavBar(currentIndex: 3),
    );
  }
}

class ProductsWidget extends StatelessWidget {
  const ProductsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate(
            [
              const Divider(
                thickness: 0.5,
                height: 1,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ProductReviewPage(productID: "alarm_clock");
                  }));
                },
                contentPadding:
                    const EdgeInsets.all(16.0), // Adjust padding as needed
                leading: Container(
                  width: 63, // Adjust width as needed
                  height: 63, // Adjust height as needed
                  decoration: BoxDecoration(
                      color: Colors.blue, // Change color as needed
                      borderRadius: BorderRadius.circular(8.0),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/clock.jpg"),
                        fit: BoxFit.cover,
                      ) // Add rounded corners if desired
                      ),
                ),
                title: const Text(
                  "Alarm Clock",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text("Delivered 8 September"),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              const Divider(
                height: 1,
                thickness: 0.5,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ProductReviewPage(productID: "dice_in_dice");
                  }));
                },
                contentPadding:
                    const EdgeInsets.all(16.0), // Adjust padding as needed
                leading: Container(
                  width: 63, // Adjust width as needed
                  height: 63, // Adjust height as needed
                  decoration: BoxDecoration(
                      color: Colors.blue, // Change color as needed
                      borderRadius: BorderRadius.circular(8.0),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/dice.jpeg"),
                        fit: BoxFit.cover,
                      ) // Add rounded corners if desired
                      ),
                ),
                title: const Text(
                  "Dice in dice",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text("Delivered 4 September"),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              const Divider(
                height: 1,
                thickness: 0.5,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ProductReviewPage(productID: "headphones");
                  }));
                },
                contentPadding:
                    const EdgeInsets.all(16.0), // Adjust padding as needed
                leading: Container(
                  width: 63, // Adjust width as needed
                  height: 63, // Adjust height as needed
                  decoration: BoxDecoration(
                      color: Colors.blue, // Change color as needed
                      borderRadius: BorderRadius.circular(8.0),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/headphones.jpg"),
                        fit: BoxFit.cover,
                      ) // Add rounded corners if desired
                      ),
                ),
                title: const Text(
                  "Sony Headphones",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text("Delivered 2 September"),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              const Divider(
                height: 1,
                thickness: 0.5,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ProductReviewPage(productID: "measuring_tape");
                  }));
                },
                contentPadding:
                    const EdgeInsets.all(16.0), // Adjust padding as needed
                leading: Container(
                  width: 63, // Adjust width as needed
                  height: 63, // Adjust height as needed
                  decoration: BoxDecoration(
                      color: Colors.blue, // Change color as needed
                      borderRadius: BorderRadius.circular(8.0),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/measure.jpeg"),
                        fit: BoxFit.cover,
                      ) // Add rounded corners if desired
                      ),
                ),
                title: const Text(
                  "Measuring Tape",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text("Delivered 1 September"),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              const Divider(
                height: 1,
                thickness: 0.5,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ProductReviewPage(
                        productID: "kodak_polaroid_camera");
                  }));
                },
                contentPadding:
                    const EdgeInsets.all(16.0), // Adjust padding as needed
                leading: Container(
                  width: 63, // Adjust width as needed
                  height: 63, // Adjust height as needed
                  decoration: BoxDecoration(
                      color: Colors.blue, // Change color as needed
                      borderRadius: BorderRadius.circular(8.0),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/polaroid.jpg"),
                        fit: BoxFit.cover,
                      ) // Add rounded corners if desired
                      ),
                ),
                title: const Text(
                  "Kodak Polaroid Camera",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text("Delivered 23 August"),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              const Divider(
                height: 1,
                thickness: 0.5,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ProductReviewPage(productID: "smeg_toaster");
                  }));
                },
                contentPadding:
                    const EdgeInsets.all(16.0), // Adjust padding as needed
                leading: Container(
                  width: 63, // Adjust width as needed
                  height: 63, // Adjust height as needed
                  decoration: BoxDecoration(
                      color: Colors.blue, // Change color as needed
                      borderRadius: BorderRadius.circular(8.0),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/toaster.jpeg"),
                        fit: BoxFit.cover,
                      ) // Add rounded corners if desired
                      ),
                ),
                title: const Text(
                  "SMEG Toaster",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text("Delivered 13 August"),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              const Divider(
                height: 1,
                thickness: 0.5,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
