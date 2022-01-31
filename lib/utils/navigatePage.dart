import 'package:flutter/material.dart';

navigatePush(
    {required BuildContext context,
    required String routeName,
    Object? arguments}) {
  return Navigator.pushNamed(context, routeName, arguments: arguments);
}
