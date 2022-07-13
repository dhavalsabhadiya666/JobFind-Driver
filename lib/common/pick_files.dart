import 'dart:io';

import 'package:file_picker/file_picker.dart';

class PickFiles {
  static Future<String> getImage() async {
    final filePickerResult = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    if (filePickerResult != null) {
      return filePickerResult.files.first.path!;
    }
    return '';
  }

  static Future<String> getVideo() async {
    final filePickerResult = await FilePicker.platform.pickFiles(
      type: FileType.video,
    );
    if (filePickerResult != null) {
      return filePickerResult.files.first.path!;
    }
    return '';
  }
}
