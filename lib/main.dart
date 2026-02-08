import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final app = Firebase.app();
  debugPrint("🔥 Firebase projectId = ${app.options.projectId}");
  debugPrint("🔥 Firebase appId     = ${app.options.appId}");

  runApp(const DevNexusApp());
}
