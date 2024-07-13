import 'package:bank_management_system/model_class/createaccount.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

List<Createaccount> objectsFromJson(String str) =>
    List<Createaccount>.from(json.decode(str).map((x) => Createaccount.fromJson(x)));
String objectsToJson(List<Createaccount> data) =>
    json.encode(List<Createaccount>.from(data).map((x) => x.toJson()));

class Customerinfo extends StatefulWidget {
  const Customerinfo({super.key});

  @override
  State<Customerinfo> createState() => _CustomerinfoState();
}

class _CustomerinfoState extends State<Customerinfo> {

  TextEditingController _id = TextEditingController();

  String searchid = "";
  late List<Createaccount> _students = [];

  // Future<List<Student>> showall() async {
  //   final response = await http.get(
  //     Uri.parse('http://192.168.0.220:8080/students'),
  //   );
  //   if (response.statusCode == 200) {
  //     return objectsFromJson(response.body);
  //   } else {
  //     throw Exception("Failed");
  //   }
  // }
  //
  // void show()async{
  //   _students = await showall();
  // }

  Future<List<Createaccount>> showbyid(String id) async {
    var response;

    if(id.length == 0 ){
      //response = await http.get(Uri.parse('http://192.168.0.220:8080/students'),);
      response = await http.get(
        Uri.parse('http://192.168.0.220:8080/search/'+id),
      );
    }else{
      response = await http.get(
        Uri.parse('http://192.168.0.220:8080/search/'+id),
      );
    }

    if (response.statusCode == 200) {
      return objectsFromJson(response.body);
    } else {
      throw Exception("Failed");
    }
  }

  void showid()async{
    _students = await showbyid(_id.text);
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    //show();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search By Id"),
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
                            //showall();
                          } else {
                            searchid = _id.text;
                          }
                          showid();

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
            height: 370,
            child: FutureBuilder<List<Createaccount>>(
              future: showbyid(_id.text),
              builder: (context, snapshot){
                if(snapshot.hasData){
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index){
                      // return ListTile(
                      //   leading: Text(snapshot.data![index].a_number.toString()),
                      //   title: Text(snapshot.data![index].balance.toString()),
                      // );

                      return Center(
                        child: Card(
                          elevation: 50,
                          shadowColor: Colors.black,
                          color: Colors.amber,
                          child: SizedBox(
                            width: 300,
                            height: 370,
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                children:<Widget>[
                                  CircleAvatar(
                                    radius: 80,
                                    // backgroundImage: NetworkImage(slist[index].photo.toString()),  // -- online thake image show korano(copy image address)

                                    backgroundImage: NetworkImage(snapshot.data![index].img.toString()),

                                  ),
                                  SizedBox(height:10),
                                  Text(
                                    snapshot.data![index].a_number.toString(),
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    snapshot.data![index].balance.toString(),
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


                    },);

                }else if(snapshot.hasError){
                  return Text("");
                }else{
                  return CircularProgressIndicator();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
