import 'package:flutter/material.dart';
import 'dart:math';

double generateBorderRadius() => Random().nextDouble() * 64;
double generateMargin() => Random().nextDouble() * 64;
Color generateColor() => Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));

class AnimationContainerDemo extends StatefulWidget {
static String routeName = '/basics/01_animation_container';

  @override
  _AnimationContainerDemoState createState() => _AnimationContainerDemoState();
}

class _AnimationContainerDemoState extends State<AnimationContainerDemo> {
  Color color;
  double borderRadius;
  double margin;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    color = Colors.deepPurple;
    borderRadius = generateBorderRadius();
    margin= generateMargin();
  }
  void change(){
    setState(() {
     color = generateColor();
     borderRadius = generateBorderRadius();
     margin = generateMargin();
    });
  }
  
  @override
  Widget build(BuildContext context) {
     // This widget is built using an AnimatedContainer, one of the easiest to use
    // animated Widgets. Whenever the AnimatedContainer's properties, such as decoration,
    // change, it will handle animating from the previous value to the new value. You can
    // specify both a Duration and a Curve for the animation.
    // This Widget is useful for designing animated interfaces that just need to change
    // the properties of a container. For example, you could use this to design expanding
    // and shrinking cards.
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation Container"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                width: 328,
                height: 328,
                child: AnimatedContainer(
                  margin: EdgeInsets.all(margin),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                  duration: const Duration(milliseconds: 400),
                ),
              ),
            ),
            RaisedButton(
              child: Text(
                'change',
              ),
              onPressed: () => change(),
            ),
          ],
        ),
      ),
    );
  }
}