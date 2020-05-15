import 'package:components_practice/src/pages/alerta_page.dart';
import 'package:components_practice/src/providers/menu_provider.dart';
import 'package:components_practice/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          //         final route = MaterialPageRoute(
          //         builder: (context) => AlertaPage()
          //      );
          //   Navigator.push(context, route);
        },
      );
      options..add(widgetTemp)..add(Divider());
    });
    return options;
  }
}
