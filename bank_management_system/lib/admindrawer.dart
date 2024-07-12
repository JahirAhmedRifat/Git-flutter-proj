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
          DrawerHeader(
            decoration: BoxDecoration(
                color: Color(0xff007C00),
                image: DecorationImage(image: AssetImage('images/user_logo2.jpg'),fit: BoxFit.cover)
            ),
            padding: EdgeInsets.fromLTRB(5.0,10,0,0),  // Set padding here
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 105),
                Row(
                  children: [
                    Text('Admin ', style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 24)),

                    Text('Panel ',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 24)),
                  ],
                ),
              ],
            ),
          ),


          // ---------------- drawer body --------------------------

          ListTile(
            leading: Icon(Icons.home,color: Colors.red),
            title: Text(
              'Home',
              style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 20),
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
            },
          ),

          ListTile(
            leading: Icon(Icons.view_agenda),
            title: Text('Show apply for account',
                style: TextStyle(fontSize: 18)
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Showapplyforaccount()));
            },
          ),

          ListTile(
            leading: Icon(Icons.view_agenda),
            title: Text('View customer accounts', style: TextStyle(fontSize: 18)),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Showallcustomeraccount()));
            },
          ),

          ListTile(
            leading: Icon(Icons.search_rounded),
            title: Text('Customer Details'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Customerinfo()));
            },
          ),

          ListTile(
            leading: Icon(Icons.view_array_outlined),
            title: Text('View Transaction'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Showtransaction()));
            },
          ),

          ListTile(
            leading: Icon(Icons.view_cozy_outlined),
            title: Text('View Loan Transaction'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Showloantransaction()));
            },
          ),

          SizedBox(height: 100),

          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
            },
          ),

        ],
      ),
    );
  }
}
