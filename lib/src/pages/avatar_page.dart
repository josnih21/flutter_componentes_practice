import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://images-na.ssl-images-amazon.com/images/I/71gktrern6L._AC_SX522_.jpg'),
              radius: 20.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('KJ'),
              backgroundColor: Colors.lightGreen,

            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(placeholder: AssetImage('assets/jar_loading.gif'), image: NetworkImage('https://cdnb.artstation.com/p/assets/images/images/006/510/801/large/daniel-garcia-daniel-garcia-art-illustration-kim-jong-un-north-korea-war-missile-nuclear-atomic-bomb-01.jpg?1499160729')),),
    );
  }
}
