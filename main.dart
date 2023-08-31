import 'package:flutter/material.dart';
import 'package:to_do_list/pages/2ndpage.dart';

import 'package:to_do_list/utils/routes.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        MyRoute.HomeRoute :(context) => Todo()
      },
      //theme: ThemeData(primaryColor: Color.fromARGB(255, 225,225,225),),
      debugShowCheckedModeBanner: false,
      home: Mainpage()
      
    );  
  }
}

class Mainpage extends StatefulWidget {
  @override
  MainpageState createState() => MainpageState();

}
class MainpageState extends State<Mainpage>
{
  @override
  Widget build(BuildContext context)
  {
      return Material(
      
        color: Color.fromARGB(255, 225,225,225),
        child: Column(
          children: [
            const SizedBox(height: 80.0,),
            const Text(
              "FocusList",
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w400,
                color: Colors.amber,
                ),
            ),
            const SizedBox(height: 20.0,),
            Container(
              height: 350,width: 200,
              child: Image.asset('assets/images/index.png',fit: BoxFit.cover,)
            ),
            const SizedBox(height: 50,),
            ElevatedButton(
              
              style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
              onPressed: () {
              Navigator.pushNamed(context, MyRoute.HomeRoute);
              },
              child: const Text("Get started")
              )
          ],
        ),
      );
  }
}