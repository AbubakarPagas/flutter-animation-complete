import 'package:flutter/material.dart';

class TweenSequenceDemo extends StatefulWidget {
  @override
  _TweenSequenceDemoState createState() => _TweenSequenceDemoState();

  static const String routeName = '/basics/tween_sequence';
}

class _TweenSequenceDemoState extends State<TweenSequenceDemo> with SingleTickerProviderStateMixin{
  static const Duration  duration = Duration(seconds: 3);
  AnimationController controller;
  Animation<Color> animation;
  
  static final colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final sequenceItems = <TweenSequenceItem<Color>>[];
    for(var i = 0; i < colors.length; i++){
      final beginColor = colors[i];
      final endColor = colors[(i + 1) % colors.length];
      final weight = 1 / colors.length;

      sequenceItems.add(
        TweenSequenceItem<Color>(tween: ColorTween(begin: beginColor, end: endColor),
        weight: weight
        )
      );
      
    }

    controller = AnimationController(duration: duration, vsync: this,);
    animation = TweenSequence<Color>(sequenceItems).animate(controller);


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
        title: Text("Tween Sequence"),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child){
            return MaterialButton(
              color: animation.value,
              onPressed: () async {
                await controller.forward();
                controller.reset();
              },
              child: child,
            );
          },
          child: Text("Animate", style: TextStyle(color: Colors.white), ) ,
        ),
      ),
    );
  }
}