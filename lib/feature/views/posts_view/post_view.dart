// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postapp/feature/views/auth_views/login_view/login_view.dart';
import 'package:postapp/feature/views/focus_image_view/focus_image_view.dart';
import 'package:postapp/product/constants/enums/padding_enums.dart';
import 'package:postapp/product/models/bloc_models/post_bloc/post_bloc.dart';
import 'package:postapp/product/models/post_model.dart';
import 'package:postapp/product/models/providers/auth_user_provider.dart';
import 'package:postapp/product/services/network_service.dart';
import 'package:postapp/product/services/post_service.dart';
import 'package:postapp/product/utils/cache_util.dart';
import 'package:postapp/product/utils/image_picker_util.dart';

part 'widgets/post_widget.dart';
part 'post_view_mixin.dart';
part 'widgets/post_create_bottom_sheet/post_create_bottom_sheet.dart';
part 'widgets/post_create_bottom_sheet/post_create_bottom_sheet_mixin.dart';
part 'widgets/post_create_bottom_sheet/post_create_bottom_sheet_cubit.dart';

final class PostsView extends StatelessWidget {
  const PostsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PostBloc(dio: NetworkService.instance.dio)
        ..add(
          PostFetch(),
        ),
      lazy: false,
      child: _PostViewScaffold(),
    );
  }
}

class _PostViewScaffold extends StatefulWidget {
  const _PostViewScaffold();

  @override
  State<_PostViewScaffold> createState() => _PostViewScaffoldState();
}

class _PostViewScaffoldState extends State<_PostViewScaffold>
    with PostViewOperation {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        elevation: 0,
        scrolledUnderElevation: 0,
        actions: [
          IconButton(
            onPressed: logout,
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          postBloc.add(PostFetchNews());
        },
        child: SingleChildScrollView(
          controller: _scrollController,
          child: _PostsBuilder(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showPostCreatorSheet,
        child: Icon(Icons.add),
      ),
    );
  }
}

class _PostsBuilder extends StatelessWidget {
  const _PostsBuilder();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        return Column(
          children: [
            for (int i = 0; i < state.posts.length; i++)
              _PostWidget(post: state.posts[i]),
          ],
        );
      },
    );
  }
}
