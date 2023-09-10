import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/video_model.dart';
import '../util/log_util.dart';
import '../widget/image_and_text.dart';

class PageViewItem extends StatefulWidget {
  final VideoModel item;
  final FijkPlayer player;

  PageViewItem(this.item, this.player);

  @override
  State<PageViewItem> createState() => _PageViewItemState();
}

class _PageViewItemState extends State<PageViewItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    myPrint('_PageViewItemState build $hashCode .... ${widget.item}');
    return Stack(
      children: [
        FijkView(
          player: widget.player,
        ),
        // 头像
        Align(
          alignment: Alignment.bottomRight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              buildCircleConer(),
              ImageAndText(widget.item.playCount, 'assets/like.png'),
              ImageAndText(widget.item.playCount, 'assets/comment.png'),
              ImageAndText(widget.item.playCount, 'assets/unmark.png'),
              ImageAndText(widget.item.playCount, 'assets/forward.png'),
            ],
          ),
        ),

        Row(
          children: [],
        ),
      ],
    );
  }

  // 圆角头像
  Widget buildCircleConer() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/owl-2.jpg'),
          fit: BoxFit.cover,
        ),
        border: Border.all(width: 4, color: Colors.white),
        // radius 半径
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
