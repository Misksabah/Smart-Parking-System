
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui';

import 'car_slot.dart';
/*
  this class diveded  to 4 row
  1   => section a,b... & enter
  2   => car slot ....to end
  end    => for exit
  */
class park_slots extends StatefulWidget {

  @override
  State<park_slots> createState() => _park_slotsState();
}

class _park_slotsState extends State<park_slots> {
  String ultra1_app="off";
  String ultra2_app="off";
  String ultra3_app="off";
  String ultra4_app="off";
  String ultra5_app="off";
  String ultra6_app="off";
  String section1="A";
  String section2="B";
  String? selctor_ultra;
  String? shear_ultra;
  int num1=1;
  int num2=2;
  int num3=3;
  int num4=4;
  int num5=5;
  int num6=6;
  int slot_a1=1;
  bool isresvation=false;
// real time db set up & fun.
  late final dref=FirebaseDatabase.instance.reference();
   late DatabaseReference databaseReference;
  setData(){
           dref.child('info/ultra1').set({'ultra1':'rev',});
       }
  getData(){
   dref.child('info/ultra1').onValue.listen((event) {
     setState(() {
       ultra1_app=event.snapshot.value.toString(); });
   });
   print(ultra1_app);
 }
  getData2(){
    dref.child('info/ultra2').onValue.listen((event) {
      setState(() {
        ultra2_app=event.snapshot.value.toString(); });
    });}
  getData3(){
    dref.child('info/ultra3').onValue.listen((event) {
      setState(() {
        ultra3_app=event.snapshot.value.toString(); });
    });}
  getData4(){
    dref.child('info/ultra4').onValue.listen((event) {
      setState(() {
        ultra4_app=event.snapshot.value.toString(); });
    });}
  getData5(){
    dref.child('info/ultra5').onValue.listen((event) {
      setState(() {
        ultra5_app=event.snapshot.value.toString(); });
    });}
  getData6(){
    dref.child('info/ultra6').onValue.listen((event) {
      setState(() {
        ultra6_app=event.snapshot.value.toString(); });
    });}
  shearselctor_ultra()async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    preferences.setString('ultra', '${selctor_ultra}');
  //print(preferences.getString('ultra')) ;
  }
  @override
  void initState() {
    super.initState();
    getData();
    getData2();
    getData3();
    getData4();
  }
  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;

    return Scaffold(
     // backgroundColor: Colors.white,
      backgroundColor: Color(0xfff0f4ff),

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
                              color: Color(0xffa2b7f3),
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
                    style:TextStyle(color:   Color(0xffA595F8),fontSize: 24, fontWeight:FontWeight.bold,),
                  ),
                  SizedBox(width: 118),
                  Stack(
                    children: [
                      Container(
                        width:40,
                        height:40,
                        margin: EdgeInsets.only(top: 25),
                        decoration: const BoxDecoration(
                            color: Color(0xffa2b7f3),
                            shape: BoxShape.circle
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // gradient: LinearGradient(  colors: [Color(0xffa2b7f3), Color(0xffA595F8)]),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0,left: 70,),
                  child: Card(
                    color: Color(0xffa2b7f3),
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
                                      text: '$section1',
                                      style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
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
                      gradient: LinearGradient(  colors:[Color(0xffa2b7f3), Color(0xffA595F8)]),
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
                    color: Color(0xffa2b7f3),
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
                                          color: Colors.white)),
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
            ///other to car slot have string to take slot no.
            Row(
              children: [
                Padding (
                  padding: EdgeInsets.only(left: 20,right: 20),
                  child: MaterialButton(
                    onPressed: (  ) {
                      setState(() {
                        shearselctor_ultra();
                        selctor_ultra='ultra1';
                        ( ultra1_app =="on"||ultra1_app =="rev")?  isresvation=true : isresvation == false;
                         isresvation == false? Navigator.push(context,new MaterialPageRoute(builder:(BuildContext Context)=>new car_slot(section1, num1) ))
                          : Navigator.of(context).pushNamed('park_slot');
                      } );
                    },
                    child: Container(
                      height: 80,
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
                                  gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.topLeft,
                                    colors: [// gradient: LinearGradient(  colors:[Color(0xffa2b7f3), Color(0xffA595F8)]),
                                     Color(0xffa2b7f3),
                                      Color(0xffA595F8),
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
                                width: 90,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                    ultra1_app=='rev'? Icon(Icons.lock_rounded,size: 30,color: Colors.white,)
                                        :ultra1_app=='on'? Image.asset('assets/image/car_slot.PNG',)
                                        :Text('${section1}'+ '${num1}',  style: TextStyle(color: Colors.white,fontSize: 18) ),
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
                      setState(() {
                        selctor_ultra='ultra3';
                        shearselctor_ultra();
                        ultra3_app =="on"?  isresvation=true : isresvation == false;
                      isresvation == false? Navigator.push(context,new MaterialPageRoute(builder:(BuildContext Context)=>new car_slot(section2, num1) ))
                          : Navigator.of(context).pushNamed('park_slot');} );
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
                                  gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.topLeft,
                                    colors: [
                                      Color(0xffA595F8),
                                      Color(0xffa2b7f3),

                                      // Colors.green,
                                    ],
                                  )
                              ),
                            ),

                            Center(
                              child: Container(
                                margin: EdgeInsets.only(left: 5),
                                // color: Colors.black,
                                width: 90,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ultra3_app=='rev'? Icon(Icons.lock_rounded,size: 30,color: Colors.white,)
                                        :ultra3_app=='on'? Image.asset('assets/image/car_slot.PNG',)
                                        :Text('${section2}'+ '${num1}',  style: TextStyle(color: Colors.white,fontSize: 18) ),

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
            ),///1
            Row(
              children: [
                Padding (
                  padding: EdgeInsets.only(left: 20,right: 20),
                  child: MaterialButton(
                    onPressed: (  ) {
                      shearselctor_ultra();
                      selctor_ultra='ultra2';
                      ultra2_app =="on"?  isresvation=true : isresvation == false;
                      isresvation == false? Navigator.push(context,new MaterialPageRoute(builder:(BuildContext Context)=>new car_slot(section1, num2) ))
                          : Navigator.of(context).pushNamed('park_slot');
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
                                      Color(0xffa2b7f3),
                                      Color(0xffA595F8),
                                    ],
                                  )
                              ),
                            ),
                            Center(
                                child: Container(
                                  margin: EdgeInsets.only(left: 5),
                                  width: 90,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      ultra2_app=='rev'? Icon(Icons.lock_rounded,size: 30,color: Colors.white,)
                                          :ultra2_app=='on'? Image.asset('assets/image/car_slot.PNG',)
                                          :Text('${section1}'+ '${num2}',  style: TextStyle(color: Colors.white,fontSize: 18) ),
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
                      shearselctor_ultra();
                      selctor_ultra='ultra4';
                      ultra4_app =="on"?  isresvation=true : isresvation == false;
                      isresvation == false? Navigator.push(context,new MaterialPageRoute(builder:(BuildContext Context)=>new car_slot(section2, num2) ))
                          : Navigator.of(context).pushNamed('park_slot');
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
                                      Color(0xffA595F8),
                                      Color(0xffa2b7f3),
                                      // Colors.green,
                                    ],
                                  )
                              ),
                            ),
                            Center(
                              child: Container(
                                margin: EdgeInsets.only(left: 5),
                                // color: Colors.black,
                                width: 90,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ultra4_app=='rev'? Icon(Icons.lock_rounded,size: 30,color: Colors.white,)
                                        :ultra4_app=='on'? Image.asset('assets/image/car_slot.PNG',)
                                        :Text('${section2}'+ '${num3}',  style: TextStyle(color: Colors.white,fontSize: 18) ),
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
            ),///d2
            Row(
              children: [
                Padding (
                  padding: EdgeInsets.only(left: 20,right: 20),
                  child: MaterialButton(
                    onPressed: (  ) {
                      shearselctor_ultra();
                      selctor_ultra='ultra5';
                      ultra5_app =="rev"?  isresvation=true : isresvation == false;
                      isresvation == false? Navigator.push(context,new MaterialPageRoute(builder:(BuildContext Context)=>new car_slot(section1, num3) ))
                      : Navigator.of(context).pushNamed('park_slot');
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
                                  gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.topLeft,
                                    colors: [
                                      Color(0xffa2b7f3),
                                      Color(0xffA595F8),
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
                                    ultra5_app=='rev'? Icon(Icons.lock_rounded,size: 30,color: Colors.white,)
                                        :ultra5_app=='on'? Image.asset('assets/image/car_slot.PNG',)
                                        :Text('${section1}'+ '${num3}',  style: TextStyle(color: Colors.white,fontSize: 18) ),
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
                     onPressed: (  ) {
                       shearselctor_ultra();
                       selctor_ultra='ultra6';
                       ultra6_app =="rev"?  isresvation=true : isresvation == false;
                      isresvation == false? Navigator.push(context,new MaterialPageRoute(builder:(BuildContext Context)=>new car_slot(section2, num3) ))
                       : Navigator.of(context).pushNamed('park_slot');
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
                                      Color(0xffA595F8),
                                      Color(0xffa2b7f3),
                                      // Colors.green,
                                    ],
                                  )
                              ),
                            ),
                            Center(
                              child: Container(
                                margin: EdgeInsets.only(left: 5),
                                // color: Colors.black,
                                width: 90,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ultra6_app=='rev'? Icon(Icons.lock_rounded,size: 30,color: Colors.white,)
                                        :ultra6_app=='on'? Image.asset('assets/image/car_slot.PNG',)
                                        :Text('${section2}'+ '${num3}',  style: TextStyle(color: Colors.white,fontSize: 18) ),
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
            ),/// resv.3
            Row(
              children: [
                Padding (
                  padding: EdgeInsets.only(left: 20,right: 20),
                  child: MaterialButton(
                    onPressed: (  ) {
                      /*ultra1_app =="on"?  isresvation=true : isresvation == false;
                      isresvation == false? Navigator.push(context,new MaterialPageRoute(builder:(BuildContext Context)=>new car_slot(section1, num4) ))
                          : */Navigator.of(context).pushNamed('car_slot');
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
                                  gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.topLeft,
                                    colors: [
                                      Color(0xffa2b7f3),
                                      Color(0xffA595F8),
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
                                    /*ultra1_app =="on"? Image.asset('assets/image/car_slot.PNG',) :*/
                                    Text(
                                        '$section1'+'${num4}',
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
                    onPressed:(  ) {
                /*ultra1_app =="on"?  isresvation=true : isresvation == false;
                isresvation == false? Navigator.push(context,new MaterialPageRoute(builder:(BuildContext Context)=>new car_slot(section2, num4) ))
                    :*/ Navigator.of(context).pushNamed('car_slot');
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
                                      Color(0xffA595F8),
                                      Color(0xffa2b7f3),
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
                                    /*ultra1_app =="on"? Image.asset('assets/image/car_slot.PNG',) :*/
                                    Text(
                                        '$section2'+'${num4}',
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
            ),///defult4
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
                                      Color(0xffa2b7f3),
                                      Color(0xffA595F8),
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
                                   /* ultra1_app =="on"? Image.asset('assets/image/car_slot.PNG',) :*/ Text(
                                        '$section1'+'${num4}',
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
                                  gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.topLeft,
                                    colors: [
                                      Color(0xffA595F8),
                                      Color(0xffa2b7f3),
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
                                  /*  ultra1_app =="on"? Image.asset('assets/image/car_slot.PNG',) :*/ Text(
                                        '$section2'+'${num4}',
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
            ),///defult5
           /* Row(
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
            ),///6*/
            ],
          ),
        ),
    );
  }
}