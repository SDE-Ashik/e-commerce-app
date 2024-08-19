import 'package:flutter/foundation.dart';

class OnboardingNotifier with ChangeNotifier {
  int _selectdPage = 0;
  int get selectedPage => _selectdPage;

  set setSelectedPage(int page) {
    _selectdPage = page;
    print(page);
    notifyListeners();
  }
}
