import 'package:bank_management_system/userdrawer.dart';
import 'package:flutter/material.dart';

class Userpage extends StatelessWidget {
  const Userpage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:"Userpage",
      theme:ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Myuserpage(),
    );
  }
}

class Myuserpage extends StatefulWidget {
  const Myuserpage({super.key});

  @override
  State<Myuserpage> createState() => _MyuserpageState();
}

class _MyuserpageState extends State<Myuserpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Userdrawer(),
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Welcome To Customer Page',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,

            ),
          ),
          backgroundColor:Colors.green
      ),

      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('This is Customer Page'),
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

