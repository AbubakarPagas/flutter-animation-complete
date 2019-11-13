import 'package:flutter/material.dart';

class ExpanCardDemo extends StatelessWidget {
  static const String routerName = '/mics/expand_card';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expandable Card"),
      ),
      body: Center(
        child: ExpandCard(),
      ),
    );
  }
}

class ExpandCard extends StatefulWidget {
  @override
  _ExpandCardState createState() => _ExpandCardState();
}

class _ExpandCardState extends State<ExpandCard>
    with SingleTickerProviderStateMixin {
  static const Duration duration = Duration(milliseconds: 300);
  bool selected = false;

  double get size => selected ? 256 : 128;

  void toggleExpanded() {
    setState(() {
      selected = !selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => toggleExpanded(),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnimatedContainer(
            duration: duration,
            width: size,
            height: size,
            curve: Curves.ease,
            child: AnimatedCrossFade(
              duration: duration,
              firstCurve: Curves.easeInCubic,
              secondCurve: Curves.easeInOutCubic,
              crossFadeState: selected
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              //use Potioned.fill() to press the contrain to its children
              // this allow the image to use BoxFit.cover to cover the correct
              layoutBuilder:
                  (topChild, topChildKey, bottomChild, bottomChildKey) {
                return Stack(
                  children: <Widget>[
                    Positioned.fill(
                      key: bottomChildKey,
                      child: bottomChild,
                    ),
                    Positioned.fill(
                      key: topChildKey,
                      child: topChild,
                    )
                  ],
                );
              },
              firstChild: Image.asset(
                'assets/eat_cape_town_sm.jpg',
                fit: BoxFit.cover,
              ),
              secondChild: Image.asset(
                'assets/eat_new_orleans_sm.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
