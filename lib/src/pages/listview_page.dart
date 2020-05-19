import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
 

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController _scrollController = new ScrollController();

  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;
  bool _loading = false;
  @override
  void initState() {
    super.initState();
    _addImages();
    _scrollController.addListener((){
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        //_addImages();
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Page'),
      ),
      body: Stack(
        children: <Widget>[
          _createLoading(),
          _createList(),
        ],
      )
      
      
    );
  }

  Widget _createList(){
    return RefreshIndicator(
      onRefresh: getFirstPage,
      child: ListView.builder(
      controller: _scrollController,
      itemCount: _listaNumeros.length,
      itemBuilder: (BuildContext context, int index){
        final imagen = _listaNumeros[index];
          return FadeInImage(
            placeholder: AssetImage('assets/jar_loading.gif'), 
            image: NetworkImage('https://picsum.photos/500/300/?image=$imagen'),
          );
        },

      ),
    );
  }

Future getFirstPage() async{
  final _duration = new Duration (seconds: 2);
  new Timer(_duration, (){
    _listaNumeros.clear();
    _ultimoItem++;
    _addImages();
  });

  return Future.delayed(_duration);
}
  void _addImages(){
    for (int i = 1; i< 10; i++){
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }

    setState(() {});
  }

  Future _fetchData() async {
    _loading = true;
    setState(() {});
    final _duration = new Duration (seconds: 2);
    new Timer(_duration, respuestaHTTP);
  }

  void respuestaHTTP() {
    _loading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250),
    );
    _addImages();
  }

 Widget _createLoading() {
   if(_loading){
     return Column(
       mainAxisSize: MainAxisSize.max,
       mainAxisAlignment: MainAxisAlignment.end,
       children: <Widget>[
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
            CircularProgressIndicator()
           ],
         ),
         SizedBox(height: 15.0)
       ],
     ); 
   }else{
     return Container();
   }
 }
}