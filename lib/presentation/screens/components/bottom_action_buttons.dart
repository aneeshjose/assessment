import 'package:flutter/material.dart';

class BottomActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.thumb_up),
            Icon(Icons.comment),
            Icon(Icons.share),
            Icon(Icons.download_outlined),
          ],
        ),
      ),
    );
  }
}
