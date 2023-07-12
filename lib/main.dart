import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test_adam/my_app.dart';
import 'package:suitmedia_test_adam/utils/http_overriding.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = HttpOverriding();
  Provider.debugCheckInvalidValueType = null;

  runApp(const MyApp());
}
