import 'package:flutter/material.dart';

import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icon_string_util.dart';
import 'alert_page.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components'),
      ),
      body: _list(),
    );
  }

  Widget _list() {
    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: ( BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listItems(snapshot.data, context)
        );
      },
    );
  }

  List<Widget> _listItems(List<dynamic> data, BuildContext context) {
    final List<Widget> options = [];

    data.forEach((opt) {
      final tempWidget = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue[200]),
        onTap: () {

          Navigator.pushNamed(context, opt['ruta']); // El name de esta ruta tiene que estar definido en las rutas del main.
          // final route = MaterialPageRoute(        // Si no está definida se disparará el onGenerateRoute
          //   builder: (context) => AlertPage()
          // );

          // Navigator.push(context, route);

        },
      );

      options..add(tempWidget)
              ..add(Divider());
     });

     return options;
  }
}