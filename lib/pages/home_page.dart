import 'package:flutter/material.dart';
import 'package:tiktok_hackers/components/bottom_nav_bar.dart';
import 'package:tiktok_hackers/constant/data_json.dart';
import 'package:tiktok_hackers/theme/colors.dart';
import 'package:tiktok_hackers/widgets/header_home_page.dart';
import 'package:tiktok_hackers/widgets/column_social_icon.dart';
import 'package:tiktok_hackers/widgets/left_panel.dart';
import 'package:tiktok_hackers/widgets/tik_tok_icons.dart';
import 'package:video_player/video_player.dart';

// for this page, we are fetching videos locally for now
// later on, we will fetch videos from our cloud storage

class HomePage extends StatefulWidget {
  bool? showReviewVideo = false;
  HomePage({Key? key, this.showReviewVideo}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool liked = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    int len = widget.showReviewVideo != null && widget.showReviewVideo!
        ? items.length
        : items.length - 1;

    _tabController = TabController(length: len, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 0,
      ),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    List<Widget> videoItems = [];

    // Check if showVideoReview is true
    if (widget.showReviewVideo != null && widget.showReviewVideo!) {
      // Show the video at index 0
      videoItems.add(
        VideoPlayerItem(
          videoUrl: items[0]['videoUrl'],
          size: size,
          name: items[0]['name'],
          caption: items[0]['caption'],
          songName: items[0]['songName'],
          profileImg: items[0]['profileImg'],
          likes: items[0]['likes'],
          comments: items[0]['comments'],
          shares: items[0]['shares'],
          albumImg: items[0]['albumImg'],
          liked: liked,
        ),
      );
    }

    // Show the rest of the videos starting from index 1
    for (int index = 1; index < items.length; index++) {
      videoItems.add(
        VideoPlayerItem(
          videoUrl: items[index]['videoUrl'],
          size: size,
          name: items[index]['name'],
          caption: items[index]['caption'],
          songName: items[index]['songName'],
          profileImg: items[index]['profileImg'],
          likes: items[index]['likes'],
          comments: items[index]['comments'],
          shares: items[index]['shares'],
          albumImg: items[index]['albumImg'],
          liked: liked,
        ),
      );
    }

    return GestureDetector(
      onDoubleTap: () {
        setState(() {
          liked = true;
        });
      },
      child: RotatedBox(
        quarterTurns: 1,
        child: TabBarView(
          controller: _tabController,
          children: videoItems,
        ),
      ),
    );
  }
}

class VideoPlayerItem extends StatefulWidget {
  final String videoUrl;
  final String name;
  final String caption;
  final String songName;
  final String profileImg;
  final String likes;
  final String comments;
  final String shares;
  final String albumImg;
  final bool liked;
  VideoPlayerItem({
    Key? key,
    required this.size,
    required this.name,
    required this.caption,
    required this.songName,
    required this.profileImg,
    required this.likes,
    required this.comments,
    required this.shares,
    required this.albumImg,
    required this.videoUrl,
    required this.liked,
  }) : super(key: key);

  final Size size;

  @override
  _VideoPlayerItemState createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  late VideoPlayerController _videoController;
  bool isShowPlaying = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _videoController = VideoPlayerController.asset(widget.videoUrl)
      ..initialize().then((value) {
        _videoController.play();
        setState(() {
          isShowPlaying = false;
        });
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _videoController.dispose();
  }

  Widget isPlaying() {
    return _videoController.value.isPlaying && !isShowPlaying
        ? Container()
        : Icon(
            Icons.play_arrow,
            size: 80,
            color: white.withOpacity(0.5),
          );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _videoController.pause();
        Navigator.pop(context);
        return true;
      },
      child: InkWell(
        onTap: () {
          setState(() {
            _videoController.value.isPlaying
                ? _videoController.pause()
                : _videoController.play();
          });
        },
        child: RotatedBox(
          quarterTurns: -1,
          child: Container(
              height: widget.size.height,
              width: widget.size.width,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: widget.size.height,
                    width: widget.size.width,
                    decoration: BoxDecoration(color: black),
                    child: Stack(
                      children: <Widget>[
                        VideoPlayer(_videoController),
                        Center(
                          child: Container(
                            decoration: BoxDecoration(),
                            child: isPlaying(),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: widget.size.height,
                    width: widget.size.width,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 15, top: 20, bottom: 10),
                      child: SafeArea(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            HeaderHomePage(),
                            Expanded(
                                child: Row(
                              children: <Widget>[
                                LeftPanel(
                                  size: widget.size,
                                  name: widget.name,
                                  caption: widget.caption,
                                  songName: widget.songName,
                                ),
                                RightPanel(
                                  size: widget.size,
                                  likes: widget.likes,
                                  comments: widget.comments,
                                  shares: widget.shares,
                                  profileImg: widget.profileImg,
                                  albumImg: widget.albumImg,
                                  liked: widget.liked,
                                )
                              ],
                            ))
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}

class RightPanel extends StatelessWidget {
  final String likes;
  final String comments;
  final String shares;
  final String profileImg;
  final String albumImg;
  final bool liked;
  const RightPanel({
    Key? key,
    required this.size,
    required this.likes,
    required this.comments,
    required this.shares,
    required this.profileImg,
    required this.albumImg,
    required this.liked,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: size.height,
        child: Column(
          children: <Widget>[
            Container(
              height: size.height * 0.3,
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                getProfile(profileImg),
                getIcons(TikTokIcons.heart, likes, 35.0, liked),
                getIcons(TikTokIcons.chat_bubble, comments, 35.0, false),
                getIcons(TikTokIcons.reply, shares, 25.0, false),
                getAlbum(albumImg)
              ],
            ))
          ],
        ),
      ),
    );
  }
}
