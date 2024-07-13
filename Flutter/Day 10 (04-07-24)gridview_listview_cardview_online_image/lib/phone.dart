import 'package:flutter/material.dart';
import 'package:projectnavigator/main.dart';
import 'package:projectnavigator/student.dart';

class Phone extends StatelessWidget {
  const Phone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Project',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyPhone(),
    );
  }
}

class MyPhone extends StatefulWidget {
  const MyPhone({super.key});

  @override
  State<MyPhone> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {

  List<Student> slist=[
    Student("Jahir", "In their range of colour, seemingly endless variety of  from minute blossoms to", "https://e7.pngegg.com/pngimages/119/921/png-clipart-flower-dahlia-flower-flower-garden-annual-plant-thumbnail.png"),
    Student("Rifat", "In their range of colour, size, form, and anatomical arrangement, flowers present a seemingly endless variety of combinations. They range in size from minute blossoms to", "https://e7.pngegg.com/pngimages/119/921/png-clipart-flower-dahlia-flower-flower-garden-annual-plant-thumbnail.png"),
    Student("Kamal", "In their range of colour, size, form, and anatomical arrangement, flowers present a seemingly endless variety of combinations. They range in size from minute blossoms to", "https://e7.pngegg.com/pngimages/119/921/png-clipart-flower-dahlia-flower-flower-garden-annual-plant-thumbnail.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 100,
        title: Text('Welcome to Card Page'),
        backgroundColor: Colors.lightGreen,
      ),

      body: ListView.builder(
          padding: EdgeInsets.all(8),
          itemCount:slist.length,
        itemBuilder: (BuildContext context, int index){
          return Center(
            child: Card(
              elevation: 50,
              shadowColor: Colors.black,
              color: Colors.amber,
              child: SizedBox(
                width: 300,
                height: 500,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children:<Widget>[
                      CircleAvatar(
                        radius: 100,
                        backgroundImage: NetworkImage(slist[index].photo.toString()),
                        //  backgroundImage: NetworkImage("https://e7.pngegg.com/pngimages/119/921/png-clipart-flower-dahlia-flower-flower-garden-annual-plant-thumbnail.png"),
                      ),
                      SizedBox(height:10),
                      Text(
                        slist[index].name.toString(),
                        style: TextStyle(
                        fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                      ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        slist[index].details.toString(),
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                      ),

                      SizedBox(
                        width: 300,
                        child: ElevatedButton(
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:<Widget> [
                                Text("back home"),
                              ],

                            ),
                          ),

                          onPressed: (){

                          },

                          style: ButtonStyle(
                              backgroundColor:WidgetStateProperty.all(Colors.green),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),

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

