import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:tiktok_hackers/components/bottom_nav_bar.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 5, vsync: this);
    // SchedulerBinding.instance!.addPostFrameCallback((_) {
    //   _tabController.animateTo(4);
    // });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  // Replace with the actual list of shopping activity
  final List<String> shoppingActivityList = [
    'YuJi liked "Sony Headphones"',
    'YuJi purchased "Sony PlayStation 5"',
    'YuJi liked "Apple AirPods"',
    'YuJi purchased Apple Pencil"',
    'YuJi liked "Apple Watch"',
    'YuJi liked "Apple iPhone 12"',
    'Yuji purchased "Strix GeForce RTX 3090"',
    'YuJi liked "Apple MacBook Pro"',
    'YuJi liked "Apple iPad Pro"',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: DefaultTabController(
        length: 5,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 70),
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                    'assets/images/account_image.jpg'), // Replace with your profile image
              ),
              const SizedBox(height: 20),
              const Text(
                '@yuji5', // Replace with the user's actual username
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Bio: Your bio goes here', // Replace with the user's bio
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        '100K', // Replace with the user's actual follower count
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Followers',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        '200', // Replace with the user's actual following count
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Following',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        '500', // Replace with the user's actual video count
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Likes',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Implement edit profile functionality
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.grey.shade300),
                      elevation:
                          MaterialStateProperty.resolveWith((states) => 1),
                      shape: MaterialStateProperty.resolveWith((states) =>
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                    ),
                    child: const Text('Edit profile',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Implement edit profile functionality
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.grey.shade300),
                      elevation:
                          MaterialStateProperty.resolveWith((states) => 1),
                      shape: MaterialStateProperty.resolveWith((states) =>
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                    ),
                    child: const Text(
                      'Add friends',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TabBar(
                controller: _tabController,
                indicatorColor: Colors.black,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey.shade700,
                dividerColor: Colors.grey.shade700,
                padding: EdgeInsets.all(0),
                tabs: const [
                  Tab(
                    icon: Icon(
                      Icons.grid_on,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.lock,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.bookmark_outline,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.check_circle_outline,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.shopping_bag_outlined,
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 0.5,
                height: 1,
              ),
              // give some examples of shopping and like activity
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // Grid View
                    GridView.count(
                      padding: const EdgeInsets.all(2),
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 6,
                      children: List.generate(30, (index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/account_image.jpg'), // Replace with your product image
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }),
                    ),
                    // Locked View
                    const Center(
                      child: Text(
                        'Your private videos',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Bookmarks View
                    const Center(
                      child: Text(
                        'Your saved videos',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Purchases View
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Only you can see which videos you liked',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    // Shopping View
                    ListView.builder(
                      padding: EdgeInsets.all(0),
                      shrinkWrap: true,
                      itemCount: shoppingActivityList
                          .length, // Replace with the actual list of shopping activity
                      itemBuilder: (context, index) {
                        return ShoppingActivityItem(
                            activity: shoppingActivityList[index]);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 4),
    );
  }
}

class ShoppingActivityItem extends StatelessWidget {
  final String activity;

  const ShoppingActivityItem({Key? key, required this.activity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.shopping_bag),
      title: Text(activity),
      subtitle: Text('3 minutes ago'), // Replace with actual timestamp
      onTap: () {
        // Handle tapping on the shopping activity item
      },
    );
  }
}
