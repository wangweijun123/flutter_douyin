import 'package:flutter/cupertino.dart';

class ImageAndText extends StatelessWidget {
  final int num;
  final String imagePath;
  ImageAndText(this.num, this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imagePath,
          width: 40,
          height: 40,
        ),
        Text('$num'),
      ],
    );
  }
}
