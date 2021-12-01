import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

import '/models/history.dart';

class SecureStorage {
  static const _storage = FlutterSecureStorage();

  static const _keyHistory = 'KeyHistory';

  static void setHistory(List<History> history) async {
    await _storage.write(key: _keyHistory, value: json.encode(history));
  }

  static Future<void> getHistory(context) async {
    final value = await _storage.read(key: _keyHistory);
    if (value != null) {
      for (var historyJson in json.decode(value)) {
        Provider.of<HistoryList>(
          context,
          listen: false,
        ).addHistoryFromJson(History.fromJson(historyJson));
      }
    }
  }

  static void deleteAll(context) async {
    await _storage.delete(key: _keyHistory);
  }
}
