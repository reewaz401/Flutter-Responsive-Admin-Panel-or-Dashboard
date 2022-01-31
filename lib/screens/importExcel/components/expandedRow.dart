import 'package:admin/constants.dart';
import 'package:admin/screens/importExcel/components/read_ExcelFile.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ExpandedRow extends StatefulWidget {
  final String title;
  ExpandedRow({Key? key, required this.title}) : super(key: key);

  @override
  _ExpandedRowState createState() => _ExpandedRowState();
}

class _ExpandedRowState extends State<ExpandedRow> {
  bool isSlected = false;
  PlatformFile? choosedFile;
  //final JavascriptRuntime jsRuntime = getJavascriptRuntime();
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(widget.title),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
                onPressed: () async {
                  try {
                    choosedFile = await pickFile();
                    setState(() {
                      print(choosedFile!.name);
                      isSlected = true;
                    });
                  } catch (mess) {}
                },
                child: Padding(
                    padding: EdgeInsets.all(defaultPadding),
                    child: !isSlected
                        ? Icon(Icons.add)
                        : Text(choosedFile!.name))),
            isSlected
                ? Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              isSlected = false;
                              choosedFile = null;
                            });
                          },
                          icon: Icon(Icons.delete)),
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, ReadExcelFile.routeName,
                                arguments: choosedFile);
                          },
                          icon: Icon(Icons.send))
                    ],
                  )
                : SizedBox()
          ],
        ),
      ],
    );
  }

  Future<PlatformFile> pickFile() async {
    FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
      allowMultiple: false,
    );
    if (pickedFile != null) {
      PlatformFile file = pickedFile.files.first;
      // String readExcel = await rootBundle.loadString("assets/js/readExcel.js");
      // final jsResult = jsRuntime.evaluate("""console.log("hi)""");
      // final jsString = jsResult.stringResult;
      return file;
      //var bytes = file.bytes;
      // var excel = Excel.decodeBytes(bytes!);
      // return excel;
      // for (var table in excel.tables.keys) {
      //   print(table); //sheet Name
      //   print(excel.tables[table]?.maxCols);
      //   print(excel.tables[table]?.maxRows);
      //   for (var row in excel.tables[table]!.rows) {
      //     print("$row");
      //   }
      // }
    } else {
      // User canceled the picker
      throw "cancel";
    }
  }
}
