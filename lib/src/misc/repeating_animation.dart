import 'package:flutter/material.dart';

class RepeatingAnimationDemo extends StatefulWidget {
  static const String routerName = 'misc/repeating_animation';
  @override
  _RepeatingAnimationDemoState createState() => _RepeatingAnimationDemoState();
}

class _RepeatingAnimationDemoState extends State<RepeatingAnimationDemo>
    with SingleTickerProviderStateMixin {
  Animation<BorderRadius> _borderRadius;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this)
          ..repeat(reverse: true);

    _borderRadius = BorderRadiusTween(
      begin: BorderRadius.circular(100.0),
      end: BorderRadius.circular(0.0),
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Repeating Animation"),
      ),
      body: Center(
        child: AnimatedBuilder(
            animation: _borderRadius,
            builder: (context, child) {
              return Container(
                width: 200,
                height: 200,
                // color: Colors.blue,
                decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: _borderRadius.value),
              );
            }),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
}
