import 'package:flutter/material.dart';

import 'dart:math';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {

  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.cyan;

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Container Page'),
      ),
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          curve: Curves.fastOutSlowIn,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: _color
          ),
          duration: Duration(seconds: 1),         
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: (){
          _changeState();
        }
        
      ),
    );
    
  }

  void _changeState() {
    final random = Random();

    setState((){
      _width = random.nextInt(300).toDouble();
      _height= random.nextInt(300).toDouble();
      _color = Color.fromRGBO(random.nextInt(255), random.nextInt(255),random.nextInt(255), 1);
      _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
       //Navigator.of(context).pushNamed('/');
    });
  }
}   
