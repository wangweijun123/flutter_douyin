import 'package:flutter/material.dart';
import 'package:fullter_douyin/util/log_util.dart';

import '../widget/example_card.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    myPrint('_FirstPage $hashCode .... ');
    return Column(
      children: <Widget>[
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ExampleCard(),
              ExampleCard(),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ExampleCard(),
              ExampleCard(),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ExampleCard(),
              ExampleCard(),
            ],
          ),
        ),
      ],
    );
  }
}
