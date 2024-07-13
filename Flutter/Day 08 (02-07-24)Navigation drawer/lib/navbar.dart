import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:navigation_drawer/page1.dart';

class NavBar extends StatelessWidget{

  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding:EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              accountName: Text('Md. Jahir Uddin'), 
              accountEmail: Text('abc@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset('images/books.png'),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.pinkAccent,
              image: DecorationImage(image: AssetImage('images/Python.png'),fit: BoxFit.cover)
            ),
          ),

          ListTile(
            leading: Icon(Icons.file_upload),
            title: Text('Upload Shot'),
            onTap: ()=>print('Upload tapped'),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: ()=>print('Upload tapped'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: ()=>print('Upload tapped'),
          ),
          ListTile(
            leading: Icon(Icons.contacts),
            title: Text('Contact'),
            onTap: ()=>print('Upload tapped'),
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text('Email'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Page1()));
            },
          ),
        ],
      ),
    );
  }

}