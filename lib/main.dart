import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'app_setup.dart';
import 'my_app.dart';

final providerContainer = ProviderContainer();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppSetup().init();

  if (kDebugMode) {
    runApp(
      UncontrolledProviderScope(
        container: providerContainer,
        child: const MyApp(),
      ),
    );
  } else {
    await SentryFlutter.init(
      (options) {
        options.dsn = '';
        options.tracesSampleRate = 1.0;
      },
      appRunner: () => runApp(
        UncontrolledProviderScope(
          container: providerContainer,
          child: const MyApp(),
        ),
      ),
    );
  }
}
