import 'package:components_practice/src/providers/menu_provider.dart';
import 'package:components_practice/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _myDrawer(),
      appBar: AppBar(
        title: Text('Bienvenido a mi lista'),
      ),
      body: _listComponents(),
    );
  }

  Widget _listComponents() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(children: _listitems(snapshot.data, context));
      },
      initialData: [],
    );
  }

  List<Widget> _listitems(List<dynamic> data, BuildContext context) {
    final List<Widget> options = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.black12),
        onTap: () {
          Navigator.pushNamed(context, opt['ruta']);
        },
      );
      options..add(widgetTemp)..add(Divider());
    });
    return options;
  }

  Widget _myDrawer() {
    return Drawer(
        child: ListView(
      children: <Widget>[
        DrawerHeader(
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/josnih.png'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'José Ángel Nieda 🚀🚀',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'josnih@gmail.com',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(color: Colors.lightBlueAccent),
        ),
        ListTile(
          title: Text('Messages'),
          onTap: () {},
          leading: Icon(Icons.message),
        ),
        ListTile(
          title: Text('Settings'),
          onTap: () {},
          leading: Icon(Icons.settings),
        ),
        ListTile(
            title: Text('Health'), onTap: () {}, leading: Icon(Icons.healing)),
        ListTile(
          title: Text('About'),
          onTap: () {},
          leading: Icon(Icons.info),
        )
      ],
    ));
  }
}
