import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class sin_up extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Colors.white24,
      body: Column(
        children: [
          // Expanded(
          //   flex: 1,
          //   child: Stack(
          //     children: [
          //       Positioned(
          //         top: -size.width * 0.72, /// var size
          //
          //         child: Container(
          //           width: size.width,
          //           height: size.width,
          //
          //           decoration: const BoxDecoration(
          //               color: Colors.lightBlueAccent,
          //               shape: BoxShape.circle
          //           ),
          //
          //
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          Expanded(
            flex: 5,
            child: Container
              (
              decoration: const BoxDecoration(
                //color: Colors.lightBlueAccent,
                //shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.topLeft,
                    colors: [
                      Color.fromRGBO(156, 193, 240, 40),
                      Colors.white,

                    ],
                  )


              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      height: 122,
                      child: Stack(
                        children: [
                          Positioned(
                            top: -size.width * 0.72, /// var size

                            child: Container(
                              width: size.width,
                              height: size.width,

                              decoration: const BoxDecoration(
                                  color: Colors.lightBlueAccent,
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.topLeft,
                                    colors: [
                                      Color.fromRGBO(156, 193, 240, 40),
                                      Color.fromRGBO(102, 204, 139,40),
                                      // Colors.green,
                                    ],
                                  )


                              ),


                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5,left: 20,right: 20),
                      child: Text('Sin Up',
                        textAlign: TextAlign.center,
                        style:TextStyle(color: Colors.green,fontSize: 32,
                          fontWeight:FontWeight.bold,
                          letterSpacing:1.2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5,left: 35,right: 35),
                      child: Container(
                        child: Form(
                          child: Column(
                            children: <Widget>[
                              Container(

                                child: TextFormField(
                                  validator: (input) { },
                                  decoration: InputDecoration(
                                      labelText: 'Name',
                                      labelStyle: TextStyle( color: Colors.green,fontSize: 18,),
                                      prefixIcon: Icon(Icons.person,size: 30,color: Colors.greenAccent,)),
                                ),
                              ),
                              // Container(
                              //   child: TextFormField(
                              //     // validator: (input) {
                              //     //   if (input.length < 6)
                              //     //     return 'Provide Minimum 6 Character';
                              //     // },
                              //     decoration: InputDecoration(
                              //       labelText: 'Password',
                              //       labelStyle: TextStyle( color: Colors.green,fontSize: 18,),
                              //       prefixIcon: Icon(Icons.lock,size: 30,color: Colors.greenAccent,),
                              //     ),
                              //     obscureText: true,
                              //   ),
                              // ),
                              Container(
                                child: TextFormField(
                                  // validator: (input) {
                                  //   if (input.length < 6)
                                  //     return 'Provide Minimum 6 Character';
                                  // },
                                  decoration: InputDecoration(
                                    labelText: 'phone number',
                                    labelStyle: TextStyle( color: Colors.green,fontSize: 18,),
                                    prefixIcon: Icon(Icons.local_phone,size: 30,color: Colors.greenAccent,),
                                  ),
                                  obscureText: true,
                                ),
                              ),
                              Container(
                                child: TextFormField(
                                  // validator: (input) {
                                  //   if (input.length < 6)
                                  //     return 'Provide Minimum 6 Character';
                                  // },
                                  decoration: InputDecoration(
                                    labelText: 'car number',
                                    labelStyle: TextStyle( color: Colors.green,fontSize: 18,),
                                    prefixIcon: Icon(Icons.car_rental_rounded,size: 34,color: Colors.greenAccent,),
                                  ),
                                  obscureText: true,
                                ),
                              ),
                              SizedBox(height: 20),
                              // RaisedButton(
                              //   padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                              //   onPressed: ( ){ },
                              //   child: Text('LOGIN',
                              //       style: TextStyle(
                              //           color: Colors.white,
                              //           fontSize: 20.0,
                              //           fontWeight: FontWeight.bold)),
                              //   color: Colors.lightBlueAccent,
                              //   shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20.0), ),
                              // )
                              Padding(
                                padding: EdgeInsets.only(top: 15),
                                child: Container(
                                  height: 50,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    gradient: LinearGradient(  colors: [Colors.green, Colors.teal]),
                                  ),
                                  child: MaterialButton( onPressed:
                                      (
                                      /// go to next page
                                      ){
                                    Navigator.of(context).pushNamed('login');
                                  },
                                    child: Text(
                                        'Sin In',
                                        style: TextStyle(color: Colors.white,fontSize: 18)
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),


                    // GestureDetector(
                    //   child: Padding(
                    //       padding: EdgeInsets.only(top: 20),
                    //       //child: Text('Create an Account?')),
                    // ),



                  ],// children
                ),
              ),
            ),

          ),

          Container(
            width:size.width,
            height: 65,
            child: Row(
              children: [
                Stack(
                  children: [
                    //left: -1, /// var size
                    //top: -1,
                    // bottom: -size.width * 0.89,
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
                          onPressed: (  ) { Navigator.of(context).pushNamed('car_slot'); },
                          child: Icon(
                            Icons.arrow_back_ios_new_sharp,size: 40,color: Colors.white60,),

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
        ],
      ),
    );
  }
}