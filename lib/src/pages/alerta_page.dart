import 'package:flutter/material.dart';

class AlertaPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alerta Page'),
        ),
        floatingActionButton: FloatingActionButton(
          child:Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
          ),
    );
  }
}