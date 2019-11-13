import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class TweenDemo extends StatefulWidget {
  static const String routeName = '/basics/tweens';
  @override
  _TweenDemoState createState() => _TweenDemoState();
}

class _TweenDemoState extends State<TweenDemo> with SingleTickerProviderStateMixin{
  static const Duration _duration = Duration(seconds: 1);
  static const double accountBalancer = 1000000;
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: _duration);
    animation = Tween(begin: 0.0, end: accountBalancer).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("tween"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 200),
              child: Text(
                '\$${animation.value.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 24),
              ),
            ),
            RaisedButton(
              child: Text(controller.status == AnimationStatus.completed
              ? 'Buy a Mansion' : 'Win lottery'
              ),
              onPressed: () {
                if (controller.status == AnimationStatus.completed) {
                  controller.reverse();
                } else {
                  controller.forward();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
