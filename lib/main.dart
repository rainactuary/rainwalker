import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:rainwalkers/pages/plans.dart';
import 'package:rainwalkers/pages/account.dart';
import 'package:rainwalkers/pages/store.dart';
import 'package:rainwalkers/pages/home.dart';
import 'package:rainwalkers/core/camera/actions.dart';
import 'package:rainwalkers/routes/eachPage.dart';
import 'package:rainwalkers/core/userexperience/shapes.dart';

void main() => runApp(MyApp());
num degToRad(num deg) => deg * (math.pi / 180.0);


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Rainwalk Wellness",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: _Home(),
    );
  }
}

class _Home extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<_Home> {
  List<Widget> _viewList; //创建视图数组
  int _index = 0; //数组索引，通过改变索引值改变视图
  @override
  void initState() {
    super.initState();
    _viewList = List();
    _viewList
      ..add(HomePage())
      ..add(PlansPage())
      ..add(StorePage())
      ..add(AccountPage());
  }


  static const double offset = 15.0; // offset为正时，表示往下偏移；offset为负时，表示往上偏移

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: openGallery,
          elevation: 0,
          child: Icon(
            Icons.add,
            color: Colors.white,
          )),
      floatingActionButtonLocation:
      // 请一定要加const，否则每次点击bottomNavigationBar，floatingActionButton会重建
      const CenterDockedFloatingActionButtonLocation(offset),
      //和底栏进行融合
      bottomNavigationBar: BottomAppBar(
        notchMargin: 6,
        color: Colors.white, //底部工具栏的颜色。
        shape: CircularRaisedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            _buildBottomItem(_index, 0, Icons.home, "Home"),
            _buildBottomItem(_index, 1, Icons.beach_access, "Wellness"),
            _buildBottomItem(_index, -1, null, ""),
            _buildBottomItem(_index, 2, Icons.store, "Store"),
            _buildBottomItem(_index, 3, Icons.account_circle, "Profile"),
          ],
        ),
      ),
      body: _viewList[_index],
    );
  }

  Widget _buildBottomItem(
      int selectIndex, int index, IconData iconData, String title) {
    //未选中状态的样式
    TextStyle textStyle = TextStyle(fontSize: 12.0, color: Colors.grey);
    MaterialColor iconColor = Colors.grey;
    double iconSize = 20;
    EdgeInsetsGeometry padding = EdgeInsets.only(top: 8.0);

    if (selectIndex == index) {
      //选中状态的文字样式
      textStyle = TextStyle(fontSize: 12.0, color: Colors.blue);
      //选中状态的按钮样式
      iconColor = Colors.blue;
    }
    Widget padItem = SizedBox();
    if (iconData != null) {
      padItem = Padding(
        padding: padding,
        child: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              children: <Widget>[
                Icon(
                  iconData,
                  color: iconColor,
                  size: iconSize,
                ),
                Text(
                  title,
                  style: textStyle,
                )
              ],
            ),
          ),
        ),
      );
    }
    Widget item = Expanded(
      flex: 1,
      child: new GestureDetector(
        onTap: () {
          if (index != _index) {
            setState(() {
              _index = index;
            });
          }
        },
        child: SizedBox(
          height: 52,
          child: padItem,
        ),
      ),
    );
    return item;
  }
}



