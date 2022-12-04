import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:ui';

class parking_list extends StatefulWidget {
  @override
  State<parking_list> createState() => _parking_listState();
}

class _parking_listState extends State<parking_list> {
  late final dref=FirebaseDatabase.instance.reference();
  late DatabaseReference databaseReference;
  int? open_app1;
  int? open_app2;
  getData(){
    dref.child('/info/open').onValue.listen((event) {
      setState(() {
    open_app1=event.snapshot.value as int?; });
    });
  }
  getData2(){
    dref.child('/info2/open').onValue.listen((event) {
      setState(() {
        open_app2=event.snapshot.value as int?; });
    });
  }
  @override
  void initState() {
    super.initState();
    getData();
    getData2();
  }
  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;

    return Scaffold(
      //  Color(0xffA595F8), Color(0xffa2b7f3),#f0f4ff
      backgroundColor: Color(0xfff0f4ff),
      appBar:AppBar(
        title: Text(" Parking",
          style:TextStyle(color:  Colors.white,fontSize: 22,),

        ),
        backgroundColor: Color(0xffA595F8),
        //shadowColor: Colors.blue,
        leading:IconButton(onPressed: ( ){
          Navigator.of(context).pushNamed('parking_list');
          setState(() {} );},
          icon: Icon( Icons.home_sharp, ),
          color: Colors.white,
          iconSize: 30,
          padding: EdgeInsets.only(top: 5),
        ),

        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [//Color(0xffA595F8)
            Padding(
              padding: EdgeInsets.only(top: 15,left: 30),
              child: Container(
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30,vertical: 14),
              height: 130,
              // color: Colors.lightBlueAccent,
              child: Stack(
                // alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: 140,
                    width:size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color:Color(0xffA595F8),
                      boxShadow: [BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ), ],
                    ),
                    child:Container(
                      height: 140,
                      width: size.width,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color:Color(0xffc2d1ff),
                      ),
                      child: MaterialButton( onPressed:
                          (
                          /// go to next page
                          ) {
                        Navigator.of(context).pushNamed('park_slot');
                        setState(() {} );
                      },
                        child: Column(

                          children: [

                            Container(
                              margin: EdgeInsets.only(left:10,top:12),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Column(
                                      mainAxisAlignment:MainAxisAlignment.start ,
                                      crossAxisAlignment: CrossAxisAlignment.start,

                                      children: [
                                        Text(
                                          'Mall park',
                                          style: TextStyle(color: Colors.white,fontSize: 24,),
                                          textAlign: TextAlign.left,

                                        ),
                                        Text(
                                          'In Baghdad,Al Harthiya',
                                          style: TextStyle(color: Colors.white,fontSize: 15,),
                                          textAlign: TextAlign.left,

                                        ),
                                      ],
                                    ),
                                  ),

                                  IconButton(onPressed: ( ){
                                    Navigator.of(context).pushNamed('parking_list');
                                    setState(() {} );},
                                    icon: Icon( Icons.location_on_outlined, ),
                                    color: Colors.white,
                                    iconSize: 34,
                                    padding: EdgeInsets.only(left: 85),
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.only(left: 10,top:27),

                              child: Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'open:',
                                          style: TextStyle(color:Colors.white,fontSize: 21,),

                                        ),
                                        Text(
                                          '${open_app1}',
                                          style: TextStyle(color: Colors.white,fontSize: 21,),

                                        ),
                                        SizedBox(width: 22),

                                      ],
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
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15,left: 30),
              child: Container(

                decoration: BoxDecoration(


                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30,vertical: 14),
              height: 130,
              // color: Colors.lightBlueAccent,
              child: Stack(
                // alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: 140,
                    width:size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color:Color(0xffA595F8),
                      boxShadow: [BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ), ],
                    ),
                    child:Container(
                      height: 140,
                      width: size.width,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color:Color(0xffc2d1ff),
                      ),
                      child: MaterialButton( onPressed:
                          (
                          /// go to next page
                          ) {
                        Navigator.of(context).pushNamed('park_slot');
                        setState(() {} );
                      },
                        child: Column(

                          children: [

                            Container(
                              margin: EdgeInsets.only(left:10,top:12),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Column(
                                      mainAxisAlignment:MainAxisAlignment.start ,
                                      crossAxisAlignment: CrossAxisAlignment.start,

                                      children: [
                                        Text(
                                          'smart park',
                                          style: TextStyle(color: Colors.white,fontSize: 24,),
                                          textAlign: TextAlign.left,

                                        ),
                                        Text(
                                          'In Baghdad,Al Harthiya',
                                          style: TextStyle(color: Colors.white,fontSize: 15,),
                                          textAlign: TextAlign.left,

                                        ),
                                      ],
                                    ),
                                  ),

                                  IconButton(onPressed: ( ){
                                    Navigator.of(context).pushNamed('parking_list');
                                    setState(() {} );},
                                    icon: Icon( Icons.location_on_outlined, ),
                                    color: Colors.white,
                                    iconSize: 34,
                                    padding: EdgeInsets.only(left: 85),
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.only(left: 10,top:27),

                              child: Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'open:',
                                          style: TextStyle(color:Colors.white,fontSize: 21,),

                                        ),
                                        Text(
                                          '${open_app2}',
                                          style: TextStyle(color: Colors.white,fontSize: 21,),

                                        ),
                                        SizedBox(width: 22),

                                      ],
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
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15,left: 30),
              child: Container(
              ),
            ),
           /* Container(
              margin: EdgeInsets.symmetric(horizontal: 30,vertical: 14),
              height: 130,
              // color: Colors.lightBlueAccent,
              child: Stack(
                // alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: 140,
                    width:size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color:Color(0xffA595F8),
                      boxShadow: [BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ), ],
                    ),
                    child:Container(
                      height: 140,
                      width: size.width,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color:Color(0xffc2d1ff),
                      ),
                      child: MaterialButton( onPressed:
                          (
                          /// go to next page
                          ) {
                        Navigator.of(context).pushNamed('park_slot');
                        setState(() {} );
                      },
                        child: Column(

                          children: [

                            Container(
                              margin: EdgeInsets.only(left:10,top:12),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Column(
                                      mainAxisAlignment:MainAxisAlignment.start ,
                                      crossAxisAlignment: CrossAxisAlignment.start,

                                      children: [
                                        Text(
                                          'Park Name',
                                          style: TextStyle(color: Colors.white,fontSize: 24,),
                                          textAlign: TextAlign.left,

                                        ),
                                        Text(
                                          'In Baghdad,Al Harthiya',
                                          style: TextStyle(color: Colors.white,fontSize: 15,),
                                          textAlign: TextAlign.left,

                                        ),
                                      ],
                                    ),
                                  ),

                                  IconButton(onPressed: ( ){
                                    Navigator.of(context).pushNamed('parking_list');
                                    setState(() {} );},
                                    icon: Icon( Icons.location_on_outlined, ),
                                    color: Colors.white,
                                    iconSize: 34,
                                    padding: EdgeInsets.only(left: 85),
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.only(left: 10,top:27),

                              child: Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'open:',
                                          style: TextStyle(color:Colors.white,fontSize: 21,),

                                        ),
                                        Text(
                                          '${open_app1}',
                                          style: TextStyle(color: Colors.white,fontSize: 21,),

                                        ),
                                        SizedBox(width: 22),

                                      ],
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
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15,left: 30),
              child: Container(

              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30,vertical: 14),
              height: 130,
              // color: Colors.lightBlueAccent,
              child: Stack(
                // alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: 140,
                    width:size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color:Color(0xffa2b7f3),
                      boxShadow: [BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ), ],
                    ),
                    child:Container(
                      height: 140,
                      width: size.width,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color:Color(0xffc2d1ff),
                      ),
                      child: MaterialButton( onPressed:
                          (
                          /// go to next page
                          ) {
                        Navigator.of(context).pushNamed('park_slot');
                        setState(() {} );
                      },
                        child: Column(

                          children: [

                            Container(
                              margin: EdgeInsets.only(left:10,top:12),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Column(
                                      mainAxisAlignment:MainAxisAlignment.start ,
                                      crossAxisAlignment: CrossAxisAlignment.start,

                                      children: [
                                        Text(
                                          'Park Name',
                                          style: TextStyle(color: Colors.white,fontSize: 24,),
                                          textAlign: TextAlign.left,

                                        ),
                                        Text(
                                          'In Baghdad,Al Harthiya',
                                          style: TextStyle(color: Colors.white,fontSize: 15,),
                                          textAlign: TextAlign.left,

                                        ),
                                      ],
                                    ),
                                  ),

                                  IconButton(onPressed: ( ){
                                    Navigator.of(context).pushNamed('parking_list');
                                    setState(() {} );},
                                    icon: Icon( Icons.location_on_outlined, ),
                                    color: Colors.white,
                                    iconSize: 34,
                                    padding: EdgeInsets.only(left: 85),
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.only(left: 10,top:27),

                              child: Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'open:',
                                          style: TextStyle(color:Colors.white,fontSize: 21,),

                                        ),
                                        Text(
                                          'no var',
                                          style: TextStyle(color: Colors.white,fontSize: 21,),

                                        ),
                                        SizedBox(width: 22),

                                      ],
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
                ],
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}