import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';
import 'package:fullter_douyin/util/log_util.dart';

import '../model/video_model.dart';
import '../widget/example_card.dart';
import '../widget/image_and_text.dart';
import 'first_page_controller.dart';
import 'page_view_item.dart';

class FirstPage extends StatefulWidget {
  final FijkPlayer player = FijkPlayer();

  @override
  State<FirstPage> createState() => _FirstPageState();

  void pasusePlay() {
    player.pause();
  }

  void startPlay() {
    player.start();
  }
}

class _FirstPageState extends State<FirstPage> {
  final FirstPageController controller = FirstPageController();
  final PageController pageController = PageController();

  var _currentPage = 0;

  @override
  void initState() {
    super.initState();
    myPrint(
        '_FirstPageState $hashCode initState.... controller = ${controller.hashCode}');
    controller.fetchVideoList().then((value) {
      setState(() {});
    });
    // player.setDataSource('https://www.w3schools.com/html/movie.mp4',
    //     autoPlay: true);
  }

  @override
  void dispose() {
    myPrint('_FirstPageState $hashCode dispose.... ');
    super.dispose();
    widget.player.release();
  }

  @override
  void activate() {
    super.activate();
    myPrint("_FirstPageState $hashCode activate ...");
  }

  @override
  void deactivate() {
    super.deactivate();
    myPrint("_FirstPageState $hashCode deactivate ...");
  }

  @override
  Widget build(BuildContext context) {
    myPrint('_FirstPageState build $hashCode .... ');
    if (controller.dataList.isNotEmpty) {
      // 默认播放第一个，因为第一次 onPageChanged不会改变
      var defaultVideo = controller.dataList[0];
      widget.player.reset().then((value) {
        myPrint('重置后播放默认的第一个视频');
        widget.player.setDataSource(defaultVideo.url, autoPlay: true);
      });
    }

    return PageView(
      onPageChanged: (currentPage) {
        _currentPage = currentPage;
        var videoModel = controller.dataList[currentPage];
        myPrint(
            'onPageChanged currentPage = $currentPage, videoModel = $videoModel');
        widget.player.reset().then((value) {
          myPrint('重置后播放');
          widget.player.setDataSource(videoModel.url, autoPlay: true);
        });
      },
      scrollDirection: Axis.vertical,
      controller: pageController,
      children: createChildren(controller.dataList),
    );
  }

  Widget createEmptyChild() {
    return const Center(
      child: Text('加载中 ...'),
    );
  }

  List<Widget> createChildren(List<VideoModel> dataList) {
    var widgets = <Widget>[];
    if (dataList.isEmpty) {
      widgets.add(createEmptyChild());
    } else {
      for (VideoModel item in dataList) {
        widgets.add(PageViewItem(item, widget.player));
      }
    }
    return widgets;
  }
}
