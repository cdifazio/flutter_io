// lib/file_manager/file_manager_io.dart

import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;

import 'file_manager_interface.dart';

class FileManager implements FileManagerInterface {
  @override
  Future<void> uploadFile() async {
    final result = await FilePicker.platform.pickFiles();
    final path = result?.files.single.path;
    if (path == null) return;
    final bytes = await File(path).readAsBytes();
    const uploadUrl = 'https://upload-demo.studymongolian.workers.dev/';
    final uri = Uri.parse(uploadUrl);
    await http.post(uri, body: bytes);
    print('Image uploaded successfully.');
  }

  @override
  Future<void> downloadFile() async {
    final url = Uri.parse('https://www.gomotionapp.com/va/UserFiles/Image/QuickUpload/meet-results-bass-jim-frye-memorial-invitational-may-202-04may2024-001_012008.zip');
    var response = await http.get(url);
    final path = await FilePicker.platform.saveFile(fileName: 'results.zip');
    if (path == null) return;
    final saveFile = File(path);
    await saveFile.writeAsBytes(response.bodyBytes);
    print(path);
  }
}