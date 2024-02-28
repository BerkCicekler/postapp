part of '../../post_view.dart';

class _PostCreateBottomSheet extends StatefulWidget {
  const _PostCreateBottomSheet();

  @override
  State<_PostCreateBottomSheet> createState() => _PostCreateBottomSheetState();
}

class _PostCreateBottomSheetState extends State<_PostCreateBottomSheet>
    with _PostCreateBottomSheetMixin {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colorScheme = Theme.of(context).colorScheme;
    return BlocProvider(
      create: (_) => PostCreateBottomSheetCubit(
        contextTextFieldController: _contextTextFieldController,
      ),
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Center(
          child: Container(
            width: size.width * .9,
            height: size.height * .4,
            padding: EdgeInsets.all(PaddingConstants.medium.value),
            decoration: BoxDecoration(
              color: colorScheme.background.withOpacity(.97),
              border: Border.all(color: colorScheme.outline, width: 0.3),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const _PostCreateBottomSheetBody(),
          ),
        ),
      ),
    );
  }
}

class _PostCreateBottomSheetBody extends StatelessWidget {
  const _PostCreateBottomSheetBody();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final postCreateCubit = context.read<PostCreateBottomSheetCubit>();
    return Column(
      children: [
        const _PostCreateBottomSheetActionsRow(),
        Divider(
          color: colorScheme.outline,
        ),
        TextField(
          controller: postCreateCubit.contextTextFieldController,
          minLines: 5,
          maxLines: 5,
          onChanged: postCreateCubit.onTextChange,
          decoration: const InputDecoration(border: InputBorder.none),
        ),
        Divider(
          color: colorScheme.outline,
        ),
        const Row(
          children: [
            _PostCreateBottomSheetImage(),
          ],
        ),
      ],
    );
  }
}

class _PostCreateBottomSheetActionsRow extends StatelessWidget {
  const _PostCreateBottomSheetActionsRow();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final postCreateCubit = context.read<PostCreateBottomSheetCubit>();
    return BlocConsumer<PostCreateBottomSheetCubit, PostCreateBottomSheetState>(
      listener: (context, state) {
        if (state.status == PostSendStatus.success) {
          Navigator.pop(context);
        }
      },
      buildWhen: (previous, current) {
        return previous.canSend != current.canSend ||
            previous.status != current.status;
      },
      builder: (context, state) {
        return Row(
          children: [
            RichText(
              text: TextSpan(
                text: 'Cancel',
                style: TextStyle(
                  color: colorScheme.primary,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pop(context);
                  },
              ),
            ),
            const Spacer(),
            if (state.status != PostSendStatus.sending)
              RichText(
                text: TextSpan(
                  text: 'Send Post',
                  style: TextStyle(
                    color: state.canSend ? colorScheme.primary : Colors.grey,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = state.canSend ? postCreateCubit.sendPost : null,
                ),
              )
            else
              const CircularProgressIndicator(),
          ],
        );
      },
    );
  }
}

class _PostCreateBottomSheetImage extends StatelessWidget {
  const _PostCreateBottomSheetImage();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final postCreateBottomSheetCubit =
        context.read<PostCreateBottomSheetCubit>();
    return BlocBuilder<PostCreateBottomSheetCubit, PostCreateBottomSheetState>(
      buildWhen: (previous, current) {
        return previous.picture != current.picture;
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: postCreateBottomSheetCubit.onPictureTap,
          child: state.picture == null
              ? Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: colorScheme.primary,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.add,
                    color: colorScheme.primary,
                  ),
                )
              : Image.file(
                  state.picture!,
                  width: 70,
                  height: 70,
                ),
        );
      },
    );
  }
}
