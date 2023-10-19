import 'package:flutter/material.dart';
import 'package:untitled3/main.dart';

void main() {
  runApp(MyApp());
}

class Frontpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // Start with the SplashScreen
      routes: {
        '/home': (context) => LoginPage(), // Define routes for your screens
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to home screen after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Add the image here.
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/monkey-man.jpg'),
              backgroundColor: Colors.yellowAccent,
              radius: 150,
            ),
            SizedBox(height: 20.0),
            Text(' your childhood photo',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
