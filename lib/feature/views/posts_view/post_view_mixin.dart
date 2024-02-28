part of 'post_view.dart';

mixin PostViewOperation on State<_PostViewScaffold> {
  late final ScrollController _scrollController;
  late final PostBloc postBloc;
  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    postBloc = context.read<PostBloc>();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * .9);
  }

  void _onScroll() {
    if (!_isBottom) return;
    postBloc.add(PostFetch());
  }

  void showPostCreatorSheet() {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.white.withOpacity(0),
      elevation: 0,
      builder: (context) {
        return const _PostCreateBottomSheet();
      },
    );
  }

  void logout() {
    CacheUtil.clearSavedAccount();
    context.read<AuthUserProvider>().changeUser(null);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(
        builder: (_) => const AuthLoginView(),
      ),
    );
  }
}
