import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:parking/models/ultra_data.dart';
import 'package:provider/provider.dart';
import 'dart:ui';
/*
  this class diveded  to 4 row
  1   => section a,b... & enter
  2   => car slot ....to end
  end    => for exit
  */
class park_slot extends StatefulWidget {
  @override
  State<park_slot> createState() => _park_slotState();
}

class _park_slotState extends State<park_slot> {
  @override
  void initState() {
    super.initState();
    ultra_data().getData();
  }

/*String? test;
String? b;

  getData()async{

    FirebaseFirestore.instance.collection("carInfo").snapshots().listen((event) {

      event.docs.forEach((element) {


        setState(() {
          test= element.data()["isreservation"];
          b=element.data()["b"];
          print("this is B =${b}");
        });
      });
    });
  }*/
  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container( width:size.width,
              height: 25, ),
            Container
              (
              width:size.width,
              height: 65,
              child: Row(
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 0,bottom: 0),
                        child: Container(
                          width:70,
                          height:60,
                          decoration: const BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle
                          ),
                          child: MaterialButton(
                            onPressed: (  ) { Navigator.of(context).pushNamed('parking_list');
                            setState(() {} );
                            },
                            child: Icon(
                              Icons.arrow_back_ios_new_sharp,size: 40,color: Colors.white,),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 90),
                  Text(" Car Slot",
                    style:TextStyle(color: Colors.teal,fontSize: 24, fontWeight:FontWeight.bold,),
                  ),
                  SizedBox(width: 118),
                  Stack(
                    children: [
                      Container(
                        width:40,
                        height:40,
                        margin: EdgeInsets.only(top: 25),
                        decoration: const BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0,left: 70,),
                  child: Card(
                    color: Colors.blue,
                    elevation:2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: SizedBox(
                        width: 25,
                        height: 24,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: 'A',
                                      style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.brown)),

                                ]),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width:45),
                Padding(
                  padding: EdgeInsets.only(top: 50,),
                  child: Container(
                    height: 30,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(  colors: [Colors.green, Colors.teal]),
                    ),
                    child: MaterialButton( onPressed:
                        (
                        /// go to next page
                        ){
                      // Navigator.of(context).pushNamed('parking_list');
                    },
                      child: Text(
                          'Enter',
                          style: TextStyle(color: Colors.white,fontSize: 18)
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0,left: 45,),
                  child: Card(
                    color: Colors.blue,
                    elevation:2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: SizedBox(
                        width: 25,
                        height: 24,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: 'B',
                                      style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.brown)),
                                ]),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),///first row to the section a ,b
            ///other to car slot ^_^, have string to take slot no.
            Row(
              children: [
                Padding (
                  padding: EdgeInsets.only(left: 20,right: 20),
                  child: MaterialButton(
                    onPressed:(){
                     Navigator.of(context).pushNamed('car_slot');
                     setState(() {} );
                     },
                    child: Container(
                      //  flex: 2,
                      height: 80,
                      //decoration: DottedDecoration()
                      decoration:DottedDecoration(
                        shape: Shape.line,
                        color: Colors.blueGrey,
                        strokeWidth: 4,
                        dash:[10, 5],

                      ),
                      child: Container(
                        //  flex: 2,
                        height: 80,
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Colors.blueGrey, width:2, style: BorderStyle.solid),
                            left: BorderSide(color: Colors.blueGrey, width: 4, style: BorderStyle.solid),
                          ),
                        ),

                        child: Stack(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              //color: Colors.lightBlueAccent,
                              margin: EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  color: Colors.lightBlueAccent,
                                  //  shape: BoxShape.circle,
                                  //border:Border( top: BorderSide(10),),

                                  gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.topLeft,
                                    colors: [
                                      Colors.white60,
                                      Colors.grey,
                                      // Colors.green,
                                    ],
                                  )
                              ),
                            ),
                            //),
                            // ),

                            Center(
                              child: Container(
                                margin: EdgeInsets.only(left: 5),
                                // color: Colors.black,
                                width: 90,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                    Image.asset('assets/image/car_slot.PNG',),

                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 23),
                Container(
                  width: 10,
                  height: 60,
                  margin: EdgeInsets.only( top: 3,right: 10),
                  child: VerticalDivider(
                    color: Colors.black,  //color of divider
                    width: 10, //width space of divider
                    thickness: 3, //thickness of divier line
                    indent: 10, //Spacing at the top of divider.
                    endIndent: 10,

                  ),
                ),
                SizedBox(width: 15),
                Padding (
                  padding: EdgeInsets.only(left: 20,right: 20),
                  child: MaterialButton(
                    onPressed: (  ) {
                      Navigator.of(context).pushNamed('car_slot');
                      setState(() {} );
                    },
                    child: Container(
                      //  flex: 2,
                      height: 80,
                      //decoration: DottedDecoration()
                      decoration:DottedDecoration(
                        shape: Shape.line,
                        color: Colors.blueGrey,
                        strokeWidth: 4,
                        dash:[10, 5],

                      ),
                      child: Container(
                        //  flex: 2,
                        height: 80,
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Colors.blueGrey, width:2, style: BorderStyle.solid),
                            right: BorderSide(color: Colors.blueGrey, width: 4, style: BorderStyle.solid),
                          ),
                        ),

                        child: Stack(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              //color: Colors.lightBlueAccent,
                              margin: EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  color: Colors.lightBlueAccent,
                                  //  shape: BoxShape.circle,
                                  //border:Border( top: BorderSide(10),),

                                  gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.topLeft,
                                    colors: [
                                      Colors.lightBlueAccent,
                                      Colors.greenAccent,
                                      // Colors.green,
                                    ],
                                  )
                              ),
                            ),
                            //),
                            // ),

                            Center(
                              child: Container(
                                margin: EdgeInsets.only(left: 5),
                                // color: Colors.black,
                                width: 90,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                    Image.asset('assets/image/car_slot.PNG',),

                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),///closed
            Row(
              children: [
                Padding (
                  padding: EdgeInsets.only(left: 20,right: 20),
                  child: MaterialButton(
                    onPressed: (  ) {
                      Navigator.of(context).pushNamed('car_slot');
                      /* _firestor.collection('sinin').add({
                        'text':massage, } );*/
                      setState(() {} );
                    },
                    child: Container(
                      //  flex: 2,
                      height: 80,
                      //decoration: DottedDecoration()
                      decoration:DottedDecoration(
                        shape: Shape.line,
                        color: Colors.blueGrey,
                        strokeWidth: 4,
                        dash:[10, 5],

                      ),
                      child: Container(
                        //  flex: 2,
                        height: 80,
                        decoration: BoxDecoration(
                          border: Border(
                            // top: BorderSide(color: Colors.blueGrey, width:2, style: BorderStyle.solid),
                            left: BorderSide(color: Colors.blueGrey, width: 4, style: BorderStyle.solid),
                          ),
                        ),

                        child: Stack(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              //color: Colors.lightBlueAccent,
                              margin: EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  color: Colors.lightBlueAccent,
                                  //  shape: BoxShape.circle,
                                  //border:Border( top: BorderSide(10),),

                                  gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.topLeft,
                                    colors: [
                                      Colors.lightBlueAccent,
                                      Colors.greenAccent,
                                      // Colors.green,
                                    ],
                                  )
                              ),
                            ),
                            //),
                            // ),

                            Center(
                              child: Container(

                                margin: EdgeInsets.only(left: 5),
                                // color: Colors.black,
                                width: 90,
                                child: Consumer<ultra_data>(
                                       builder: (context,ultra_data,child){
                                         return Column(
                                           mainAxisAlignment: MainAxisAlignment.center,
                                           crossAxisAlignment: CrossAxisAlignment.center,
                                           children: [
                                             /// if open => no slot
                                             ///resrv. => icon
                                             /// close => car
                                             // Image.asset('asset/imag/car_slot.PNG',),
                                             // if( ultra1_app==20)
                                             //  setState(() {} )
                                            // ultra_data.getData(),
                                             ultra_data.ultra1_app =="on" ? Image.asset('assets/image/car_slot.PNG',) : Text('a')
                                             /*Text(
                                            'A2', /// must in it string of car
                                            style: TextStyle(color: Colors.white,fontSize: 18)
                                        ),*/
                                           ],
                                         );
                                       //},
                                   },
                                ),
                              ),
                              //),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 23),
                Container(
                  width: 10,
                  height: 60,
                  margin: EdgeInsets.only( top: 3,right: 10),
                  child: VerticalDivider(
                    color: Colors.black,  //color of divider
                    width: 10, //width space of divider
                    thickness: 3, //thickness of divier line
                    indent: 10, //Spacing at the top of divider.
                    endIndent: 10,

                  ),
                ),
                SizedBox(width: 15),
                Padding (
                  padding: EdgeInsets.only(left: 20,right: 20),
                  child: MaterialButton(
                    onPressed: (  ) { Navigator.of(context).pushNamed('car_slot');},
                    child: Container(
                      //  flex: 2,
                      height: 80,
                      //decoration: DottedDecoration()
                      decoration:DottedDecoration(
                        shape: Shape.line,
                        color: Colors.blueGrey,
                        strokeWidth: 4,
                        dash:[10, 5],

                      ),
                      child: Container(
                        //  flex: 2,
                        height: 80,
                        decoration: BoxDecoration(
                          border: Border(
                            // top: BorderSide(color: Colors.blueGrey, width:2, style: BorderStyle.solid),
                            right: BorderSide(color: Colors.blueGrey, width: 4, style: BorderStyle.solid),
                          ),
                        ),

                        child: Stack(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              //color: Colors.lightBlueAccent,
                              margin: EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  color: Colors.lightBlueAccent,
                                  //  shape: BoxShape.circle,
                                  //border:Border( top: BorderSide(10),),

                                  gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.topLeft,
                                    colors: [
                                      Colors.lightBlueAccent,
                                      Colors.greenAccent,
                                      // Colors.green,
                                    ],
                                  )
                              ),
                            ),
                            //),
                            // ),

                            Center(
                              child: Container(
                                margin: EdgeInsets.only(left: 5),
                                // color: Colors.black,
                                width: 90,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                    //Image.asset('asset/imag/car_slot.PNG',),
                                    Text(
                                        'B2', /// must in it string of car
                                        style: TextStyle(color: Colors.white,fontSize: 18)
                                    ),

                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),///defult
            Row(
              children: [
                Padding (
                  padding: EdgeInsets.only(left: 20,right: 20),
                  child: MaterialButton(
                    onPressed: (  ) {
                      Navigator.of(context).pushNamed('car_slot');
                      setState(() {} );
                    },
                    child: Container(
                      //  flex: 2,
                      height: 80,
                      //decoration: DottedDecoration()
                      decoration:DottedDecoration(
                        shape: Shape.line,
                        color: Colors.blueGrey,
                        strokeWidth: 4,
                        dash:[10, 5],

                      ),
                      child: Container(
                        //  flex: 2,
                        height: 80,
                        decoration: BoxDecoration(
                          border: Border(
                            // top: BorderSide(color: Colors.blueGrey, width:2, style: BorderStyle.solid),
                            left: BorderSide(color: Colors.blueGrey, width: 4, style: BorderStyle.solid),
                          ),
                        ),

                        child: Stack(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              //color: Colors.lightBlueAccent,
                              margin: EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  color: Colors.lightBlueAccent,
                                  //  shape: BoxShape.circle,
                                  //border:Border( top: BorderSide(10),),

                                  gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.topLeft,
                                    colors: [
                                      Colors.lightBlueAccent,
                                      Colors.greenAccent,
                                      // Colors.green,
                                    ],
                                  )
                              ),
                            ),
                            //),
                            // ),

                            Center(
                              child: Container(
                                margin: EdgeInsets.only(left: 5),
                                // color: Colors.black,
                                width: 90,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    /// if open => no slot
                                    ///resrv. => icon
                                    /// close => car
                                    // Image.asset('asset/imag/car_slot.PNG',),
                                    /* Text(
                                        'A2', /// must in it string of car
                                        style: TextStyle(color: Colors.white,fontSize: 18)
                                    ),*/
                                    Icon(Icons.lock_rounded,size: 30,color: Colors.white,),

                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 7),
                Container(
                  width: 10,
                  height: 60,
                  margin: EdgeInsets.only( top: 3,right: 10),
                  child: Icon(
                    Icons.arrow_downward,size: 40,color: Colors.grey,
                  ),
                ),
                SizedBox(width: 30),
                Padding (
                  padding: EdgeInsets.only(left: 20,right: 20),
                  child: MaterialButton(
                    onPressed: (  ) { Navigator.of(context).pushNamed('car_slot');},
                    child: Container(
                      //  flex: 2,
                      height: 80,
                      //decoration: DottedDecoration()
                      decoration:DottedDecoration(
                        shape: Shape.line,
                        color: Colors.blueGrey,
                        strokeWidth: 4,
                        dash:[10, 5],

                      ),
                      child: Container(
                        //  flex: 2,
                        height: 80,
                        decoration: BoxDecoration(
                          border: Border(
                            // top: BorderSide(color: Colors.blueGrey, width:2, style: BorderStyle.solid),
                            right: BorderSide(color: Colors.blueGrey, width: 4, style: BorderStyle.solid),
                          ),
                        ),

                        child: Stack(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              //color: Colors.lightBlueAccent,
                              margin: EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  color: Colors.lightBlueAccent,

                                  gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.topLeft,
                                    colors: [
                                      Colors.lightBlueAccent,
                                      Colors.greenAccent,
                                      // Colors.green,
                                    ],
                                  )
                              ),
                            ),
                            //),
                            // ),

                            Center(
                              child: Container(
                                margin: EdgeInsets.only(left: 5),
                                // color: Colors.black,
                                width: 90,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    //case1
                                    // Text(
                                    //     'B2', /// must in it string of car
                                    //     style: TextStyle(color: Colors.white,fontSize: 18)
                                    // ),
                                    ///case2, in this it is cannot clicked on it
                                    ///Image.asset('asset/imag/car_slot.PNG',),
                                    //case3
                                    Icon(Icons.lock_rounded,size: 30,color: Colors.white,),
                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),/// resv.
            Row(
              children: [
                Padding (
                  padding: EdgeInsets.only(left: 20,right: 20),
                  child: MaterialButton(
                    onPressed: (  ) {
                      Navigator.of(context).pushNamed('car_slot');
                      setState(() {} );
                    },
                    child: Container(
                      //  flex: 2,
                      height: 80,
                      //decoration: DottedDecoration()
                      decoration:DottedDecoration(
                        shape: Shape.line,
                        color: Colors.blueGrey,
                        strokeWidth: 4,
                        dash:[10, 5],

                      ),
                      child: Container(
                        //  flex: 2,
                        height: 80,
                        decoration: BoxDecoration(
                          border: Border(
                            // top: BorderSide(color: Colors.blueGrey, width:2, style: BorderStyle.solid),
                            left: BorderSide(color: Colors.blueGrey, width: 4, style: BorderStyle.solid),
                          ),
                        ),

                        child: Stack(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              //color: Colors.lightBlueAccent,
                              margin: EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  color: Colors.lightBlueAccent,
                                  //  shape: BoxShape.circle,
                                  //border:Border( top: BorderSide(10),),

                                  gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.topLeft,
                                    colors: [
                                      Colors.lightBlueAccent,
                                      Colors.greenAccent,
                                      // Colors.green,
                                    ],
                                  )
                              ),
                            ),
                            //),
                            // ),

                            Center(
                              child: Container(
                                margin: EdgeInsets.only(left: 5),
                                // color: Colors.black,
                                width: 90,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    /// if open => no slot
                                    ///resrv. => icon
                                    /// close => car
                                    // Image.asset('asset/imag/car_slot.PNG',),
                                    Text(
                                        'A2', /// must in it string of car
                                        style: TextStyle(color: Colors.white,fontSize: 18)
                                    ),
                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 23),
                Container(
                  width: 10,
                  height: 60,
                  margin: EdgeInsets.only( top: 3,right: 10),
                  child: VerticalDivider(
                    color: Colors.black,  //color of divider
                    width: 10, //width space of divider
                    thickness: 3, //thickness of divier line
                    indent: 10, //Spacing at the top of divider.
                    endIndent: 10,

                  ),
                ),
                SizedBox(width: 15),
                Padding (
                  padding: EdgeInsets.only(left: 20,right: 20),
                  child: MaterialButton(
                    onPressed: (  ) { Navigator.of(context).pushNamed('car_slot');},
                    child: Container(
                      //  flex: 2,
                      height: 80,
                      //decoration: DottedDecoration()
                      decoration:DottedDecoration(
                        shape: Shape.line,
                        color: Colors.blueGrey,
                        strokeWidth: 4,
                        dash:[10, 5],

                      ),
                      child: Container(
                        //  flex: 2,
                        height: 80,
                        decoration: BoxDecoration(
                          border: Border(
                            // top: BorderSide(color: Colors.blueGrey, width:2, style: BorderStyle.solid),
                            right: BorderSide(color: Colors.blueGrey, width: 4, style: BorderStyle.solid),
                          ),
                        ),

                        child: Stack(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              //color: Colors.lightBlueAccent,
                              margin: EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  color: Colors.lightBlueAccent,
                                  //  shape: BoxShape.circle,
                                  //border:Border( top: BorderSide(10),),

                                  gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.topLeft,
                                    colors: [
                                      Colors.lightBlueAccent,
                                      Colors.greenAccent,
                                      // Colors.green,
                                    ],
                                  )
                              ),
                            ),
                            //),
                            // ),

                            Center(
                              child: Container(
                                margin: EdgeInsets.only(left: 5),
                                // color: Colors.black,
                                width: 90,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                    //Image.asset('asset/imag/car_slot.PNG',),
                                    Text(
                                        'B2', /// must in it string of car
                                        style: TextStyle(color: Colors.white,fontSize: 18)
                                    ),

                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),///defult
            Row(
              children: [
                Padding (
                  padding: EdgeInsets.only(left: 20,right: 20),
                  child: MaterialButton(
                    onPressed: (  ) {
                      Navigator.of(context).pushNamed('car_slot');
                      setState(() {} );
                    },
                    child: Container(
                      //  flex: 2,
                      height: 80,
                      child: Container(
                        //  flex: 2,
                        height: 80,
                        decoration: BoxDecoration(
                          border: Border(
                            // top: BorderSide(color: Colors.blueGrey, width:2, style: BorderStyle.solid),
                            left: BorderSide(color: Colors.blueGrey, width: 4, style: BorderStyle.solid),
                            bottom: BorderSide(color: Colors.blueGrey, width: 4, style: BorderStyle.solid),

                          ),
                        ),

                        child: Stack(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              //color: Colors.lightBlueAccent,
                              margin: EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  color: Colors.lightBlueAccent,
                                  //  shape: BoxShape.circle,
                                  //border:Border( top: BorderSide(10),),

                                  gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.topLeft,
                                    colors: [
                                      Colors.lightBlueAccent,
                                      Colors.greenAccent,
                                      // Colors.green,
                                    ],
                                  )
                              ),
                            ),
                            //),
                            // ),

                            Center(
                              child: Container(
                                margin: EdgeInsets.only(left: 5),
                                // color: Colors.black,
                                width: 90,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    /// if open => no slot
                                    ///resrv. => icon
                                    /// close => car
                                    // Image.asset('asset/imag/car_slot.PNG',),
                                    Text(
                                        'A2', /// must in it string of car
                                        style: TextStyle(color: Colors.white,fontSize: 18)
                                    ),
                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 23),
                Container(
                  width: 10,
                  height: 60,
                  margin: EdgeInsets.only( top: 3,right: 10),
                  child: VerticalDivider(
                    color: Colors.black,  //color of divider
                    width: 10, //width space of divider
                    thickness: 3, //thickness of divier line
                    indent: 10, //Spacing at the top of divider.
                    endIndent: 10,

                  ),
                ),
                SizedBox(width: 15),
                Padding (
                  padding: EdgeInsets.only(left: 20,right: 20),
                  child: MaterialButton(
                    onPressed: (  ) { Navigator.of(context).pushNamed('car_slot');},
                    child: Container(
                      //  flex: 2,
                      height: 80,
                      child: Container(
                        //  flex: 2,
                        height: 80,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.blueGrey, width: 4, style: BorderStyle.solid),
                            right: BorderSide(color: Colors.blueGrey, width: 4, style: BorderStyle.solid),
                          ),
                        ),

                        child: Stack(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              //color: Colors.lightBlueAccent,
                              margin: EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  color: Colors.lightBlueAccent,
                                  //  shape: BoxShape.circle,
                                  //border:Border( top: BorderSide(10),),

                                  gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.topLeft,
                                    colors: [
                                      Colors.lightBlueAccent,
                                      Colors.greenAccent,
                                      // Colors.green,
                                    ],
                                  )
                              ),
                            ),
                            //),
                            // ),

                            Center(
                              child: Container(
                                margin: EdgeInsets.only(left: 5),
                                // color: Colors.black,
                                width: 90,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                    //Image.asset('asset/imag/car_slot.PNG',),
                                    Text(
                                        'B2', /// must in it string of car
                                        style: TextStyle(color: Colors.white,fontSize: 18)
                                    ),

                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),///defult
            Row(
              children: [

                SizedBox(width: 160),

                Padding(
                  padding: EdgeInsets.only(top: 10,),
                  child: Container(
                    height: 30,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(  colors: [Colors.green, Colors.teal]),
                    ),
                    child: MaterialButton( onPressed:
                        (
                        /// go to next page
                        ){
                      // Navigator.of(context).pushNamed('parking_list');
                    },
                      child: Text(
                          'Exit',
                          style: TextStyle(color: Colors.white,fontSize: 18)
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 90),

              ],
            ),///defult

          ],
        ),
        //],
      ),
      //  ),
    );
  }
}