// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:testinggetx/Controller/getx_main_controller.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:path/path.dart' as path;


GetXMainController controller = Get.find<GetXMainController>();

FilePickerResult? filePickerResult;
File? pickerFile;
PlatformFile? file;
String? fileName;
int? fileSize;

Future<PlatformFile?> pickFiles(BuildContext context, bool format) async {
  try {
    final allowedExtensions = format
        ? ['docx', 'doc']
        : [
            'docx',
            'doc',
            'xlsx',
            'pdf',
            'jpeg',
            'jpg',
            'png',
            'txt'
          ]; // Define the accepted file extensions here

    filePickerResult = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: allowedExtensions,
    );

    if (filePickerResult != null) {
      file = filePickerResult?.files.firstOrNull();
      final fileExtension =
          path.extension(file?.name ?? '').replaceAll('.', '');

      if (allowedExtensions.contains(fileExtension)) {
        fileName = file?.name;
        fileSize = file?.size;
        return file;
      } else {
        debugPrint('Please select a file with a valid extension');
        // snackbar(context, 'Please select a file with a valid extension');
        throw Exception('Invalid file extension');
      }
    } else {
      debugPrint('Please select a file');
      // snackbar(context, 'Please select a file');
      throw Exception('No file selected');
    }
  } on PlatformException catch (e) {
    debugPrint(e.toString());
    rethrow;
  } catch (e) {
    debugPrint(e.toString());
    rethrow;
  }
}

pickFile({context, bool formatChange = false}) async {
  return await pickFiles(context, formatChange);
}

///mine
// Future<PlatformFile?> pickFiles() async {
//   try {
//     filePickerResult = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['txt'],
//     );
//     if (filePickerResult != null) {
//       file = filePickerResult?.files.firstOrNull();
//       fileName = file?.name;
//       fileSize = file?.size;
//       return file;
//       // return {
//       //   'fileName': fileName ?? '',
//       //   'fileSize': fileSize.toString() ?? '',
//       // };
//     } else {
//       debugPrint('Please select a file');
//       // snackbar(context, 'Please select a file');
//       return Future.error('didnt get files');
//       // return '';
//     }
//   } on PlatformException catch (e) {
//     e.toString();
//   } catch (e) {
//     e.toString();
//   }
//   // return Future.error('didnt get files');
//   // formatChange
//   //     ? ['docx', 'doc']
// }
