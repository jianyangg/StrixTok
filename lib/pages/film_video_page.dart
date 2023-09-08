import 'package:flutter/material.dart';

class FilmVideoPage extends StatelessWidget {
  final String reviewType;
  const FilmVideoPage({super.key, required this.reviewType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text("Film Video Page"),
      ),
    );
  }
}
