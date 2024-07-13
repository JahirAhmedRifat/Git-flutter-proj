import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:student/student.dart';

List<Student> objectsFromJson(String str) =>
    List<Student>.from(json.decode(str).map((x) => Student.fromJson(x)));
String objectsToJson(List<Student> data) =>
    json.encode(List<Student>.from(data).map((x) => x.toJson()));

main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:Searchid() ,
  ),
  );
}

class Searchid extends StatefulWidget {
  const Searchid({super.key});

  @override
  State<Searchid> createState() => _SearchidState();
}

class _SearchidState extends State<Searchid> {
  TextEditingController _id = TextEditingController();
  String searchid="";
  late List<Student> _students=[];

  Future<List<Student>> showall() async {
    final response =
    await http.get(Uri.parse('http://192.168.0.220:8080/students'));
    if (response.statusCode == 200) {
      return objectsFromJson(response.body);
    } else {
      throw Exception("Failed");
    }
  }

  void show() async{
    _students=await showall();
  }

  Future<List<Student>> showallbyid(String id) async {
    var response;

    if(id.length==0){
       response =
      await http.get(Uri.parse('http://192.168.0.220:8080/students'));
    }else{
       response =
      await http.get(Uri.parse('http://192.168.0.220:8080/search/'+id));
    }

    if (response.statusCode == 200) {
      return objectsFromJson(response.body);
    } else {
      throw Exception("Failed");
    }

  }

  void showbyid() async{
    _students=await showallbyid(searchid);
    setState(() {

    });

  }

  @override
  void initState() {
    show();
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search By Id'),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: Form(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: _id,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'please enter id';
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'id',
                          //hintText: 'Enter id',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_id.text.length == 0) {
                            show();
                          } else {
                            searchid = _id.text;
                            showbyid();
                          }


                          setState(() {});
                        },
                        child: Text("Search"),
                        style: ButtonStyle(
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 200,
            child:FutureBuilder<List<Student>>(
              future:showallbyid(searchid),
              builder: (context, snapshot){
                if(snapshot.hasData){
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index){
                      return ListTile(
                        leading: Text(snapshot.data![index].id.toString()),
                        title:Text(snapshot.data![index].name.toString()),
                      );
                    },

                  );
                }else if(snapshot.hasError){
                  return Text("Error");
                }else{
                  return CircularProgressIndicator();
                }

              },
            ) ,
          ),
        ],
      ),

    );
  }

}
