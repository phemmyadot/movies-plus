import 'package:flutter/material.dart';

class AppProvider with ChangeNotifier {
  String _baseUrl = '';
  String _secureBaseUrl = '';
  
  String get baseUrl {
    return _baseUrl;
  }
  String get secureBaseUrl {
    return _secureBaseUrl;
  }

  void setBaseUrl(data) {
    print('$data------------------------------------------------');
    _secureBaseUrl = data.baseUrl;
    _baseUrl = data.images.base_url;
    notifyListeners();
  }
}
