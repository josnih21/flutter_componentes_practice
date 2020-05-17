import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  
  
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valueSlider = 100.0;

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
               _createImage(),
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
      onChanged: (value){
        setState((){
          _valueSlider = value;
        });
      }
    );
  }

 Widget _createImage() {
   return Image( 
     image: NetworkImage('https://lh3.googleusercontent.com/proxy/JfHFlqDhS50KMOOXikNd1ZQSWNxEvJy3zr_ajW_-9boJEQGC5zToMcbNhaRfaBD1-660_gGqqr9n3Ha24t7yp8I'),
     width: _valueSlider,
     fit: BoxFit.contain,
   );
 }
}