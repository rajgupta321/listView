import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:untitled3/frontpage.dart';
import 'package:untitled3/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Page',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blueGrey,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.teal,
        // Add more properties as needed for the dark theme
      ),
      themeMode: ThemeMode.system,
      home: Frontpage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String name = "";
  bool changeButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
               CircleAvatar(
                backgroundImage: AssetImage('assets/images/sketch1642078613345 (2).png'),
                backgroundColor: Colors.yellowAccent,
                radius: 100,
              ),
            // Add the image here
            SizedBox(height: 20.0),
            Text(
              ' Walcome $name',
              style:TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              )
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
                onChanged: (value){
                  name = value;
                setState(() {});
                },
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                setState(() {
                  changeButton= true;
                });
                await Future.delayed(Duration(seconds:1));
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                width: changeButton?50 : 150,
                height: 50,
                alignment: Alignment.center,
                child:changeButton?
                Icon(Icons.done, color:
                Colors.teal, shadows: [Shadow(color: Colors.black)], )
                 :Text(
                  "login",
                style: TextStyle(
                  color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 18),
                ),
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.circular( changeButton?50:8)
                ),
              ),
            )

            //ElevatedButton(
             // onPressed: () {
             //   Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
                // Add login logic here
             // },
             // child: Text('Login'),
           // ),
          ],
        ),
      ),
    );
  }
}

