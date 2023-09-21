import 'dart:async';

import 'package:docfinder/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runZonedGuarded<Future<void>>(
    () async {
      runApp(
        ProviderScope(
          child: const DocApp(),
        ),
      );
    },
    // ignore: only_throw_errors
    (e, _) => throw e,
  );
}
