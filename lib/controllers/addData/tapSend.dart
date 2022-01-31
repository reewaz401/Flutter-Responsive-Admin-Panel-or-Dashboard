import 'package:admin/utils/callReq.dart';
import 'package:admin/utils/customAlert.dart';
import 'package:admin/utils/urls.dart';
import 'package:flutter/material.dart';

Future<void> tapSend(
    {required String type,
    required BuildContext context,
    required dynamic body}) async {
  try {
    var response = await CallReq().post(url: post_liveData, body: body);

    customCallAlert(ctx: context, status: response["status"]);
  } catch (err) {
    customCallAlert(ctx: context, status: 503);
  }
}
