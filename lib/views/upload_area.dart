import 'package:cloudinary_storage_app/services/cloudinary_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class UploadArea extends StatelessWidget {
  const UploadArea({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedFile =
        ModalRoute.of(context)!.settings.arguments as FilePickerResult;
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Area"),
      ),
      body: Column(
        children: [
          TextFormField(
            readOnly: true,
            initialValue: selectedFile.files.first.name,
          ),
          TextFormField(
            readOnly: true,
            initialValue: selectedFile.files.first.extension,
          ),
          TextFormField(
            readOnly: true,
            initialValue: "${selectedFile.files.first.size} bytes",
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
              ElevatedButton(
                  onPressed: () {
                    uploadToCloudinary(selectedFile);
                  },
                  child: Text("Submit"))
            ],
          )
        ],
      ),
    );
  }
}
