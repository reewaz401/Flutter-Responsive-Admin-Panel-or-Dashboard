import 'package:admin/models/addData/tabList.dart';
import 'package:flutter/material.dart';

List<Tab> tabsWidget() {
  return [for (int i = 0; i < tabList.length; i++) _tab(text: tabList[i])];
}

Tab _tab({String text = ''}) {
  return Tab(
    child: Align(
      alignment: Alignment.center,
      child: Text(text),
    ),
  );
}
