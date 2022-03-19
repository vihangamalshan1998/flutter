import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'background.dart';
class Body extends StatelessWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/images/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            TextFormField(  
              decoration: InputDecoration( 
                
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                fillColor: Color.fromARGB(255, 217, 186, 247),
                filled: true,
                hintText: 'Username',  
                labelText: 'Username',
              ),  
              style: const TextStyle(
                color:Colors.black,
                fontWeight:FontWeight.bold,
                
              ),
              
            ),
            SizedBox(height: size.height * 0.03),
            TextFormField(
              decoration: InputDecoration( 
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                fillColor: const Color(0xFF6F35A5),
                filled: true,
                
                hintText: 'Password',  
                labelText: 'Password',  
              ),  
            ),
          ]
        )
      ),
    );
  }
}