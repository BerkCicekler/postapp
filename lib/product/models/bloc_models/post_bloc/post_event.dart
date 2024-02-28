part of 'post_bloc.dart';

sealed class PostEvent {}

class PostFetch extends PostEvent {}

class PostFetchNews extends PostEvent {}
