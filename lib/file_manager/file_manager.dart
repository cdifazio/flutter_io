// lib/file_manager/file_manager.dart

export 'src/file_manager_io.dart'
    if (dart.library.html) 'src/file_manager_web.dart';