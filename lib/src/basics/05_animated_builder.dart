import 'package:flutter/material.dart';

class AnimatedBulderDemo extends StatefulWidget {
  static const String routeName = '/basics/animated_builder';

  @override
  _AnimatedBulderDemoState createState() => _AnimatedBulderDemoState();
}

class _AnimatedBulderDemoState extends State<AnimatedBulderDemo>
    with SingleTickerProviderStateMixin {
  static const Color beginColor = Colors.deepPurple;
  static const Color endColor = Colors.deepOrange;

  Duration duration = Duration(seconds: 1);
  AnimationController controller;
  Animation<Color> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   controller = AnimationController(vsync: this, duration: duration);
    animation =
        ColorTween(begin: beginColor, end: endColor).animate(controller);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation Builder"),
      ),
      body: Center(
        // AnimatedBuilder handles listening to a given animation and calling the builder
        // whenever the value of the animation change. This can be useful when a Widget
        // tree contains some animated and non-animated elements, as only the subtree
        // created by the builder needs to be re-built when the animation changes.
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return MaterialButton(
              color: animation.value,
              child: child,
              onPressed: () {
                if (controller.status == AnimationStatus.completed) {
                  controller.reverse();
                } else {
                  controller.forward();
                }
              },
            );
            // AnimatedBuilder can also accept a pre-built child Widget which is useful
          // if there is a non-animated Widget contained within the animated widget.
          // This can improve performance since this widget doesn't need to be rebuilt
          // when the animation changes.
          child: Text(
            'Change Color',
            style: TextStyle(color: Colors.white),
          );
          },
        ),
      ),
    );
  }
}
