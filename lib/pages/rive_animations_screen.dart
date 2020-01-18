import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/material.dart';

class RiveAnimationsScreen extends StatefulWidget {
  @override
  _RiveAnimationsScreenState createState() => _RiveAnimationsScreenState();
}

class _RiveAnimationsScreenState extends State<RiveAnimationsScreen> {
  FlareControls controls = FlareControls();
  bool _animating = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rive animations"),
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.grey[850],
        child: Center(
          child: GestureDetector(
            
            child: FlareActor(
              'assets/flare/owl.flr',
              alignment: Alignment.bottomCenter,
              shouldClip: false,
              fit: BoxFit.contain,
              controller: controls,
              isPaused: !_animating,
            ),
          ),
        ),
      ),
      floatingActionButton: RawMaterialButton(
        fillColor: Colors.red,
        shape: StadiumBorder(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 16.0,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: !_animating
                ? <Widget>[
                    Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      "Play",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ]
                : <Widget>[
                    Icon(
                      Icons.stop,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      "Stop",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
          ),
        ),
        onPressed: () {
          if (_animating) {
            controls.play("idle");
          } else {
            controls.play("Animate OWL LOOP");
          }
          setState(() {
            _animating = !_animating;
          });
        },
      ),
    );
  }
}
