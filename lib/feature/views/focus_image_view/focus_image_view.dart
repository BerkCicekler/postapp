import 'package:flutter/material.dart';

/// This page is for showing an image in full screen format
class FocusImageView extends StatelessWidget {
  const FocusImageView({
    required this.imageURL,
    super.key,
  });

  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Center(
          child: Hero(
            tag: 'focusedImage',
            child: Image.network(imageURL),
          ),
        ),
      ),
    );
  }
}
