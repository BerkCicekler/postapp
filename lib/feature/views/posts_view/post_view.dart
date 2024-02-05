// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:postapp/product/constants/enums/padding_enums.dart';
import 'package:postapp/product/models/post_model.dart';
import 'package:postapp/product/models/user_model.dart';

final class PostsView extends StatelessWidget {
  const PostsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _PostWidget(
              post: PostModel(
                id: 5,
                context: "gidin artık",
                imagePath: "",
                senderUser: UserModel(
                    id: 5,
                    photoPath:
                        "http://localhost:3000/uploads/2024-02-02T19-08-56.773Z.jpg",
                    name: "sa"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PostWidget extends StatelessWidget {
  const _PostWidget({required this.post});

  final PostModel post;

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
          _ProfilePictureHolder(
            imagePath: post.senderUser.photoPath,
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.senderUser.name,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                width: width * .7,
                child: Text(
                  post.context,
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
  const _ProfilePictureHolder({required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.network(
        imagePath,
        width: 70,
        errorBuilder: (context, error, stackTrace) {
          return ColoredBox(color: Colors.orange);
        },
      ),
    );
  }
}
