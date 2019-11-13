import 'package:flutter/material.dart';

class TypewriterTween extends Tween<String> {
  TypewriterTween({String begin = '', String end = ''})
      : super(begin: begin, end: end);

  String lerp(double t) {
    var cutoff = (end.length * t).round();
    return end.substring(0, cutoff);
  }
}

class CustomTweenDemo extends StatefulWidget {
  static const String routeName = '/basics/custom_tweens';

  _CustomTweenDemoState createState() => _CustomTweenDemoState();
}

class _CustomTweenDemoState extends State<CustomTweenDemo>
    with SingleTickerProviderStateMixin {
  static final Duration _duration = Duration(seconds: 10);
  static final String message = loremIpsum;

  Animation<String> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: _duration);
    animation = TypewriterTween(end: message).animate(controller);
  }

  @override
  void dispose() { 
    super.dispose();
    controller.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("custom Animation"),
        actions: <Widget>[
          MaterialButton(
            child: Text(
              controller.status == AnimationStatus.completed
              ?"Delete Essay"
              :"Write Essay",
              style: TextStyle(color: Colors.white),
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
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch, 
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Container(
                  child: AnimatedBuilder(
                    animation: animation,
                    builder: (context, child) {
                      return Text('${animation.value}', style: TextStyle(color: Colors.red, fontSize: 6, fontFamily: "SpecialElite"));
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

const String loremIpsum = '''
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
                'controller.value.toStringAsFixed(2)',
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
''';
