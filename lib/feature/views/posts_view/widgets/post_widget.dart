part of '../post_view.dart';

final class _PostWidget extends StatelessWidget {
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
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.senderUser.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                _ExtendableTextContext(
                  fullText: post.context,
                ),
                if (post.imagePath.isNotEmpty)
                  _ContextImage(
                    imageURL: post.imagePath,
                    postId: post.id,
                  )
                else
                  const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

final class _ProfilePictureHolder extends StatelessWidget {
  const _ProfilePictureHolder({required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedNetworkImage(
        width: 60,
        height: 60,
        imageUrl: imagePath.isEmpty
            ? 'http://localhost:3000/uploads/defaultProfile.jpg'
            : imagePath,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}

class _ExtendableTextContext extends StatefulWidget {
  const _ExtendableTextContext({required this.fullText});

  final String fullText;

  @override
  State<_ExtendableTextContext> createState() => _ExtendableTextContextState();
}

class _ExtendableTextContextState extends State<_ExtendableTextContext> {
  late final bool isTextLong;

  /// its for the storing the state of if the user view all text
  bool viewMore = false;
  String text = '';

  @override
  void initState() {
    super.initState();
    if (widget.fullText.length > 50) {
      text = widget.fullText.substring(0, 50);
      isTextLong = true;
    } else {
      text = widget.fullText;
      isTextLong = false;
    }
  }

  void _onTap() {
    viewMore = !viewMore;
    if (viewMore) {
      text = widget.fullText;
    } else {
      text = widget.fullText.substring(0, 50);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(text),
        isTextLong ? _showText() : const SizedBox(),
      ],
    );
  }

  Widget _showText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: _onTap,
          child: Text(
            viewMore ? 'View less' : 'View More',
            style: const TextStyle(
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}

final class _ContextImage extends StatelessWidget {
  const _ContextImage({required this.imageURL, required this.postId});

  final String imageURL;
  final int postId;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => FocusImageView(
              imageURL: imageURL,
            ),
          ),
        );
      },
      child: Hero(
        tag: 'focusedImage$postId',
        child: Image.network(imageURL),
      ),
    );
  }
}
