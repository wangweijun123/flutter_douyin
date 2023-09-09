import 'package:flutter/material.dart';
import 'package:fullter_douyin/util/log_util.dart';

import '../widget/example_card.dart';

class FriendsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    myPrint(' _SecondPage $hashCode .... ');
    return Column(
      children: <Widget>[
        ExampleCard(),
        ExampleCard(),
      ],
    );
  }
}
