import 'package:bank_management_system/model_class/createaccount.dart';
import 'package:flutter/material.dart';
import 'package:bank_management_system/admindrawer.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


List<Createaccount> objectsFromJson(String str) =>
    List<Createaccount>.from(json.decode(str).map((x) => Createaccount.fromJson(x)));
String objectsToJson(List<Createaccount> data) =>
    json.encode(List<Createaccount>.from(data).map((x) => x.toJson()));

main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:Customerinfo(),
  ),
  );
}

class Customerinfo extends StatefulWidget {
  const Customerinfo({super.key});

  @override
  State<Customerinfo> createState() => _CustomerinfoState();
}

class _CustomerinfoState extends State<Customerinfo> {

  TextEditingController _id = TextEditingController();
  String searchid="";
  late List<Createaccount> _students=[];

  Future<List<Createaccount>> showall() async {
    final response =
    await http.get(Uri.parse('http://192.168.0.104:8080/showapplyforaccount'));
    if (response.statusCode == 200) {
      return objectsFromJson(response.body);
    } else {
      throw Exception("Failed");
    }
  }

  void show() async{
    _students=await showall();
  }

  Future<List<Createaccount>> showallbyid(String id) async {
    var response;

    if(id.length==0){
      response =
      await http.get(Uri.parse('http://192.168.0.104:8080/showapplyforaccount'));
    }else{
      response =
      await http.get(Uri.parse('http://192.168.0.104:8080/getaccountdetails/'+id));
    }

    if (response.statusCode == 200) {
      return objectsFromJson(response.body);
    } else {
      throw Exception("Failed");
    }

  }

