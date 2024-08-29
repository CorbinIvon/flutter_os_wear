import 'package:flutter/material.dart';
import 'package:flutter_os_wear/screens/ambient_screen.dart';
import 'package:flutter_os_wear/screens/start_screen.dart';
import 'package:flutter_os_wear/wear.dart';

void main() {
  // Ensure the Flutter framework is properly initialized
  WidgetsFlutterBinding.ensureInitialized();
  
  // Add some logging to trace the app's startup process

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Log when MyApp is being built

    return MaterialApp(
      title: 'Flutter Wear App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WatchScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WatchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Log when WatchScreen is being built

    return WatchShape(
      key: Key('watch_shape_key'),
      builder: (context, shape) {

        return InheritedShape(
          key: Key('inherited_shape_key'),
          shape: shape,
          child: AmbientMode(
            key: Key('ambient_mode_key'),
            builder: (context, mode) {

              return mode == Mode.active ? StartScreen() : AmbientWatchFace();
            },
            update: () {
              // Log when the AmbientMode's update method is triggered
            },
          ),
        );
      },
    );
  }
}
