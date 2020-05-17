import 'package:components_practice/src/pages/alerta_page.dart';
import 'package:components_practice/src/pages/animated_container.dart';
import 'package:components_practice/src/pages/avatar_page.dart';
import 'package:components_practice/src/pages/cart_page.dart';
import 'package:components_practice/src/pages/home_page.dart';
import 'package:components_practice/src/pages/input_page.dart';
import 'package:components_practice/src/pages/sliders_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertaPage(),
    'avatar': (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardPage(),
    'animatedContainer' : (BuildContext context) => AnimatedContainerPage(),
    'inputs' : (BuildContext context) => InputPage(),
    'slider' : (BuildContext context) => SliderPage(),
  };
}