  void showbyid() async{
    _students=await showallbyid(searchid);    // _id.text
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
            height: 80,
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
            child:FutureBuilder<List<Createaccount>>(
              future:showallbyid(searchid),
              builder: (context, snapshot){
                if(snapshot.hasData){
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index){
                      return ListTile(
                        leading: Text(snapshot.data![index].a_number.toString()),
                        title:Text(snapshot.data![index].balance.toString()),
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


  // TextEditingController _accnumber = TextEditingController();
  // String searchaccnumber="";
  // late List<Createaccount> _showaccountinfo=[];
  //
  // Future<List<Createaccount>> showallaccount() async {
  //   final response =
  //   await http.get(Uri.parse('http://192.168.0.104:8080/showallCustomerData'));
  //   if (response.statusCode == 200) {
  //     return objectsFromJson(response.body);
  //   } else {
  //     throw Exception("Failed");
  //   }
  // }
  //
  // void show() async{
  //   _showaccountinfo=await showallaccount();
  // }
  //
  // Future<List<Createaccount>> showallbyAccnumber(String a_number) async {
  //   var response;
  //
  //   if(a_number.length==0){
  //     response =
  //     await http.get(Uri.parse('http://192.168.0.104:8080/showallCustomerData'));
  //   }else{
  //     response =
  //     await http.get(Uri.parse('http://192.168.0.104:8080/getaccountdetails/'+a_number.toString()));
  //   }
  //
  //   if (response.statusCode == 200) {
  //     return objectsFromJson(response.body);
  //   } else {
  //     throw Exception("Failed");
  //   }
  //
  // }
  //
  // void viewbyaccnumber() async{
  //   _showaccountinfo=await showallbyAccnumber(searchaccnumber);    // _id.text
  //   setState(() {
  //
  //   });
  //
  // }
  //
  // @override
  // void initState() {
  //   show();
  //   // TODO: implement initState
  //   super.initState();
  // }
  //
  //
  //
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     drawer: Admindrawer(),
  //     appBar: AppBar(
  //       title: Text('Search By Account Number'),
  //     ),
  //
  //     body: Column(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       children: [
  //         Container(
  //           height:80,
  //           child: Form(
  //             child: Row(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Expanded(
  //                   flex:1,
  //                   child: TextFormField(
  //                     controller: _accnumber,
  //                     validator: (String? value) {
  //                       if (value!.isEmpty) {
  //                         return 'please enter account number';
  //                       }
  //                     },
  //                     decoration: InputDecoration(
  //
  //                         labelText: 'Account Number',
  //                         //hintText: 'Enter id',
  //                         border: OutlineInputBorder(
  //                             borderRadius: BorderRadius.circular(5.0))),
  //                   ),
  //                 ),
  //                 Expanded(
  //                   flex: 1,
  //                   child: Padding(
  //                     padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
  //                     child: ElevatedButton(
  //                       onPressed: () {
  //                         if (_accnumber.text.length == 0) {
  //                           show();
  //                         } else {
  //                           searchaccnumber = _accnumber.text;
  //                           viewbyaccnumber();
  //                         }
  //
  //
  //                         setState(() {});
  //                       },
  //                       child: Text("Search"),
  //                       style: ButtonStyle(
  //                         shape: WidgetStateProperty.all(
  //                           RoundedRectangleBorder(
  //                             borderRadius: BorderRadius.circular(5),
  //                             side: BorderSide(color: Colors.red),
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //         SizedBox(
  //           height: 200,
  //           child:FutureBuilder<List<Createaccount>>(
  //             future:showallbyAccnumber(searchaccnumber),
  //             builder: (context, snapshot){
  //               if(snapshot.hasData){
  //                 return ListView.builder(
  //                   itemCount: snapshot.data!.length,
  //                   itemBuilder: (context, index){
  //                     return Center(
  //                       child: Card(
  //                         elevation: 50,
  //                         shadowColor: Colors.red,
  //                         color: Colors.teal,
  //                         child: SizedBox(
  //                           width: 350,
  //                           height: 330,
  //                           child: Padding(
  //                             padding: EdgeInsets.all(0),
  //                             child: Column(
  //                               children:<Widget>[
  //
  //                                 SizedBox(height:5),
  //                                 Text(
  //                                   'Account Number : '+snapshot.data![index].a_number.toString(),
  //                                   style: TextStyle(
  //                                     fontSize: 15,
  //                                   ),
  //                                 ),
  //
  //                                 SizedBox(height:5),
  //                                 Text(
  //                                   'Account Type : '+snapshot.data![index].acctype.toString(),
  //                                   style: TextStyle(
  //                                     fontSize: 15,
  //                                   ),
  //                                 ),
  //
  //                                 SizedBox(height:5),
  //                                 Text(
  //                                   'Nid : '+snapshot.data![index].nid.toString(),
  //                                   style: TextStyle(
  //                                     fontSize: 15,
  //                                   ),
  //                                 ),
  //
  //                                 SizedBox(height:5),
  //                                 Text(
  //                                   'Name : '+snapshot.data![index].name.toString(),
  //                                   style: TextStyle(
  //                                     fontSize: 15,
  //                                   ),
  //                                 ),
  //
  //                                 SizedBox(height:5),
  //                                 Text(
  //                                   'Gender : '+snapshot.data![index].gender.toString(),
  //                                   style: TextStyle(
  //                                     fontSize: 15,
  //                                   ),
  //                                 ),
  //
  //                                 SizedBox(height:5),
  //                                 Text(
  //                                   'Phone : '+snapshot.data![index].mobile.toString(),
  //                                   style: TextStyle(
  //                                     fontSize: 15,
  //                                   ),
  //                                 ),
  //
  //                                 SizedBox(height:5),
  //                                 Text(
  //                                   'Email : '+snapshot.data![index].email.toString(),
  //                                   style: TextStyle(
  //                                     fontSize: 15,
  //                                   ),
  //                                 ),
  //
  //                                 SizedBox(height:5),
  //                                 Text(
  //                                   'Address : '+snapshot.data![index].address.toString(),
  //                                   style: TextStyle(
  //                                     fontSize: 15,
  //                                   ),
  //                                 ),
  //
  //                                 SizedBox(height:5),
  //                                 Text(
  //                                   'Marital Status : '+snapshot.data![index].mar_status.toString(),
  //                                   style: TextStyle(
  //                                     fontSize: 15,
  //                                   ),
  //                                 ),
  //
  //                                 SizedBox(height:5),
  //                                 Text(
  //                                   'Occupation : '+snapshot.data![index].occupation.toString(),
  //                                   style: TextStyle(
  //                                     fontSize: 15,
  //                                   ),
  //                                 ),
  //
  //                                 SizedBox(height:5),
  //                                 Text(
  //                                   'Balance : '+snapshot.data![index].balance.toString(),
  //                                   style: TextStyle(
  //                                     fontSize: 15,
  //                                   ),
  //                                 ),
  //
  //                               ],
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                     );
  //                   },
  //
  //                 );
  //               }else if(snapshot.hasError){
  //                 return Text("Error");
  //               }else{
  //                 return CircularProgressIndicator();
  //               }
  //
  //             },
  //           ) ,
  //         ),
  //       ],
  //     ),
  //
  //   );
  // }
}
