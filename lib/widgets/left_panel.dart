import 'package:flutter/material.dart';
import 'package:strix_tok/theme/colors.dart';

class LeftPanel extends StatelessWidget {
  final String name;
  final String caption;
  final String songName;
  final String advertisement;
  const LeftPanel({
    Key? key,
    required this.size,
    required this.name,
    required this.caption,
    required this.songName,
    required this.advertisement,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.8,
      height: size.height,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            name,
            style: TextStyle(
                color: white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(
            height: 10,
          ),
          Visibility(
            visible: advertisement
                .isNotEmpty, // Show the red container if there's text in 'advertisement'
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0), // Rounded edges
              child: Container(
                color: Colors.red, // Red background for advertisement
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    advertisement,
                    style: TextStyle(
                      color: white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Text(
            caption,
            style: TextStyle(color: white),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.music_note,
                color: white,
                size: 15,
              ),
              Flexible(
                child: Text(
                  songName,
                  style: TextStyle(color: white, height: 1.5),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
