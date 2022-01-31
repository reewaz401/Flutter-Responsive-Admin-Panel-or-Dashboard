import 'package:admin/screens/addData/addData_screen.dart';
import 'package:admin/screens/importExcel/components/read_ExcelFile.dart';
import 'package:admin/screens/importExcel/importExcel_screen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> initRoute(BuildContext context) {
  return {
    AddDataScreen.routeName: (context) => AddDataScreen(),
    ImportExcelScreen.routeName: (context) => const ImportExcelScreen(),
    ReadExcelFile.routeName: (context) => ReadExcelFile(),
  };
}
