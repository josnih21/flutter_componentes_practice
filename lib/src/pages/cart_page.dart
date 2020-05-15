import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards appbar'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[_cardType1(), SizedBox(height: 30.0), _cardType2()],
      ),
    );
  }

  Widget _cardType1() {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.adb),
            title: Text("I'm the text of a classic card component in flutter"),
            subtitle: Text("Are u nervous about tomorrow?"),
          ),
          Row(
            children: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () {},
              ),
              FlatButton(
                child: Text('Confirmar'),
                onPressed: () {},
              )
            ],
            mainAxisAlignment: MainAxisAlignment.end,
          )
        ],
      ),
      color: Colors.deepOrange,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      elevation: 10.0,
    );
  }

  Widget _cardType2() {
    return Card(
      child: Column(
        children: <Widget>[
          FadeInImage(
              placeholder: AssetImage('assets/jar_loading.gif'),
              image: NetworkImage(
                  "https://www.visitlapalma.es/wp-content/uploads/2019/02/astroturismo.jpg"),
              fadeInDuration: Duration(milliseconds: 2000),
              height: 250.0,
              fit: BoxFit.cover),
          Container(
              child: Text('Hola esto es una foto del observatorio de La Palma'))
        ],
      ),
    );
  }
}
