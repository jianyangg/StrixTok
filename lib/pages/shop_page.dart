import 'package:flutter/material.dart';
import 'package:tiktok_hackers/components/bottom_nav_bar.dart';
import 'package:tiktok_hackers/components/own_search_bar.dart';
import 'package:tiktok_hackers/components/features_horizontal.dart';
import 'package:tiktok_hackers/pages/product_page.dart';
import 'package:tiktok_hackers/pages/purchase_page.dart';

class ShopPage extends StatefulWidget {
  final String? newOrder;
  const ShopPage({super.key, this.newOrder});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final List<String> names = ['Sourick', 'Gabriel', 'Ben'];
  final List<String> tabs = [
    'All',
    '9.9 SALE',
    'Best Buys',
    'Beauty',
    'Toys',
    'Jewellery',
    // 'Fashion',
  ];

  // load images
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: tabs.length,
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 50),
              const OwnSearchBar(),
              SizedBox(height: 5),
              FeaturesHorizontal(),
              MessageLoop(newOrder: widget.newOrder),
              SizedBox(height: 20),
              const FlashSaleWidget(),
              TabBar(
                isScrollable: true,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black,
                indicatorColor: Colors.black,
                indicatorWeight: 3,
                indicatorSize: TabBarIndicatorSize.label,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                tabs: tabs.map((tab) {
                  return Tab(
                    icon: Text(
                      tab,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  );
                }).toList(),
              ),
              Divider(thickness: 2),
              // GridView of products
              GridView.count(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                padding: EdgeInsets.all(0),
                children: List.generate(6, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductPage(productID: productLabel[index]),
                          ),
                        );
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.width * 0.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade100,
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              Container(
                                alignment: Alignment.center,
                                height:
                                    MediaQuery.of(context).size.width * 0.35,
                                width: MediaQuery.of(context).size.width * 0.4,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: images[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                '${productLabel[index]} \$${index + 1}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700),
                              ),
                              SizedBox(height: 5),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
        // Bottom navigation bar
        bottomNavigationBar: const BottomNavBar(currentIndex: 1),
      ),
    );
  }
}

class FlashSaleWidget extends StatelessWidget {
  const FlashSaleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.21,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    " Check out what your friends are buying! ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.red),
                  ),
                  // time left
                  // const Spacer(),
                  // Text(
                  //   "Time left: 15:10:33  ",
                  //   style: TextStyle(
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: 15,
                  //       color: Colors.red.shade500),
                  // ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              FlashSaleImagesWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class FlashSaleImagesWidget extends StatelessWidget {
  const FlashSaleImagesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ProductPage(productID: 'alarm_clock');
                },
              ),
            );
          },
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.width * 0.25,
                width: MediaQuery.of(context).size.width * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/clock.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // make background red
                        decoration: BoxDecoration(
                          color: Colors.red.shade500,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10)),
                        ),
                        child: const Text(
                          "  Hot ",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "@gabrielseethor",
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
              )
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ProductPage(productID: 'headphones');
                },
              ),
            );
          },
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.width * 0.25,
                width: MediaQuery.of(context).size.width * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/headphones.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // make background red
                        decoration: BoxDecoration(
                          color: Colors.red.shade500,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10)),
                        ),
                        child: const Text(
                          "  Hot ",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "@benjamin",
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
              )
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ProductPage(productID: 'kodak_polaroid_camera');
                },
              ),
            );
          },
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.width * 0.25,
                width: MediaQuery.of(context).size.width * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/polaroid.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // make background red
                        decoration: BoxDecoration(
                          color: Colors.red.shade500,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10)),
                        ),
                        child: const Text(
                          "  Hot ",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "@sourick",
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
              )
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}

class MessageLoop extends StatefulWidget {
  final String? newOrder;
  const MessageLoop({super.key, this.newOrder});

  @override
  _MessageLoopState createState() => _MessageLoopState();
}

class _MessageLoopState extends State<MessageLoop> {
  final List<String> messages = <String>[
    'Sourick just bought his rash cream from Watson 5 minutes ago!',
    'Gabriel just purchased his new pants from Zara 12 minutes ago!',
    'Ben just purchased his new Sony A7IV from Sony 15 minutes ago!'
  ];

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    if (widget.newOrder != null) {
      // messages.add(widget.newOrder!);
      // add new order to the top of the list
      messages.insert(0, widget.newOrder!);
    }
    startMessageLoop();
  }

  void startMessageLoop() {
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        currentIndex = (currentIndex + 1) % messages.length;
      });
      startMessageLoop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.08,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
            child: Text(
              messages[currentIndex],
              textAlign: TextAlign.center, // Center align the text
              style: const TextStyle(
                color: Color.fromARGB(255, 255, 23, 7),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
