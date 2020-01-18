import 'package:animations/keys.dart';
import 'package:animations/pages/implicit_animations_screen.dart';
import 'package:animations/pages/rive_animations_screen.dart';
import 'package:animations/pages/staggered_animations_screen.dart';
import 'package:animations/widgets/app_drawer.dart';
import 'package:animations/widgets/photo.dart';
import 'package:animations/widgets/radial_expansion.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: Keys.FONT_FAMILY,
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        "/rive": (BuildContext context){
          return RiveAnimationsScreen();
        },
        "/implicit": (BuildContext context){
          return ImplicitAnimationsScreen();
        },
        "/staggered": (BuildContext context){
          return StaggerDemo();
        },
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  static const double kMinRadius = 32.0;
  static const double kMaxRadius = 128.0;
  static const opacityCurve = const Interval(0.0, 0.75, curve: Curves.fastOutSlowIn);

  static RectTween _createRectTween(Rect begin, Rect end) {
    return MaterialRectCenterArcTween(begin: begin, end: end);
  }

  @override
  Widget build(BuildContext context) {
    //timeDilation = 15.0;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).canvasColor,
        iconTheme: IconThemeData(
          color: Keys.DEFAULT_COLOR,
        ),
      ),
      drawer: AppDrawer(),
      body: Stack(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildHero(context, Keys.OWL_URL, 'Owl'),
            ],
          ),
          Center(
            child: Text(
              "Animations",
              style: TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 72,
                color: Keys.DEFAULT_COLOR,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildPage(BuildContext context, String imageName, String description) {
    return Container(
      color: Theme.of(context).canvasColor,
      child: Center(
        child: Card(
          elevation: 8.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: kMaxRadius * 2.0,
                height: kMaxRadius * 2.0,
                child: Hero(
                  createRectTween: _createRectTween,
                  tag: imageName,
                  child: RadialExpansion(
                    minRadius: kMinRadius,
                    maxRadius: kMaxRadius,
                    child: Photo(
                      photo: imageName,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
              ),
              Text(
                description,
                style: TextStyle(fontWeight: FontWeight.bold),
                textScaleFactor: 3.0,
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHero(BuildContext context, String imageName, String description) {
    return Container(
      width: kMinRadius * 2.0,
      height: kMinRadius * 2.0,
      child: Hero(
        createRectTween: _createRectTween,
        tag: imageName,
        child: RadialExpansion(
          minRadius: kMinRadius,
          maxRadius: kMaxRadius,
          child: Photo(
            photo: imageName,
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder<void>(
                  pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                    return AnimatedBuilder(
                        animation: animation,
                        builder: (BuildContext context, Widget child) {
                          return Opacity(
                            opacity: opacityCurve.transform(animation.value),
                            child: _buildPage(context, imageName, description),
                          );
                        }
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
