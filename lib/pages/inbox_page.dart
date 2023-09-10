import 'package:flutter/material.dart';
import 'package:strix_tok/components/bottom_nav_bar.dart';
import 'package:strix_tok/pages/review_page.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const Icon(
          Icons.edit_document,
          color: Colors.black,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            'Inbox',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundImage:
                      AssetImage('assets/images/account_image.jpg'),
                ),
                SizedBox(height: 10),
                Text(
                  'Create',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Divider(
            thickness: 0.5,
          ),
          const SizedBox(height: 10),
          const Row(
            children: [
              SizedBox(width: 15),
              CircleAvatar(
                radius: 23,
                backgroundColor: Colors.pink,
                foregroundColor: Colors.white,
                child: Icon(Icons.notifications),
              ),
              SizedBox(width: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Activity',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Notifications will show up here',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Icon(Icons.chevron_right),
              SizedBox(width: 15),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(
            thickness: 0.5,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ReviewPage();
              }));
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: const Column(
                children: [
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 15),
                      CircleAvatar(
                        radius: 23,
                        backgroundColor: Colors.lightBlue,
                        foregroundColor: Colors.white,
                        child: Icon(Icons.shopping_bag),
                      ),
                      SizedBox(width: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'TikTok Shop Reviews',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              CircleAvatar(
                                radius: 9,
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                                child: Text(
                                  "6",
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Review your purchases',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.chevron_right),
                      SizedBox(width: 15),
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
          const Divider(
            thickness: 0.5,
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(
        currentIndex: 3,
      ),
    );
  }
}
