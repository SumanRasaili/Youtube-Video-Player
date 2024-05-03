import 'package:flutter/material.dart';
import 'package:youtube_data_api/models/video.dart';
import 'package:youtubeplayer/video_widget.dart';

class VideoBody extends StatefulWidget {
  final List<Video> contentList;

  const VideoBody({super.key, required this.contentList});

  @override
  BodyState createState() => BodyState(contentList);
}

class BodyState extends State<VideoBody> {
  List<Video> contentList;

  BodyState(this.contentList);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: contentList.length,
        itemBuilder: (context, index) {
          return video(contentList[index]);
        },
      ),
    );
  }

  Widget video(Video video) {
    return VideoWidget(
      video: video,
    );
  }
}
