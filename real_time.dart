/*
import 'dart:html';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
*/
/*class real extends StatefulWidget {
  @override
  State<real> createState() => _realState();
}

class _realState extends State<real> {
  @override
  Widget build(BuildContext context) {
   Application({this.app});
    late final dref=FirebaseDatabase.instance.reference();
    late DatabaseReference databaseReference;
    final size =MediaQuery.of(context).size;
    return Scaffold(

    );
  }
}*//*


//----------------------


import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter_switch/flutter_switch.dart';

class Application extends StatefulWidget {

  //lib core الاساسية لربط الاتصال
  Application({ this.app});
  final FirebaseApp app;

  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {

// lib databaseلربط مع الداتا بيز real time علشان اضع داتا بها
  final referenceDatase = FirebaseDatabase.instance;
  bool status7=false;

//  DatabaseReference _counterRef;//علشان نجيب بيانات من الداتابيزobj

//  @override
//   void initState() {
//            //علشان نوصل للداتا الموجودة اول فتح الصفحة
//            //عمل objمن كلاس الداتا بيز بعد التاكد من الاتصال
//     final FirebaseDatabase database = FirebaseDatabase(app: widget.app);
//     //اخد مرجع بيانات الداتا ووصول الي مكان تخزين معين باسم
//       _counterRef = database.reference().child('output');

//        super.initState();
//     }





  @override
  Widget build(BuildContext context) {
    //obj  من كلاس الداتابيز   referece    علشان اضع بيانات من خلال تحديد مكانها obj
    final ref = referenceDatase.reference();


    return Scaffold(
        appBar:AppBar(
          backgroundColor:  Color(0xE36D1900),
          title: Text(
            "Control Room",
            style: TextStyle(fontSize: 45,
                color: Color(0xE1E9E5E3),
                fontStyle: FontStyle.italic),
          ),
        ),
        body:
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,color:Color (11110010),
                  child: Column(mainAxisAlignment: MainAxisAlignment.start,
                    children: [



                      SizedBox(height: 30,),
                      FlutterSwitch(
                        width: 150.0,
                        height: 70.0,
                        toggleSize: 50.0,
                        value: status7,
                        borderRadius: 30.0,
                        padding: 2.0,
                        activeToggleColor: Color(0xFF952907),
                        inactiveToggleColor: Color(0xFFE7A261),
                        activeSwitchBorder: Border.all(
                          color: Color(0xFFAC2F09),
                          width: 6.0,
                        ),
                        inactiveSwitchBorder: Border.all(
                          color: Color(0xFFE7A261),
                          width: 6.0,
                        ),
                        activeColor: Color(0xFFC8A989),
                        inactiveColor: Colors.white,
                        activeIcon: Icon(
                          Icons.lightbulb,
                          color: Color(0xFFFBC513),
                        ),
                        inactiveIcon: Icon(
                          Icons.lightbulb,
                          color: Color(0xFF908865),
                        ),
                        onToggle: (val) {

                          setState(() {
                            status7 = val;

                            if (val) {
                              ref  //استخدام كائن من كلاس الداتا نفسة علشان ادخل بيانات
                                  .child('output')//ادخال بيانات باسم رئيسي(اب) للبيانات الفرعية

                                  . child('state')  //عمل اسم متفرع(ابن)
                                  .set('on') //قيمة للابن من الادخال
                                  .asStream();

                            } else {
                              ref  //استخدام كائن من كلاس الداتا نفسة علشان ادخل بيانات
                                  .child('output')//ادخال بيانات باسم رئيسي(اب) للبيانات الفرعية

                                  . child('state')  //عمل اسم متفرع(ابن)
                                  .set('off') //قيمة للابن من الادخال
                                  .asStream();

                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}



*/
/*
  Flexible(               //عمل قائمة للادخالات التي موجودة في الداتا بيز
                child: FirebaseAnimatedList(
                  shrinkWrap: true,
                  query: _counterRef, //المرجع بيانات قائمة معينة في الداتا معرفة اعلي في فتح الصفحة
               itemBuilder: (BuildContext context,    //بناء جلب البيانات
                  DataSnapshot snapshot,    // الداتا بترجع في لقطة بيانات لها هنا
                 Animation<dynamic>animation,
                 dynamic index
                  ){

                var i =snapshot.key;
                 var m =snapshot.value.toString();
                    return  ListTile(    // رجوع علي هيئة ليست
                      trailing: Icon(Icons.wifi,color:  Color(0xFFAC2F09),size: 30,),
                      //عرض بيانات من لقطة البيانات المستلمة ووصول الي قيمة الاولي
                      title:Text(i,
                      style: TextStyle(
                        fontSize: 30,color: Color(0x8C6E341A)
                        ,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),),
                      subtitle:Text(m,
                      style: TextStyle(
                        fontSize: 50,color: Color(0x8CDD4D0B),fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),) ,
                                 );


                  }
                ),
                ),
*//*










//------------





*/
