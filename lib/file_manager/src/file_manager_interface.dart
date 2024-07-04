// lib/file_manager/file_manager_interface.dart

abstract interface class FileManagerInterface {
  Future<void> uploadFile();
  Future<void> downloadFile();
}