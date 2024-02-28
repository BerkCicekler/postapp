import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postapp/product/models/post_model.dart';
import 'package:postapp/product/services/post_service.dart';

part 'post_state.dart';
part 'post_event.dart';

/// Post bloc for post_view screen
class PostBloc extends Bloc<PostEvent, PostState> {
  /// initial constructor
  PostBloc({required this.dio}) : super(const PostState()) {
    on<PostFetch>(_postFetch, transformer: droppable());
    on<PostFetchNews>(_fetchNewPosts, transformer: droppable());
  }

  final Dio dio;

  Future<void> _postFetch(PostFetch event, Emitter<PostState> emit) async {
    if (state.hasReachedMax) return;
    try {
      final fetchedPosts = await PostService(dio: dio).fetchPosts(
        startIndex: state.posts.length,
      );
      if (fetchedPosts.isEmpty) {
        return emit(state.copyWith(hasReachedMax: true));
      }
      emit(
        const PostState().copyWith(
          posts: [...state.posts, ...fetchedPosts],
          status: PostStatus.success,
        ),
      );
    } catch (e) {
      emit(const PostState().copyWith(status: PostStatus.failure));
    }
  }

  Future<void> _fetchNewPosts(
    PostFetchNews event,
    Emitter<PostState> emit,
  ) async {
    try {
      emit(
        const PostState(),
      );
      // This code blow actually SHOULD work pretty well but
      // some how when i change the list from the start the
      // posts list in state changes without problem
      // but the ui is not showing the new added values
      /*
      final fetchedPosts = await PostService(dio: dio).fetchPosts(
        startIndex: 0,
      );
      final notExistInCurrent = <PostModel>[];
      for (final element in fetchedPosts.reversed) {
        if (!state.posts.contains(element)) {
          notExistInCurrent.add(element);
        }
      }
      emit(
        state.copyWith(
          posts: [...notExistInCurrent, ...state.posts],
        ),
      );*/
    } catch (e) {
      emit(const PostState().copyWith(status: PostStatus.failure));
    }
  }
}
