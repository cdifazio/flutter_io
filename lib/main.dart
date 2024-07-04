// lib/main.dart

import 'package:flutter/material.dart';
import 'file_manager/file_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final manager = FileManager();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: manager.uploadFile,
                child: const Text('Upload file'),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: manager.downloadFile,
                child: const Text('Download file'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}