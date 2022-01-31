import 'dart:convert';

import 'package:http/http.dart' as http;

class CallReq {
  Future<dynamic> post({required String url, dynamic body}) async {
    try {
      var response =
          await http.post(Uri.parse(url), body: json.encode(body), headers: {
        "Content-Type": "application/json",
        'permission': "2021D@T@f@RSt*6&%2-D@T@",
        "Access-Control-Allow-Origin": "*"
      });
      print(response);
      var jsonDecoded = json.decode(response.body);
      print('object');
      print(jsonDecoded);
      return jsonDecoded;
    } catch (err) {
      print(err);
      throw err;
    }
  }
}
