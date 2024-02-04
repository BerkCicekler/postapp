// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:postapp/product/constants/enums/padding_enums.dart';

final class PostsView extends StatelessWidget {
  const PostsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            _PostWidget(),
          ],
        ),
      ),
    );
  }
}

class _PostWidget extends StatelessWidget {
  const _PostWidget();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.5, color: Colors.grey),
        ),
      ),
      margin: EdgeInsets.all(PaddingConstants.small.value),
      padding: EdgeInsets.all(PaddingConstants.small.value),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ProfilePictureHolder(),
          SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Eşek yit",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                width: width * .7,
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProfilePictureHolder extends StatelessWidget {
  const _ProfilePictureHolder();

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 35,
      backgroundColor: Colors.grey,
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 33,
        backgroundImage: NetworkImage(
          'http://10.0.2.2:3000/uploads/2024-02-02T19-08-56.773Z.jpg',
        ),
      ),
    );
  }
}
