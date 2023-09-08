import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_hackers/components/bottom_nav_bar.dart';

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
          // Upload Button
          Positioned(
            bottom: 40,
            right: 20,
            child: ElevatedButton(
              onPressed: () async {
                // Handle the upload button's onPressed event here
                // open gallery
                // upload video
                // save video locally
                final pickedFile = await ImagePicker().pickMedia();
                if (pickedFile != null) {
                  // TODO: save video / upload to Firebase
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
              child: const Text('Upload Video'),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 40,
            child: ElevatedButton(
              onPressed: () async {
                // Handle the upload button's onPressed event here
                // open gallery
                // upload video
                // save video locally
                final pickedFile = await ImagePicker().pickMedia();
                if (pickedFile != null) {
                  // TODO: save video / upload to Firebase
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
              child: const Text('Effects'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 2),
    );
  }
}
