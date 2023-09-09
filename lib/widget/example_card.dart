import 'package:flutter/material.dart';

class ExampleCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: Colors.black26,
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Ink.image(
                        image: const AssetImage('assets/placeholder_image.png'),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '123 photos',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        '123 photos',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            InkWell(
              splashColor: Colors.black38,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}