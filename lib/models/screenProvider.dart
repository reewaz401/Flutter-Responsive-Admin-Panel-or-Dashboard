import 'package:admin/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ScreenProvider with ChangeNotifier {
  Widget _routeScreen = DashboardScreen();
  Widget get routeScreen => _routeScreen;

  void changeRouteScreen(Widget screen) {
    _routeScreen = screen;
    notifyListeners();
  }
}
