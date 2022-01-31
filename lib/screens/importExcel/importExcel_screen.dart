import 'package:admin/controllers/importExcel/const.dart';
import 'package:admin/screens/importExcel/components/expandedRow.dart';
import 'package:flutter/material.dart';

class ImportExcelScreen extends StatelessWidget {
  static const routeName = '/importExcelScreen';
  const ImportExcelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
          itemCount: importType.length,
          itemBuilder: (ctx, index) {
            return ExpandedRow(title: importType[index]);
          }),
    );
  }
}
