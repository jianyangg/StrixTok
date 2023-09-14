import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:strix_tok/components/bottom_nav_bar.dart';
import 'package:strix_tok/pages/home_page.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class FilmVideoPage extends StatefulWidget {
  const FilmVideoPage({Key? key, this.reviewType, this.productID})
      : super(key: key);

  final String? productID;
  final String? reviewType;

  @override
  State<FilmVideoPage> createState() => _FilmVideoPageState();
}

class _FilmVideoPageState extends State<FilmVideoPage> {
  Future<void> uploadVideo(File video) async {
    try {
      final firebase_storage.Reference storageRef = firebase_storage
          .FirebaseStorage.instance
          .ref()
          .child('pendingVideos/testUser_${widget.productID}.mp4');

      final firebase_storage.UploadTask uploadTask = storageRef.putFile(video);

      await uploadTask;
    } catch (e) {
      print('Error uploading video: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to upload video. Try again later.'),
        ),
      );
    }
  }

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          const BackgroundWidget(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.12,
                  decoration:
                      BoxDecoration(color: Colors.black.withOpacity(0.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Spacer(),
                      SizedBox(
                        // square shape
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.height * 0.1,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.black),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          onPressed: () async {
                            if (widget.reviewType != null) {
                              // show dialog asking user to choose between successful upload or rejected video
                              // for simulation purposes
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    contentTextStyle:
                                        const TextStyle(color: Colors.black),
                                    title: const Text('Choose upload status'),
                                    content: const Text(
                                        'Choose whether to simulate a successful upload or a rejected video.'),
                                    actions: [
                                      // Successful upload button
                                      TextButton(
                                        onPressed: () async {
                                          bool uploadSuccess =
                                              await pickAndUploadVideo();

                                          if (uploadSuccess) {
                                            // Video was uploaded successfully
                                            // Show the appropriate Snackbar
                                            final snackBar = SnackBar(
                                              content: widget.reviewType ==
                                                      "Shared with followers"
                                                  ? const Text(
                                                      'Video approved and shared with followers! 500 coins awarded.')
                                                  : const Text(
                                                      'Video approved and shared to the public feed! 1000 coins awarded.'),
                                            );
                                            // ignore: use_build_context_synchronously
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);

                                            // Navigate to the home page
                                            // ignore: use_build_context_synchronously
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => HomePage(
                                                    showReviewVideo: true),
                                              ),
                                            );
                                          } else {
                                            // Handle the case where the video upload failed
                                            // You can show another Snackbar or an error message.
                                            Navigator.pop(context);
                                            const snackBar = SnackBar(
                                              content: Text(
                                                  'Video upload failed. Try again later.'),
                                            );
                                            // ignore: use_build_context_synchronously
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                          }
                                        },
                                        child: const Text(
                                          'Success',
                                          style: TextStyle(color: Colors.green),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          bool uploadSuccess =
                                              await pickAndUploadVideo();

                                          if (uploadSuccess) {
                                            // show snack bar saying that video was rejected
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                    'Purchased product not detected. Video rejected.'),
                                              ),
                                            );

                                            Navigator.pop(context);
                                          } else {
                                            Navigator.pop(context);
                                            // Handle the case where the video upload failed
                                            // You can show another Snackbar or an error message.
                                            const snackBar = SnackBar(
                                              content: Text(
                                                  'Video upload failed. Try again later.'),
                                            );
                                            // ignore: use_build_context_synchronously
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                          }
                                        },
                                        child: const Text(
                                          'Rejected',
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ),
                                      // cancel
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          'Cancel',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {
                              await simulatePickAndUploadVideo();
                            }
                          },
                          child: const Icon(
                            Icons.upload,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.10,
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: widget.reviewType == null
                        ? Colors.transparent
                        : Colors.grey,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      widget.reviewType ??
                          '', // Display reviewType or an empty string if null
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              ],
            ),
          ),
          // // Submit Button
          // Positioned(
          //   bottom: 300,
          //   left: 50,
          //   child: ElevatedButton(
          //     onPressed: () {
          //       // simulate adding of video to feed.
          //       // show snack bar
          //       if (widget.reviewType != null) {
          //         ScaffoldMessenger.of(context).showSnackBar(
          //           SnackBar(
          //               content: widget.reviewType == "Shared with followers"
          //                   ? const Text(
          //                       'Video approved and shared with followers! 500 coins awarded.')
          //                   : const Text(
          //                       'Video approved and shared to the public feed! 1000 coins awarded.')),
          //         );
          //         Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //                 builder: (context) =>
          //                     HomePage(showReviewVideo: true)));
          //       } else {
          //         ScaffoldMessenger.of(context).showSnackBar(
          //           const SnackBar(
          //               content: Text(
          //                   'Simulate normal non-review TikTok video being added.')),
          //         );
          //         Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //                 builder: (context) =>
          //                     HomePage(showReviewVideo: false)));
          //       }
          //     },
          //     style: ButtonStyle(
          //       backgroundColor: MaterialStateProperty.all(Colors.white),
          //       foregroundColor: MaterialStateProperty.all(Colors.black),
          //       shape: MaterialStateProperty.all(
          //         RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(10),
          //         ),
          //       ),
          //     ),
          //     child: const Text('Test: Upon Successful Upload'),
          //   ),
          // ),
          // // reject button
          // if (widget.reviewType != null)
          //   Positioned(
          //     bottom: 220,
          //     left: 50,
          //     child: ElevatedButton(
          //       onPressed: () {
          //         // show snack bar saying that video was rejected
          //         ScaffoldMessenger.of(context).showSnackBar(
          //           const SnackBar(
          //             content: Text('Video rejected. No product detected.'),
          //           ),
          //         );
          //       },
          //       style: ButtonStyle(
          //         backgroundColor: MaterialStateProperty.all(Colors.red),
          //         foregroundColor: MaterialStateProperty.all(Colors.white),
          //         shape: MaterialStateProperty.all(
          //           RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(10),
          //           ),
          //         ),
          //       ),
          //       child: const Text('Test: Reject Video'),
          //     ),
          //   ),
          // // Upload videos to firebase storage
          // if (widget.reviewType != null)
          //   Positioned(
          //     bottom: 260,
          //     left: 50,
          //     child: ElevatedButton(
          //       onPressed: () async {
          //         final XFile? video =
          //             await _picker.pickVideo(source: ImageSource.gallery);
          //         if (video != null) {
          //           File videoFile = File(video.path);
          //           uploadVideo(videoFile);
          //         }
          //       },
          //       style: ButtonStyle(
          //         backgroundColor: MaterialStateProperty.all(Colors.green),
          //         foregroundColor: MaterialStateProperty.all(Colors.white),
          //         shape: MaterialStateProperty.all(
          //           RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(10),
          //           ),
          //         ),
          //       ),
          //       child: const Text('Test: Upload to Firebase'),
          //     ),
          //   ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return HomePage();
                  },
                ),
              );
            },
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              height: MediaQuery.of(context).size.width * 0.20,
              width: MediaQuery.of(context).size.width * 0.12,
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 2),
    );
  }

  Future<bool> pickAndUploadVideo() async {
    final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);
    if (video != null) {
      File videoFile = File(video.path);
      uploadVideo(videoFile);
      return true;
    }
    return false;
  }

  Future<void> simulatePickAndUploadVideo() async {
    final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);
    if (video != null) {
      // show snack bar
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Video uploaded to TikTok.'),
        ),
      );
    }
  }
}

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/film_ss.jpeg', // Replace with your image path
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
