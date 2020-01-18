import 'package:animations/keys.dart';
import 'package:flutter/material.dart';

class FadeInDemo extends StatefulWidget {
  _FadeInDemoState createState() => _FadeInDemoState();
}

class _FadeInDemoState extends State<FadeInDemo> {

  double opacity = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Image.network(Keys.OWL_URL),
      MaterialButton(
          child: Text(
            'Show details',
            style: TextStyle(color: Colors.blueAccent),
          ),
          onPressed: (){
            setState(() {
              opacity = 1.0;
            });
          }),
      AnimatedOpacity(
        duration: Duration(seconds: 3),
        opacity: opacity,
        child: Column(
          children: <Widget>[
            Text('Type: Owl'),
            Text('Age: 39'),
            Text('Employment: None'),
          ],
        ),
      )
    ]);
  }
}


class ImplicitAnimationsScreen extends StatefulWidget {
  @override
  _ImplicitAnimationsScreenState createState() => _ImplicitAnimationsScreenState();
}

class _ImplicitAnimationsScreenState extends State<ImplicitAnimationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Implicit animations"),
        elevation: 0.0,
      ),
      body: Center(
        child: FadeInDemo(),
      ),
    );
  }
}
