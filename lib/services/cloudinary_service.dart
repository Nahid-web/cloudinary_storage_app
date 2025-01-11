import 'dart:io';

import 'package:cloudinary/cloudinary.dart';
import 'package:cloudinary_storage_app/common/variables.dart';
import 'package:file_picker/file_picker.dart';

final cloudinary = Cloudinary.unsignedConfig(
  cloudName: cloudName,
);

uploadToCloudinary(FilePickerResult filePickerResult) async {
  File file = File(filePickerResult.files.single.path!);
  final response = await cloudinary.unsignedUpload(
    file: file.toString(),
    uploadPreset: uploadPresent,
    fileBytes: file.readAsBytesSync(),
    resourceType: CloudinaryResourceType.image,
    folder: 'nahid/name/',
    fileName: 'some-name3',
    progressCallback: (count, total) {
      print('Uploading image from file with progress: $count/$total');
    },
  );

  if (response.isSuccessful) {
    print('Get your image from with ${response.secureUrl}');
  }
}
