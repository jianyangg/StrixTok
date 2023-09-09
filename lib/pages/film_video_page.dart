import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_hackers/components/bottom_nav_bar.dart';
import 'package:tiktok_hackers/pages/home_page.dart';

class FilmVideoPage extends StatelessWidget {
  const FilmVideoPage({Key? key, this.reviewType}) : super(key: key);

  final String? reviewType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/images/film_ss.jpeg', // Replace with your image path
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          // Display Review Type
          reviewType == null
              ? Container()
              : Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    Center(
                      // bottom: MediaQuery.of(context).size.height * 0.27,
                      // left: MediaQuery.of(context).size.width * 0.75,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            reviewType ??
                                '', // Display reviewType or an empty string if null
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
          // Submit Button
          Positioned(
            bottom: 50,
            right: 50,
            child: ElevatedButton(
              onPressed: () {
                // simulate adding of video to feed.
                // show snack bar
                if (reviewType != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: reviewType == "Shared with followers"
                            ? const Text(
                                'Video approved and shared with followers! 500 coins awarded.')
                            : const Text(
                                'Video approved and shared to the public feed! 1000 coins awarded.')),
                  );
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              HomePage(showReviewVideo: true)));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text(
                            'Simulate normal non-review TikTok video being added.')),
                  );
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              HomePage(showReviewVideo: false)));
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                foregroundColor: MaterialStateProperty.all(Colors.black),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              child: const Text('Test: Upload'),
            ),
          ),
          // reject button
          if (reviewType != null)
            Positioned(
              bottom: 50,
              left: 50,
              child: ElevatedButton(
                onPressed: () {
                  // show snack bar saying that video was rejected
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Video rejected. No product detected.'),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                child: const Text('Test: Reject Video'),
              ),
            ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 2),
    );
  }
}
