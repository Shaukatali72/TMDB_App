import 'package:flutter/material.dart';

class NavigationService {
  static final NavigationService _instance = NavigationService._internal();
  NavigationService._internal();

  factory NavigationService() => _instance;

  final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  BuildContext get currentContext => navigationKey.currentState!.context;

  dynamic popIt([dynamic popValue]) {
    return navigationKey.currentState?.pop(popValue);
  }

  Future<dynamic> navigateToScreen(String page, {navArgs}) async =>
      navigationKey.currentState?.pushNamed(
        page,
        arguments: navArgs,
      );

  Future<dynamic> replaceScreen(String page, {arguments}) async =>
      navigationKey.currentState?.pushReplacementNamed(page);

  void popToFirst() =>
      navigationKey.currentState?.popUntil((route) => route.isFirst);
}
