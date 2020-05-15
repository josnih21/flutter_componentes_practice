import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final options = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvendido a mi app'),
      ),
      body: ListView(children: _createItemsShort()),
    );
  }

  List<Widget> _createItems() {
    List<Widget> list = new List<Widget>();
    for (String opt in options) {
      final tempWidget = ListTile(
        title: Text(opt),
      );

      //cascade operator
      list..add(tempWidget)..add(Divider());
    }
    return list;
  }

  //a way to generate widgets into a ListView using maps
  List<Widget> _createItemsShort() {
    return options.map((item) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item + "!"),
            subtitle: Text('Cualquier cosa'),
            leading: Icon(Icons.add_alert),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {},
          ),
          Divider()
        ],
      );
    }).toList();
  }
}
