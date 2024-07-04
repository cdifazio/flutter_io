// lib/file_manager/file_manager_web.dart

import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'file_manager_interface.dart';

class FileManager implements FileManagerInterface {
  @override
  Future<void> uploadFile() async {
    final result = await FilePicker.platform.pickFiles();
    final bytes = result?.files.single.bytes;
    if (bytes == null) return;
    const uploadUrl = 'https://upload-demo.studymongolian.workers.dev/';
    final uri = Uri.parse(uploadUrl);
    await http.post(uri, body: bytes);
    print('Image uploaded successfully.');
  }

  @override
  Future<void> downloadFile() async {
    final url = Uri.parse('https://www.gomotionapp.com/va/UserFiles/Image/QuickUpload/meet-results-bass-jim-frye-memorial-invitational-may-202-04may2024-001_012008.zip');
    final response = await http.get(url);
    final blob = html.Blob([response.bodyBytes]);
    final anchorElement = html.AnchorElement(
      href: html.Url.createObjectUrlFromBlob(blob).toString(),
    )..setAttribute('download', 'results.zip');
    html.document.body!.children.add(anchorElement);
    anchorElement.click();
    html.document.body!.children.remove(anchorElement);
    print(response.bodyBytes.length);
  }
}