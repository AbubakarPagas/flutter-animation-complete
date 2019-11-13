import 'package:flutter/material.dart';

class AnimationControllerDemo extends StatefulWidget {

   static String routeName = '/basics/03_animation_contoller';

  @override
  _AnimationControllerDemoState createState() => _AnimationControllerDemoState();
}

class _AnimationControllerDemoState extends State<AnimationControllerDemo> with SingleTickerProviderStateMixin{

static  Duration _duration = Duration(seconds: 1);
AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    controller = AnimationController(vsync: this, duration: _duration);
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
     // AnimationController is a stateful resource that needs to be disposed when
    // this State gets disposed.
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation Controller"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 200),
              child: Text(
                '${controller.value.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.display2,
                textScaleFactor: 1 + controller.value,
              ),
            ),
            RaisedButton(
              child: Text("animate"),
              onPressed: (){
                 (controller.status == AnimationStatus.completed)? controller.reverse(): controller.forward();
                //   controller.reverse();
                // } else {
                //   controller.forward();
                // }
              },
            )
          ],
        ),
      ),
    );
  }
}