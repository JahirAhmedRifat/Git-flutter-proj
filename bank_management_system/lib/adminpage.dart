import 'package:bank_management_system/admindrawer.dart';
import 'package:flutter/material.dart';

class Adminpage extends StatelessWidget {
  const Adminpage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:"Admin page",
      theme:ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Myadminpage(),
    );
  }
}

class Myadminpage extends StatefulWidget {
  const Myadminpage({super.key});

  @override
  State<Myadminpage> createState() => _MyadminpageState();
}

class _MyadminpageState extends State<Myadminpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Admindrawer(),
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Welcome To Admin Page',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,

            ),
          ),
          backgroundColor:Colors.greenAccent
      ),

      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('This is admin Page'),
          ],
        ),
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //
      //   },
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

