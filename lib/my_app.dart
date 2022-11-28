import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'const.dart';
import 'providers/router_provider.dart';
import 'providers/scaffold_messager_key_provider.dart';

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.read(routerProvider);

    return MaterialApp.router(
      title: 'PMI Event',
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: ref.read(scaffoldMessengerKeyProvider),
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFF00D1D2, color),
        primaryColor: Const.primary,
        scaffoldBackgroundColor: Colors.white,
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  Map<int, Color> get color => const {
        50: Color.fromARGB(255, 0, 232, 232),
        100: Color.fromARGB(255, 210, 105, 0),
        200: Color.fromARGB(255, 129, 255, 255),
        300: Const.primary,
        400: Const.primary,
        500: Const.primary,
        600: Const.primary,
        700: Const.primary,
        800: Const.primary,
        900: Const.primary,
      };
}
