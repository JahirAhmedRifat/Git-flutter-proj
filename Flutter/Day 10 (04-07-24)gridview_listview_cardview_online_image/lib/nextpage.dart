import 'package:flutter/material.dart';
import 'package:projectnavigator/main.dart';

class Nextpage extends StatelessWidget {
  const Nextpage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Project',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MynextPage(),
    );
  }
}

class MynextPage extends StatefulWidget {
  const MynextPage({super.key});

  @override
  State<MynextPage> createState() => _MynextPageState();
}

class _MynextPageState extends State<MynextPage> {

   List<String> student=["Jahir","Karim","Rifat","Jamal","Jahir","Karim","Rifat","Jamal"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 100,
        title: Text('Welcome to Next Page'),
        backgroundColor: Colors.deepOrange,
      ),

//  ---------------------------- List view -----------------
      body: ListView.builder(
        padding: EdgeInsets.all(8),
         itemCount: student.length,
        itemBuilder: (BuildContext context, int index){
          return Container(
            margin: EdgeInsets.all(5),
            height: 50,
            color: Colors.amber[500],
            child: Center(
              child: Text(student[index]),
            ),
          );
        },
      ),

//  ------------------------ floating action button -----------------------

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back),
        tooltip: 'go home',
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
          // Navigator.pop(context); ( kaj kora ai ta )
        },
      ),
    );
  }
}


