import 'package:animation_pagas/src/basics/01_animation_container.dart';
import 'package:animation_pagas/src/basics/02_page_route_builder.dart';
import 'package:animation_pagas/src/basics/03_animation_controller.dart';
import 'package:animation_pagas/src/basics/04_tweens.dart';
import 'package:animation_pagas/src/basics/05_animated_builder.dart';
import 'package:animation_pagas/src/basics/06_custom_tween.dart';
import 'package:animation_pagas/src/basics/07_tween_sequence.dart';
import 'package:animation_pagas/src/misc/card_swipe.dart';
import 'package:animation_pagas/src/misc/carousel.dart';
import 'package:animation_pagas/src/misc/expand_card.dart';
import 'package:animation_pagas/src/misc/focus_image.dart';
import 'package:animation_pagas/src/misc/physics_card_drag.dart';
import 'package:animation_pagas/src/misc/repeating_animation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Demo {
  final String name;
  final String route;
  final WidgetBuilder builder;

  const Demo({this.name, this.route, this.builder});
}

final basicDemoe = [
  Demo(
      name: 'AnimationContianer',
      route: AnimationContainerDemo.routeName,
      builder: (context) => AnimationContainerDemo()),
  Demo(
      name: 'PagaeRouteBuilder',
      route: PageRouteBuilderDemo.routeName,
      builder: (context) => PageRouteBuilderDemo()),
  Demo(
      name: 'Animation Controller',
      route: AnimationControllerDemo.routeName,
      builder: (context) => AnimationControllerDemo()),
  Demo(
      name: 'Tweens',
      route: TweenDemo.routeName,
      builder: (context) => TweenDemo()),
  Demo(
      name: "Animated Builder",
      route: AnimatedBulderDemo.routeName,
      builder: (context) => AnimatedBulderDemo()),
  Demo(
      name: 'Custom Tween',
      route: CustomTweenDemo.routeName,
      builder: (context) => CustomTweenDemo()),
  Demo(
      name: 'Tween Sequences',
      route: TweenSequenceDemo.routeName,
      builder: (context) => TweenSequenceDemo())
];
final miscDemos = [
  Demo(
      name: 'Card Swipe',
      route: CardSwipeDemo.routerName,
      builder: (context) => CardSwipeDemo()),
  Demo(
      name: 'Carousel',
      route: CarouselDemo.routerName,
      builder: (context) => CarouselDemo()),
  Demo(
      name: 'Expandable Card',
      route: ExpanCardDemo.routerName,
      builder: (context) => ExpanCardDemo()),
  Demo(
      name: 'Focus Image',
      route: FocusImageDemo.routerName,
      builder: (context) => FocusImageDemo()),
  Demo(
      name: 'Physics Card Drag',
      route: PhysicsCardDragDemo.routeName,
      builder: (conext) => PhysicsCardDragDemo()),
  Demo(
      name: 'Repeating Animation',
      route: RepeatingAnimationDemo.routerName,
      builder: (context) => RepeatingAnimationDemo())
];

final basicDemoRoutes =
    Map.fromEntries(basicDemoe.map((d) => MapEntry(d.route, d.builder)));

final miscDemosRoutes =
    Map.fromEntries(miscDemos.map((d) => MapEntry(d.route, d.builder)));

final allRoutes = <String, WidgetBuilder>{
  ...basicDemoRoutes,
  ...miscDemosRoutes
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Samples Animation',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: allRoutes,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final headerStyle = Theme.of(context).textTheme.title;
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.transfer_within_a_station),
          title: Text("Animation Smaples"),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
                subtitle: Text("This is the Basic Animation"),
                title: Text(
                  "Basic",
                  style: headerStyle,
                )),
            ...basicDemoe.map((d) => DomeTile(d)),
            ListTile(
              title: Text(
                "Misc",
                style: headerStyle,
              ),
              subtitle: Text("This is the materials future"),
            ),
            ...miscDemos.map((d) => DomeTile(d)),
          ],
        ));
  }
}

class DomeTile extends StatelessWidget {
  final Demo demo;
  DomeTile(this.demo);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(demo.name),
        onTap: () {
          Navigator.pushNamed(context, demo.route);
        });
  }
}
