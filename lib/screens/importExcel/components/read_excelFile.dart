import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:spreadsheet_decoder/spreadsheet_decoder.dart';

class ReadExcelFile extends StatefulWidget {
  static const routeName = "/readExcelFile";
  final PlatformFile? file;

  const ReadExcelFile({Key? key, this.file}) : super(key: key);

  @override
  State<ReadExcelFile> createState() => _ReadExcelFileState();
}

class _ReadExcelFileState extends State<ReadExcelFile> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as PlatformFile;
    return FutureBuilder(
      future: readExcel(args),
      // initialData: InitialData,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          List _excelTable = snapshot.data;
          return Scaffold(
            appBar: AppBar(
              actions: [IconButton(onPressed: () {}, icon: Icon(Icons.send))],
            ),
            body: ListView.builder(
              itemCount: _excelTable.length,
              itemBuilder: (ctx, index) {
                return ListTile(
                  leading: Text(_excelTable[index][0] != null
                      ? _excelTable[index][0].toString()
                      : ''),
                  trailing: Text(_excelTable[index][1] != null
                      ? _excelTable[index][1].toString()
                      : ''),
                );
              },
            ),
          );
        }
      },
    );
  }

  Object? jsonEncode(Map excelJson) {}

  Future<List> readExcel(PlatformFile file) async {
    var excelJson = {};
    var bytes = file.bytes;
    var decoder = SpreadsheetDecoder.decodeBytes(bytes!);
    var table = decoder.tables['financial'];
    var jsonString = table!.rows;
    for (int i = 1; i < jsonString.length; i++) {
      // if (jsonString[i][0] != null) {
      excelJson[jsonString[i][0].toString()] = jsonString[i][1].toString();
      //}
    }
    var data = json.encode(excelJson);
    print(data);
    return table.rows;
    //   var excel = Excel.decodeBytes(bytes!);
    //  // return excel;
    //   List excelTable = [];

    //   for (var table in excel.tables.keys) {
    //     //print(excel.tables[table]!.rows.first.last.); //key

    //     print(excel.tables[table]!.rows[24].last!.value);
    //     excelTable.add(excel.tables[table]!.rows);
    //     // print(excel.tables[table]?.maxCols);
    //     // print(excel.tables[table]?.maxRows);
    //     // for (var row in excel.tables[table]!.rows) {
    //     //   print("$row");
    //     // }
    //     //key
    //   }
    //   return excelTable;
  }
}
