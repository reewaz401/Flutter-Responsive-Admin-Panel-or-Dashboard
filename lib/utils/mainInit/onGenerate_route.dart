import 'package:admin/screens/addData/addData_screen.dart';
import 'package:admin/screens/importExcel/components/read_ExcelFile.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  final args = settings.arguments;

  switch (settings.name) {
    case AddDataScreen.routeName:
      return MaterialPageRoute(builder: (_) => AddDataScreen());
    case ReadExcelFile.routeName:
      if (args is PlatformFile)
        return MaterialPageRoute(
            builder: (_) => ReadExcelFile(
                  file: args,
                ));
  }
}
