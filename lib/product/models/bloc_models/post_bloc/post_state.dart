// ignore_for_file: public_member_api_docs

part of 'post_bloc.dart';

class PostState extends Equatable {
  const PostState({
    this.posts = const <PostModel>[],
    this.hasReachedMax = false,
    this.status = PostStatus.initial,
  });

  final List<PostModel> posts;
  final bool hasReachedMax;
  final PostStatus status;

  @override
  List<Object?> get props => [posts, hasReachedMax, status];

  PostState copyWith({
    List<PostModel>? posts,
    bool? hasReachedMax,
    PostStatus? status,
  }) {
    return PostState(
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      status: status ?? this.status,
    );
  }
}

enum PostStatus {
  initial,
  success,
  failure;
}
