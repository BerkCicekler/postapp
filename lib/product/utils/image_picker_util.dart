import 'dart:io';

import 'package:image_picker/image_picker.dart';

final class ImagePickerUtil {
  ImagePickerUtil._();

  static Future<File?> pickAnImage() async {
    final picker = ImagePicker();
    final file = await picker.pickImage(source: ImageSource.gallery);

    return file != null ? File(file.path) : null;
  }
}
