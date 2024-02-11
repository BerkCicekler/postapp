// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:postapp/feature/views/focus_image_view/focus_image_view.dart';
import 'package:postapp/product/constants/enums/padding_enums.dart';
import 'package:postapp/product/models/post_model.dart';
import 'package:postapp/product/models/user_model.dart';

part 'widgets/post_widget.dart';

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
                context:
                    "gidin artık sda asdasdasda sdasdasd asd asdasdasdasdasd",
                imagePath:
                    "https://cdnuploads.aa.com.tr/uploads/Contents/2022/05/10/thumbs_b_c_1d651212444778bcb4c84dce8acb5aaf.jpg?v=164629",
                senderUser: UserModel(
                  id: 5,
                  photoPath:
                      "http://localhost:3000/uploads/2024-02-02T19-08-56.773Z.jpg",
                  name: "sa",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
