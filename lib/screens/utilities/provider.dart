import 'package:defood/screens/models/orders.dart';
import 'package:defood/screens/utilities/services.dart';
import 'package:flutter/cupertino.dart';

class DefoodProvider with ChangeNotifier {
  Services _service = Services();
  List<Resto> resto = [];

  DefoodProvider.initialize() {
    loadRestoByCat();
  }

  Future loadRestoByCat({String cat}) async {
    resto = await _service.getRestoByCat();
    notifyListeners();
  }
}
