import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final _options = ['One', 'Two', 'Three', 'four', 'five'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components Temp'),
      ),
      body: ListView(
        children: _createItemsShort()
      )
    );
  }

  List<Widget> _createItems() {
    List<Widget> list = new List<Widget>();

    for (String opt in _options) {
      final tempWidget = ListTile(
        title: Text(opt)
      );

      list..add(tempWidget)
          ..add( Divider() );
    }

    return list;
  }

  List<Widget> _createItemsShort() {
    return _options.map((String opt) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(opt + "!"),
            subtitle: Text('Whatever'),
            leading: Icon(Icons.ac_unit),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          Divider()
        ],
      );
    }).toList();
  }

}