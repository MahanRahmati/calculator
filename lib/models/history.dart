import 'package:flutter/material.dart';

import '/helpers/secure_storage.dart';

class History {
  String id = '';
  String input = '';
  String value = '';

  History.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    input = json['input'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "input": input, "value": value};
  }

  History({required this.id, required this.input, required this.value});
}

class HistoryList extends ChangeNotifier {
  final List<History> _history = [];

  List<History> get items => [..._history];

  Future<void> addHistory(String input, String value) async {
    final newHistory = History(
      id: DateTime.now().toString(),
      input: input,
      value: '=' + value,
    );
    _history.add(newHistory);
    notifyListeners();
    SecureStorage.setHistory(_history);
  }

  Future<void> addHistoryFromJson(History history) async {
    _history.add(history);
    notifyListeners();
  }

  Future<void> deleteHistory(context) async {
    _history.clear();
    notifyListeners();
    SecureStorage.deleteAll(context);
  }
}
