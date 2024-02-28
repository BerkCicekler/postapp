// ignore_for_file:  sort_constructors_first
// ignore_for_file: public_member_api_docs

part of '../../post_view.dart';

class PostCreateBottomSheetCubit extends Cubit<PostCreateBottomSheetState> {
  PostCreateBottomSheetCubit({
    required this.contextTextFieldController,
  }) : super(
          const PostCreateBottomSheetState(
            canSend: false,
            status: PostSendStatus.none,
            picture: null,
          ),
        );

  final TextEditingController contextTextFieldController;

  bool get canSend {
    return contextTextFieldController.text.isNotEmpty &&
        contextTextFieldController.text.length <= 255;
  }

  Future<void> onPictureTap() async {
    if (state.picture != null) {
      emit(
        PostCreateBottomSheetState(
          canSend: state.canSend,
          status: state.status,
          picture: null,
        ),
      );
    } else {
      emit(state.copyWith(picture: await ImagePickerUtil.pickAnImage()));
    }
  }

  Future<void> sendPost() async {
    emit(state.copyWith(status: PostSendStatus.sending));
    final respond =
        await PostService(dio: NetworkService.instance.dio).sendPost(
      context: contextTextFieldController.text,
      picture: state.picture,
    );
    emit(
      state.copyWith(
        status: respond ? PostSendStatus.success : PostSendStatus.failure,
      ),
    );
  }

  void onTextChange(String val) {
    emit(state.copyWith(canSend: canSend));
  }
}

class PostCreateBottomSheetState extends Equatable {
  const PostCreateBottomSheetState({
    required this.canSend,
    required this.status,
    required this.picture,
  });
  final bool canSend;
  final PostSendStatus status;
  final File? picture;

  PostCreateBottomSheetState copyWith({
    bool? canSend,
    PostSendStatus? status,
    File? picture,
  }) {
    return PostCreateBottomSheetState(
      canSend: canSend ?? this.canSend,
      status: status ?? this.status,
      picture: picture ?? this.picture,
    );
  }

  @override
  List<Object?> get props => [canSend, status, picture];
}

enum PostSendStatus {
  none,
  sending,
  success,
  failure;
}
