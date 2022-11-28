import 'dart:async';
import 'package:api_com/api_com.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AppSetup {
  Future<void> init() async {
    await _setupHive();

    _setupApiCom();
  }

  Future<void> _setupHive() async {
    await Hive.initFlutter();
  }

  void _setupApiCom() {
    Com.config = ComConfig(
      preDecorder: (payload) => payload['payload'],
    );
  }
}
