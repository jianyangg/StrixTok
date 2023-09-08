import 'package:flutter/material.dart';
import 'package:tiktok_hackers/pages/account_page.dart';
import 'package:tiktok_hackers/pages/film_video_page.dart';
import 'package:tiktok_hackers/pages/home_page.dart' as homePage;
import 'package:tiktok_hackers/pages/inbox_page.dart';
import 'package:tiktok_hackers/pages/shop_page.dart';
import 'package:tiktok_hackers/widgets/upload_icon.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  const BottomNavBar({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Colors.black,
        elevation: 1,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            tooltip: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Shop',
            tooltip: 'Shop',
          ),
          const BottomNavigationBarItem(
            icon: UploadIcon(),
            label: 'Add',
            tooltip: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                const Icon(Icons.inbox),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Text(
                      '6',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            label: 'Inbox',
            tooltip: 'Inbox',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            tooltip: 'Profile',
          ),
        ],
        currentIndex: currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[400],
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return homePage.HomePage();
              }));
              break;
            case 1:
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ShopPage();
              }));
              break;
            case 2:
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FilmVideoPage();
              }));
              break;
            case 3:
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const InboxPage();
              }));
              break;
            case 4:
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const AccountPage();
              }));
              break;
          }
        });
  }
}
