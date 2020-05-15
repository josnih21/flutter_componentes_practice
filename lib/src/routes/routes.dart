import 'package:components_practice/src/pages/alerta_page.dart';
import 'package:components_practice/src/pages/avatar_page.dart';
import 'package:components_practice/src/pages/cart_page.dart';
import 'package:components_practice/src/pages/home_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertaPage(),
    'avatar': (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardPage(),
  };
}
