// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class PreviewSymptom extends StatelessWidget {
  final String imageUrl;
  final String text;
  const PreviewSymptom({
    Key? key,
    required this.imageUrl,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundImage: AssetImage(imageUrl),
        ),
        const SizedBox(height: 25),
        Text(text),
      ],
    );
  }
}
