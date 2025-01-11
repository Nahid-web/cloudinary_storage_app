import 'package:cloudinary_storage_app/common/utils/utils.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FilePickerResult? _selectedFileResult;
  _openFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _selectedFileResult = result;
      });
      print(_selectedFileResult);

      Navigator.pushNamed(context, "/upload", arguments: _selectedFileResult);
    } else {
      showSnackBar(context: context, content: 'file picker result is null');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Files"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openFilePicker,
        child: Icon(Icons.add),
      ),
    );
  }
}
