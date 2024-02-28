part of '../../post_view.dart';

mixin _PostCreateBottomSheetMixin on State<_PostCreateBottomSheet> {
  late final TextEditingController _contextTextFieldController;

  File? pictureFile;

  @override
  void initState() {
    super.initState();
    _contextTextFieldController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _contextTextFieldController.dispose();
  }
}
