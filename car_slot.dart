import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui';
import 'models/Name_Slots.dart';

class car_slot extends StatefulWidget {
  String? section;
   int? numSlot;
  car_slot( this.section,this.numSlot);
  @override
  State<car_slot> createState() => _car_slotState(section,numSlot);
}
/*savep() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      phone = preferences.getString("phone");
      print(phone);
    });*/
class _car_slotState extends State<car_slot> {
  shearTime()async{
     SharedPreferences preferences=await SharedPreferences.getInstance();
     preferences.setString('time', '${getTime}');
  }
  final _formKey=GlobalKey<FormState>();
  String? section;
  int? numSlot;
  _car_slotState( this.section,this.numSlot);
  String? time;
  String? getTime;
  String option1="30m";
  String option2="1h";
  String option3="5h";
  String option4="full";
   //DateTime dateTime30=DateTime.now().add(Duration(minutes: 5));
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    Future<Null> pickDateTime(BuildContext context) async{ }
   // Object? nameSote = ModalRoute.of(context)?.settings.arguments;

    return Scaffold(
      // backgroundColor: Colors.white24,
      appBar:AppBar(
        title: Text(" Car Slot",
          style:TextStyle(color: Color(0xffa2b7f3),fontSize: 22,),

        ),
        backgroundColor: Colors.white,
        //shadowColor: Colors.blue,
        leading:IconButton(onPressed: ( ){ Navigator.of(context).pushNamed('park_slot');}, icon: Icon( Icons.arrow_back_ios_new_rounded, ),
          color: Color(0xffa2b7f3),
          iconSize: 30,
          padding: EdgeInsets.only(top: 5),
        ),

        elevation: 0,
      ),
      body: Column(
        children: [

          Expanded(
            flex: 5,
            child: Container
              ( color:Colors.white,

              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      //  flex: 2,
                      height: 260,
                      child: Stack(
                        children: [
                          Center(
                            child: Positioned(
                              right: -size.width * 0.58, /// var size
                              bottom: -size.width * 0.79, /// var size
                              child: Container(
                                width: size.width,
                                height: size.width,
                                decoration:  BoxDecoration(
                                  border: Border.all(color: Color(0xffa2b7f3),width: 6,),
                                  //color: Colors.lightBlueAccent,
                                  shape: BoxShape.circle,
                                  //  border: Border.all(width: 2,color:Colors.green),
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Column(
                              children: [

                                Image.asset('assets/image/img.png',height: 210,width: 230,),

                              ],
                            ),
                          ),

                        ],
                      ),
                    ),

                    //  color: Colors.blue
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Card(
                            color: Color(0xffa2b7f3),
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: SizedBox(
                                width: 100,
                                //height: 50,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Slot section',
                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,color:Colors.white,)),
                                    // Text('Cabin',     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14,)),
                                    //SizedBox(height: 10),
                                    Center(
                                      child: RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                             text: '${section}',
                                              style: TextStyle(
                                                  fontSize: 28,
                                                  fontWeight: FontWeight.bold,
                                                color:Colors.white60,)),

                                        ]),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Card(
                            color: Color(0xffa2b7f3),
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: SizedBox(
                                width: 100,
                                //height: 50,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Slot number',
                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,color:Colors.white,)),
                                    // Text('Cabin',     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14,)),
                                    //SizedBox(height: 10),
                                    Center(
                                      child: RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text: '${numSlot}',
                                              style: TextStyle(
                                                  fontSize: 28,
                                                  fontWeight: FontWeight.bold,
                                                color:Colors.white60,)),

                                        ]),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],// children
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Card(
                            color: Color(0xffa2b7f3),
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: SizedBox(
                                width: 100,
                                //height: 50,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Timer',
                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,color:Colors.white,)),
                                    Container(
                                      decoration: BoxDecoration( border: Border.all(color: Color(0xffa2b7f3),)),
                                      child: Form(
                                        key: _formKey,
                                        child: DropdownButton<String>(
                                          hint:Text('Select Time',style: TextStyle(color: Colors.white,fontSize: 14,),),
                                          elevation: 4,
                                          value:time,
                                          // icon: Icon(Icons.arrow_downward,size:26,color: Colors.greenAccent,),
                                          isExpanded: true,
                                          style:TextStyle(color: Colors.deepPurple,fontSize: 19,),
                                          items: <String>[ '$option1','$option2','$option3','$option4'].map<DropdownMenuItem<String >>((String value) {
                                            return DropdownMenuItem<String>(
                                              value:value ,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          onChanged: (String? v) {   setState(()
                                          {
                                            time=v;
                                            getTime=time;
                                           // print(getTime);
                                          shearTime();
                                                            }
                                                            );
                                                         },
                                        ),

                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Card(
                            color: Color(0xffa2b7f3),
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: SizedBox(
                                width: 100,
                                //height: 50,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Price',
                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,color:Colors.white,)),
                                    // Text('Cabin',     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14,)),
                                    SizedBox(height: 13),
                                    Center(
                                      child: Column(
                                        children: [
                                          time =="$option1"? Text('2\$ ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,color:Colors.white,))
                                              :time =="$option2"? Text('3\$ ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,color:Colors.white,))
                                              :time =="$option3"? Text('4\$ ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,color:Colors.white,))
                                              :time =="$option4"? Text('5\$ ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,color:Colors.white,))
                                              : Text('0\$', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,color:Colors.white,)),
                                          SizedBox(height: 15),
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 23,
                          ),
                        ],// children
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(  colors: [Color(0xffa2b7f3), Color(0xffA595F8)]),
                        ),
                        child: MaterialButton( onPressed:
                            (
                            /// go to next page
                            ){
                          Navigator.of(context).pushNamed('login');
                            // setData();
                          setState(() { } );
                        },
                          child: Text(
                              'Booking',
                              style: TextStyle(color: Colors.white,fontSize: 18)
                          ),
                        ),
                      ),
                    ),

                  ],// children
                ),///content circle
              ),
            ),

          ),

        ],
      ),

    );
  }
}