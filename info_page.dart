///import 'dart:html';
import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: camel_case_types
class info_page extends StatefulWidget {
  @override
  State<info_page> createState() => _info_pageState();
}
/*
  this class diveded to 4 exoanded
  1&4 => circle
  2   => park.and image
  3   => for text & bot.

  */
class _info_pageState extends State<info_page> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), (){Navigator.of(context).pushNamed('parking_list');});
  }
  @override
  Widget build(BuildContext context) {

    final size =MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: <Widget> [
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                Positioned(
                  right: -size.width * 0.58, /// var size
                  top: -size.width * 0.79,
                  child: Container(
                    width: size.width,
                    height: size.width,

                    decoration: const BoxDecoration(
                        color:Color(0xffa2b7f3),
                        shape: BoxShape.circle
                    ),


                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Container(

                  child: Stack (
                    children: <Widget>[
                      Center(child: Image.asset('assets/image/info.jpg',height: 350,)),
                      Container(
                        child: Center(
                          child: Text(
                              'Smart Parking',
                              style:TextStyle(color:  Color(0xffA595F8),fontSize: 24,)
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
                child: Column(
                  children: [
                    Text('Reduced Waiting Time',
                      textAlign: TextAlign.center,
                      style:TextStyle(color:  Color(0xffA595F8),fontSize: 22,),

                    ),
                    Text('register to see the parking and  to \n reserve a car slot',
                      textAlign: TextAlign.center,
                      style:TextStyle(color: Color(0xffA595F8),fontSize: 20,),

                    ),
                    /// Column( children:[
                    /// Text(' ')
                    ///]),
                  /*  Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(  colors: [Colors.green, Colors.teal]),
                        ),
                        child: MaterialButton( onPressed:
                            (
                            ){
                          Navigator.of(context).pushNamed('parking_list');
                          setState(() {} );
                        },
                          child: Text(
                              'get started',
                              style: TextStyle(color: Colors.white,fontSize: 18)
                          ),
                        ),
                      ),
                    ),*/
                  ],
                )
            ),
          ),

          Expanded(
            flex: 1,
            child: Stack(
              children: [
                Positioned(
                  left: -size.width * 0.58, /// var size
                  bottom: -size.width * 0.79,
                  child: Container(
                    width: size.width,
                    height: size.width,

                    decoration: const BoxDecoration(
                        color: Color(0xffa2b7f3),
                        shape: BoxShape.circle
                    ),


                  ),
                )
              ],
            ),
          ),
        ],
      ),

    );
  }
}