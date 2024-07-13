import 'package:flutter/material.dart';

main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:Calculation() ,
  ),
  );
}

class Calculation extends StatefulWidget {
  const Calculation({super.key});

  @override
  State<Calculation> createState() => _CalculationState();
}

class _CalculationState extends State<Calculation> {
  String? dd="web";

  TextEditingController _x1 = TextEditingController();
  TextEditingController _x2 = TextEditingController();
  TextEditingController _x3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mayh Calculation'),

      ),
      body: Form(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller: _x1,
                  decoration: InputDecoration(
                    labelText: 'Number 1',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller: _x2,
                  decoration: InputDecoration(
                    labelText: 'Number 2',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),

              ElevatedButton(
                child: Text('Add'),
                onPressed: () {

                },
              ),

              Row(
                children: [
                  DropdownButton(
                      value: dd,

                      items:<DropdownMenuItem<String>>[
                        DropdownMenuItem<String>(
                          child: Text('Web'),
                          value: "web",
                        ),

                        DropdownMenuItem<String>(
                          child: Text('Image'),
                          value: "image",
                        ),

                        DropdownMenuItem<String>(
                          child: Text('News'),
                          value: "news",
                        ),

                        DropdownMenuItem<String>(
                          child: Text('Shopping'),
                          value: "shopping",
                        ),

                      ],

                      onChanged: (String? value){
                        setState(() {
                          dd=value;
                          // SnackBar s = SnackBar(content: Text(dd.toString()));
                          // ScaffoldMessenger.of(context).showSnackBar(s);
                        });
                      }
                  ),
                ],
              ),


              // ------------------- stateless bojar jonna test --------------
              // ElevatedButton(
              //     child: Text('submit'),
              //     onPressed: () {
              //       x=x+1;
              //       setState(() {
              //
              //       });
              //     }
              // ),
              // Text('Hello'+x.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
