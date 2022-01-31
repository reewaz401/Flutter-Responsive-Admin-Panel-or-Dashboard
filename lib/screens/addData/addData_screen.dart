import 'package:admin/screens/addData/components/tabBarView_widget.dart';
import 'package:admin/screens/addData/components/tabs_widget.dart';
import 'package:flutter/material.dart';

class AddDataScreen extends StatefulWidget {
  static const routeName = '/addDataScreen';
  AddDataScreen({Key? key}) : super(key: key);

  @override
  _AddDataScreenState createState() => _AddDataScreenState();
}

class _AddDataScreenState extends State<AddDataScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF2A2D3E),
            elevation: 0,
            bottom: TabBar(
                labelColor: Colors.redAccent,
                unselectedLabelColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: Colors.white),
                tabs: tabsWidget()),
          ),
          body: TabBarView(children: tabBarView_widget(context)),
        ));
  }
}
