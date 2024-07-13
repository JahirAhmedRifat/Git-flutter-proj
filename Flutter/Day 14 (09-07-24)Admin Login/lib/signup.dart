import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:student/login.dart';
import 'package:student/main.dart';
import 'package:student/searchid.dart';
import 'package:student/showall.dart';
import 'package:student/student.dart';

List<Student> objectsFromJson(String str) =>
    List<Student>.from(json.decode(str).map((x) => Student.fromJson(x)));
String objectsToJson(List<Student> data) =>
    json.encode(List<Student>.from(data).map((x) => x.toJson()));

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  int x = 0;

  TextEditingController _id = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _round = TextEditingController();

  Future<Student> signupStudent() async {
    Student s = Student(
        id: int.parse(_id.text),
        name: _name.text,
        email: _email.text,
        round: _round.text
    );
    final response = await http.post(
        Uri.parse('http://192.168.0.220:8080/insert'),
        body: jsonEncode(s.toJson()),
        headers: {"content-type": "application/json"});

    if (response.statusCode == 200) {
      return Student.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Form(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller: _id,
                  decoration: InputDecoration(
                    labelText: 'Id',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller: _name,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller: _email,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller: _round,
                  decoration: InputDecoration(
                    labelText: 'Round',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),
              ElevatedButton(
                child: Text('Sign Up'),
                onPressed: () async {
                  Student st = await signupStudent();

                  if (st != null) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyApp()));
                  } else if (_id.text.length == 0) {
                    SnackBar snk =
                        SnackBar(content: Text('enter correct info'));
                    ScaffoldMessenger.of(context).showSnackBar(snk);
                  }
                },
              ),
              ElevatedButton(
                  child: Text('show all'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Showall()));
                  }),
              ElevatedButton(
                  child: Text('Login'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  }),
              ElevatedButton(
                  child: Text('show by id'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Searchid()));
                  }),
              ElevatedButton(
                  child: Text('show by id'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Searchid()));
                  }),

              // ------------------- stateless bojar jonna test --------------
              ElevatedButton(
                  child: Text('submit'),
                  onPressed: () {
                    x=x+1;
                    setState(() {

                    });
                  }
                  ),
              Text('Hello'+x.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
