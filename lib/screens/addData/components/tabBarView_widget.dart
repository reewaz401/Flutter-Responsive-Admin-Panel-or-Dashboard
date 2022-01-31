import 'package:admin/controllers/addData/tapSend.dart';
import 'package:admin/models/addData/tabList.dart';
import 'package:flutter/material.dart';

List<Widget> tabBarView_widget(BuildContext context) {
  return [
    for (int i = 0; i < tabList.length; i++) _tabBarView(tabList[i], context)
  ];
}

Widget _tabBarView(String type, BuildContext context) {
  String inputText = '';
  return SizedBox(
    width: double.infinity,
    child: Column(
      children: [
        IconButton(
            onPressed: () {
              tapSend(type: type, context: context, body: inputText);
            },
            icon: Icon(Icons.send)),
        TextFormField(
          onChanged: (val) {
            inputText = val;
          },
          maxLines: null,
        )
      ],
    ),
  );
}
