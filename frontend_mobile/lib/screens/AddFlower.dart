import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddFlower extends StatelessWidget {
  static const String routeName='/';
  const AddFlower({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Add a Flower';  
    return MaterialApp(  
      title: appTitle,  
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ), 
      home: Scaffold(  
        appBar: AppBar(  
          title: const Text(appTitle),  
          actions: [
          IconButton(
            onPressed: (){
              // Navigator.of(context).pushNamed(DataTile.routeName);
            }, 
            icon: const Icon(
              Icons.home,
              ),
          ),
        ],
        ),  
        body: const MyCustomForm(),  
      ),  
    );  
  }
}
// Create a Form widget.  
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);
  
  @override  
  MyCustomFormState createState() {  
    return MyCustomFormState();  
  }  
}  
// Create a corresponding State class. This class holds data related to the form.  
class MyCustomFormState extends State<MyCustomForm> {  
  // Create a global key that uniquely identifies the Form widget  
  // and allows validation of the form.  
  
  @override  
  Widget build(BuildContext context) {  
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
    return Scaffold(
      body: Stack(
        
        children: <Widget>[
          Container(
            // Here the height of the container is 45% of our total height
            height: size.height,
            decoration: const BoxDecoration(
              color: Color.fromARGB(172, 247, 225, 30),
              image: DecorationImage(
                alignment: Alignment.topLeft,
                image: AssetImage("assets/images/x.png"),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Image(
                    image: AssetImage("assets/images/mal.png"),
                    alignment: Alignment.topRight,
                    height: 200,
                    width: 250,
                  ),
                 
                   Text(
                    "Add a Flower",
                    style: GoogleFonts.lato(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                    )
                   
                  ), 
                 Container(  
                    padding: const EdgeInsets.only(left: 150.0, top: 20.0),  
                  ), 
                  TextFormField(  
                    decoration: InputDecoration( 
                       border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Enter the flower Name',  
                    labelText: 'Enter the flower Name',  
                    ),  
                  ),

                  Container(  
                    padding: const EdgeInsets.only(left: 150.0, top: 20.0),  
                  ), 

                  TextFormField(  
                    decoration: InputDecoration( 
                       border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Enter the common names',  
                    labelText: 'Enter the common names',  
                    ),  
                  ),

                  Container(  
                    padding: const EdgeInsets.only(left: 150.0, top: 15.0),  
                  ),  
                    
                   TextFormField(  
                    decoration: InputDecoration( 
                       border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Enter the flower description',  
                    labelText: 'Enter the flower description',  
                    ),  
                  ),
                  Container(  
                    padding: const EdgeInsets.only(left: 150.0, top: 15.0),  
                  ),
                  Container(  
                  margin: const EdgeInsets.all(10),  
                  alignment: Alignment.center,
                  child: ElevatedButton(
                      child: const Text("Add Flower"),
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 244, 54, 143),
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0)
                      ),
                    )
                   ),  
             
               ],
              ),
            ),
          )
          
        ],
      ),
      
    );
  }  
}