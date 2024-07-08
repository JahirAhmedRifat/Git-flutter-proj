import 'package:bank_management_system/adminpage.dart';
import 'package:bank_management_system/customerinfo.dart';
import 'package:bank_management_system/main.dart';
import 'package:bank_management_system/showallcustomeraccount.dart';
import 'package:bank_management_system/showapplyforaccount.dart';
import 'package:bank_management_system/showloantransaction.dart';
import 'package:bank_management_system/showtransaction.dart';
import 'package:flutter/material.dart';

class Admindrawer extends StatelessWidget {
  const Admindrawer({super.key});

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

              color: Colors.green,
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
            leading: Icon(Icons.arrow_forward_sharp),
            title: Text('Admin page'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Adminpage()));
            },
          ),

          ListTile(
            leading: Icon(Icons.arrow_forward_sharp),
            title: Text('Show apply for account'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Showapplyforaccount()));
            },
          ),

          ListTile(
            leading: Icon(Icons.arrow_forward_sharp),
            title: Text('Show all Customer accounts'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Showallcustomeraccount()));
            },
          ),

          ListTile(
            leading: Icon(Icons.arrow_forward_sharp),
            title: Text('View Customer info'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Customerinfo()));
            },
          ),

          ListTile(
            leading: Icon(Icons.arrow_forward_sharp),
            title: Text('View Transaction'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Showtransaction()));
            },
          ),

          ListTile(
            leading: Icon(Icons.arrow_forward_sharp),
            title: Text('View Loan Transaction'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Showloantransaction()));
            },
          ),

        ],
      ),
    );
  }
}
