import 'package:flutter/material.dart';
import 'package:fullter_douyin/util/log_util.dart';

import '../widget/example_card.dart';

class MessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('$TAG  _ThirdPage $hashCode .... ');

    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Image.asset(
            'assets/avatar_logo.png',
            width: 40,
          ),
          title: Text('List item ${index + 1}'),
          subtitle: const Text('Secondary text'),
        );
      },
      itemCount: 10,
    );
  }
}