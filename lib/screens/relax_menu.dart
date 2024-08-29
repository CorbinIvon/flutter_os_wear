import 'package:flutter/material.dart';
import 'package:flutter_os_wear/screens/ambient_screen.dart';
import 'package:flutter_os_wear/wear.dart';

const img = 'assets/images/';

class RelaxView extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;

  RelaxView(this.screenHeight, this.screenWidth);

  @override
  Widget build(BuildContext context) {
    return AmbientMode(
      key: Key('ambient_mode_key'),
      builder: (context, mode) =>
          mode == Mode.active ? HomeRoute() : AmbientWatchFace(),
      update: () {
        // Provide your update function here
      },
    );
  }
}

class HomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            img + 'bkgnd_1.jpg',
            fit: BoxFit.cover,
            width: screenSize.width,
            height: screenSize.height,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/outline_arrow.png',
                          scale: 1.8,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Back',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
              SizedBox(height: 40), // Adjust this as needed
              Center(
                child: Text(
                  'RELAX',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    letterSpacing: 13.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          // Removed the sound buttons and their logic.
        ],
      ),
    );
  }
}
