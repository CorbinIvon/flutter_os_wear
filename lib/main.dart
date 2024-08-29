import 'package:flutter/material.dart';
import 'package:flutter_os_wear/screens/ambient_screen.dart';
import 'package:flutter_os_wear/screens/start_screen.dart';
import 'package:flutter_os_wear/wear.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Wear App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: WatchScreen(),
        debugShowCheckedModeBanner: false,
      );
}

class WatchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => WatchShape(
        key: Key('watch_shape_key'), // Added key for WatchShape
        builder: (context, shape) => InheritedShape(
              key: Key('inherited_shape_key'), // Added key for InheritedShape
              shape: shape,
              child: AmbientMode(
                key: Key('ambient_mode_key'), // Added key for AmbientMode
                builder: (context, mode) =>
                    mode == Mode.active ? StartScreen() : AmbientWatchFace(),
                update: () {
                  // Add your update logic here
                  // This could involve refreshing the UI or handling some other aspect of the app's state
                },
              ),
            ),
      );
}
