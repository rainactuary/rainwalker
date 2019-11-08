import 'package:flutter/material.dart';


//子页面
//代码中设置了一个内部的_title变量，这个变量是从主页面传递过来的，然后根据传递过来的具体值显示在APP的标题栏和屏幕中间。
class EachView extends StatefulWidget {
  String _title;

  EachView(this._title);

  @override
  _EachViewState createState() => _EachViewState();
}

class _EachViewState extends State<EachView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget._title)),
      body: Center(child: Text(widget._title)),
    );
  }
}


//_openNewPage() {
//  Navigator.of(context)
//      .push(MaterialPageRoute(builder: (BuildContext context) {
//    return EachView("new Pager");
//  }));
//}