import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'data_model.dart';
import 'api_service.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Drawer App Example+ ListView'),
        ),
        body: FutureBuilder(
          future: ApiService.fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error loading data');
            } else {
              List<MyData> dataList = snapshot.data as List<MyData>;
              return MyList(dataList);
            }
          },
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Drawer Header',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  // Add navigation or functionality here
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text('Info'),
                onTap: () {
                  // Add navigation or functionality here
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.accessible),
                title: Text('Accessible'),
                onTap: () {
                  // Add navigation or functionality here
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.add),
                title: Text('Add'),
                onTap: () {
                  // Add navigation or functionality here
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.dark_mode),
                title: Text('Theme'),
                onTap: () {
                  // Add navigation or functionality here
                  Navigator.pop(context);
                },
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
                  // Add login logic here
                },
                child: Text('Blank page'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyList extends StatelessWidget {
  final List<MyData> dataList;

  MyList(this.dataList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataList.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage('https://example.com/profile.jpg'), // Replace with your actual image URL
          ),
          title: Text(dataList[index].title),
          subtitle: Text(dataList[index].body),
        );
      },
    );
  }
}