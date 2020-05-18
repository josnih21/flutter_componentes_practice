import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  
  
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valueSlider = 100.0;
  bool _blockCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Slider page'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: 
            <Widget>[
              _createSlider(),
              _createCheckBox(),
              _createSwitch(),
               Expanded(
                 child: _createImage()
                 ),
            ],
        )
      ),
    );
    
  }

  Widget  _createSlider() {
    return Slider(
      activeColor: Colors.blueGrey,
      label: 'Text size',
      value: _valueSlider,
      min: 10.0,
      max: 400.0, 
      onChanged: (_blockCheck) ? null : (value){
        setState((){
          _valueSlider = value;
        });
      }
    );
  }

 Widget _createImage() {
   return Image( 
     image: NetworkImage('https://i0.pngocean.com/files/382/59/800/joker-batman-harley-quinn-brazil-the-dark-knight-joker.jpg'),
     width: _valueSlider,
     fit: BoxFit.contain,
   );
 }

  Widget _createCheckBox() {
    return CheckboxListTile(
      title: Text('Block slider'),
      value: _blockCheck, 
      onChanged: (value){
        setState(() {
          _blockCheck = value;
        });
      },
    );
  }

  Widget _createSwitch() {
    return SwitchListTile(
      title: Text('Block slider'),
      value: _blockCheck, 
      onChanged: (value){
        setState(() {
          _blockCheck = value;
        });
      },
    );
  }
}