import 'package:flutter/material.dart';

class FeaturesHorizontal extends StatelessWidget {
  FeaturesHorizontal({
    super.key,
  });

  // array of features in the menu
  final List<String> features = <String>[
    'Orders',
    'Coupons',
    'Messages',
    'Favorites',
    'History',
  ];

  final List<Icon> icons = <Icon>[
    const Icon(
      Icons.document_scanner_outlined,
      size: 30,
    ),
    const Icon(
      Icons.card_membership_outlined,
      size: 30,
    ),
    const Icon(
      Icons.message_outlined,
      size: 30,
    ),
    const Icon(
      Icons.bookmark_border_outlined,
      size: 30,
    ),
    const Icon(
      Icons.history_outlined,
      size: 30,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SizedBox(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: features.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      icon: icons[index],
                      tooltip: features[index],
                      onPressed: () {},
                    ),
                  ),
                  Text(
                    features[index],
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
