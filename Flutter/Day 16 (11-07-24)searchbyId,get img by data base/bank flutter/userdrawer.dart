import 'package:bank_management_system/applyaccount.dart';
import 'package:bank_management_system/main.dart';
import 'package:bank_management_system/userpage.dart';
import 'package:flutter/material.dart';

class Userdrawer extends StatelessWidget {
  const Userdrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding:EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Services'),
            accountEmail: Text('-----------------'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                // child: Image.asset('images/books.png'),
              ),
            ),
            decoration: BoxDecoration(

              color: Colors.pinkAccent,
              // image: DecorationImage(image: AssetImage('images/Python.png'),fit: BoxFit.cover)
            ),
          ),

          // ---------------- drawer body --------------------------

          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
            },
          ),
          ListTile(
            leading: Icon(Icons.arrow_right_alt_outlined),
            title: Text('Apply account'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Applyaccount()));
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Customer'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Userpage()));
            },
          ),

        ],
      ),
    );
  }
}
