import 'package:flutter/material.dart';
import 'package:projectnavigator/email.dart';
import 'package:projectnavigator/nextpage.dart';
import 'package:projectnavigator/phone.dart';
import 'package:projectnavigator/settings.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Project',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ---------------------- navigation drawer -----------------

      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Md. Jahir Uddin'),
              accountEmail: Text('jahir@gmail.com'),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.asset('images/jpg_44-2.jpg'),
                ),
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/jpg_44-2.jpg'),
                      fit: BoxFit.cover)),
            ),

            ListTile(
              leading: Icon(Icons.home),
              title: Text('Next Page'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Nextpage()));
              },
            ),

            ListTile(
              leading: Icon(Icons.call),
              title: Text('Phone'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Phone()));
              },
            ),

            ListTile(
              leading: Icon(Icons.email),
              title: Text('Email'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Email()));
              },
            ),

            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Settings()));
              },
            ),

          ],
        ),
      ),

      // ---------------------- app bar-----------------

      appBar: AppBar(
        // titleSpacing: 100,
        centerTitle: true,
        title: Text('Welcome to Home Page'),
        backgroundColor: Colors.indigoAccent,
      ),

      // ---------------------- body -----------------

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          Text('This is a Home Pasge'),

          // ----------------------- grid view ------------------------------------

          Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                padding: EdgeInsets.all(20),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                primary: true,
                children:<Widget> [
                  
                  Container(
                    padding: EdgeInsets.all(8),
                    child: SizedBox.fromSize(
                      size: Size(80,80),
                      child: ClipOval(
                        child: Material(
                          color: Colors.orange,
                          child: InkWell(
                            splashColor: Colors.green,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:<Widget>[
                                Icon(Icons.email,size: 50,),
                                Text('Contact',style: TextStyle(fontSize: 20),),
                              ],
                            ),
                            onTap: (){
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => Nextpage()));
                            },
                          ),
                        ),
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.all(8),
                    child: SizedBox.fromSize(
                      size: Size(80,80),
                      child: ClipOval(
                        child: Material(
                          color: Colors.orange,
                          child: InkWell(
                            splashColor: Colors.green,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:<Widget>[
                                Icon(Icons.person,size: 30,),
                                Text('People',style: TextStyle(fontSize: 15),),
                              ],
                            ),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Phone()));
                            },
                          ),
                        ),
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.all(8),
                    child: SizedBox.fromSize(
                      size: Size(80,80),
                      child: ClipOval(
                        child: Material(
                          color: Colors.orange,
                          child: InkWell(
                            splashColor: Colors.green,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:<Widget>[
                                Icon(Icons.search,size: 50,),
                                Text('Search',style: TextStyle(fontSize: 15),),
                              ],
                            ),
                            onTap: (){

                            },
                          ),
                        ),
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.all(8),
                    child: SizedBox.fromSize(
                      size: Size(80,80),
                      child: ClipOval(
                        child: Material(
                          color: Colors.blue,
                          child: InkWell(
                            splashColor: Colors.green,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:<Widget>[
                                Icon(Icons.settings,size: 50,),
                                Text('Settings',style: TextStyle(fontSize: 15),),
                              ],
                            ),
                            onTap: (){

                            },
                          ),
                        ),
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.all(8),
                    child: SizedBox.fromSize(
                      size: Size(80,80),
                      child: ClipOval(
                        child: Material(
                          color: Colors.orange,
                          child: InkWell(
                            splashColor: Colors.red,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:<Widget>[
                                Icon(Icons.access_alarm,size: 50,),
                                Text('Alarm',style: TextStyle(fontSize: 20),),
                              ],
                            ),
                            onTap: (){

                            },
                          ),
                        ),
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.all(8),
                    child: SizedBox.fromSize(
                      size: Size(80,80),
                      child: ClipOval(
                        child: Material(
                          color: Colors.orange,
                          child: InkWell(
                            splashColor: Colors.green,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:<Widget>[
                                Icon(Icons.email,size: 50,),
                                Text('Contact',style: TextStyle(fontSize: 20),),
                              ],
                            ),
                            onTap: (){

                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],

              ),
          ),

        ],
      ),

      // ---------------------- floating action button -----------------

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back),
        tooltip: 'go next page',
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Nextpage()));
        },
      ),
    );
  }
}
