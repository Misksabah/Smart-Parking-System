
import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:parking/service/database.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
class log_in extends StatefulWidget {

  @override
  State<log_in> createState() => _log_inState();
}

class _log_inState extends State<log_in> {// Color(0xffa2b7f3)// Color(0xffa2b7f3),
  late final dref=FirebaseDatabase.instance.reference();
  late DatabaseReference databaseReference;
  String? time;
  String? def_time;
  String? selctor_ultra;
  Timer? timer;
  int? timeinM;
  int? addTimeinM;
  int? timeChe;
  String? selct;
  getSheared()async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    //setState(() {
      time=preferences.getString('time');
      selctor_ultra=preferences.getString('ultra');
      print(time);
      print(selctor_ultra);
    //});
  }

  updateData( ){
    selct=selctor_ultra;
    dref.child('info').update(
        {
          '${selct}':'rev',
        }
    );
  }
  updateData2(){
   selct=selctor_ultra;
    dref.child('info').update(
        {
          '${selct}':'off',
        }
    );
  }
  startTime( addTimeinM){
    timeinM=addTimeinM;
    int Time=timeinM! * 60;
     timer=Timer.periodic(Duration(seconds: 2), (timer) {
       setState(() {
         if( Time>0) {
           Time--;
           print('time in sec');
           print(Time);
           updateData();
           if(Time%60==0)
             {
               timeinM=(timeinM!-1)!;
               print('time is=============m');
               print(timeinM);
             }
           }
         else if(Time==0){
          timeinM=0;
          updateData2();
           timer.cancel();
         }else{timeinM=0;
         updateData2();
         timer.cancel();}
     });
     });
   }
  var nameController= TextEditingController();
  var phoneController= TextEditingController();
  var carController= TextEditingController();
  final _formKey=GlobalKey<FormState>();
  String _name= ' ';
  String _phone= ' ';
  String _carNo= ' ';
  String? payway;    //String dropdownValue = 'One';

  @override
  void initState() {
    super.initState();
    getSheared();

  }
  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,// Color(0xffa2b7f3)// Color(0xffa2b7f3),
        leading:IconButton(onPressed: ( ){ Navigator.of(context).pushNamed('car_slot');}, icon: Icon( Icons.arrow_back_ios_new_rounded, ),
          color:Color(0xffa2b7f3),
          iconSize: 30,
          padding: EdgeInsets.only(top: 5),

        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              color: Colors.white70,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(

                        child : Icon(
                          Icons.people_alt_outlined,size: 80,color: Color(0xffa2b7f3),
                        ),

                      ),
                      Padding(
                        padding: EdgeInsets.only(top:10,left: 20,right: 20),
                        child: Text('Bookners Information',
                          textAlign: TextAlign.center,
                          style:TextStyle(color: Color(0xffa2b7f3),fontSize: 26,
                            fontWeight:FontWeight.bold,
                            letterSpacing:1.2,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5,left: 35,right: 35),
                        child: Column(
                          children: [
                            Container(

                              child: TextFormField(
                                controller: nameController,
                                // validator: (value)=>value.isEmpty ? 'enter your name':null,
                                validator: (String? value) {
                                  if (value != null && value.isEmpty) {
                                    return "Please, Enter your name";
                                  }
                                  return null;
                                },
                                onChanged: (value)=>_name=value,
                                decoration: InputDecoration(
                                    labelText: 'Name',
                                    labelStyle: TextStyle( color: Colors.deepPurpleAccent,fontSize: 18,),
                                    prefixIcon: Icon(Icons.person,size: 30,color: Color(0xffA595F8),)),
                              ),
                            ),
                            Container(
                              child: TextFormField(
                                controller: phoneController,
                                validator: ( value) {
                                  if (value!.isEmpty) {
                                    return " Please, Enter the phone number";
                                  }
                                  else if (value.length < 11 || value.length > 11) {
                                    return " Phone number should be 11 digit";
                                  }
                                },
                                onChanged: (value)=>_phone=value,
                                decoration: InputDecoration(
                                  labelText: 'phone number',
                                  labelStyle: TextStyle( color: Colors.deepPurpleAccent,fontSize: 18,),
                                  prefixIcon: Icon(Icons.local_phone,size: 30,color: Color(0xffA595F8),),
                                ),
                                obscureText: true,
                              ),
                            ),
                            Container(
                              child: TextFormField(
                                controller: carController,
                                validator: ( value) {
                                  if (value!.isEmpty) {
                                    return " Please, Enter the car number";
                                  }
                                },
                                onChanged: (value)=>_carNo=value,

                                decoration: InputDecoration(
                                  labelText: 'car number',
                                  labelStyle: TextStyle( color: Colors.deepPurpleAccent,fontSize: 18,),
                                  prefixIcon: Icon(Icons.car_rental_rounded,size: 34,color: Color(0xffA595F8),),
                                ),
                                obscureText: true,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Container(
                                decoration: BoxDecoration(
                                  // border: Border.all(color: Colors.black26,)
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white60,

                                ),
                                child:  DropdownButton<String>(
                                  hint:Text('Select Payment Way',style: TextStyle(color: Color(0xffa2b7f3),fontSize: 14,),),
                                  elevation: 4,
                                  value:payway,
                                  isExpanded: true,
                                  style:TextStyle(color: Colors.black,fontSize: 19,),
                                  items: <String>[ 'Master card','visa Credit'].map<DropdownMenuItem<String >>((String value) {
                                    return DropdownMenuItem<String>(
                                      value:value ,
                                      child: Text(value),

                                    );
                                  }).toList(),
                                  onChanged:(String? v) {   setState(() {payway=v; } );},
                                ),
                              ),
                            ),
                            Divider(
                              height: 6,
                              color: Colors.black,
                            ),

                            SizedBox(height: 20),
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Container(
                                height: 50,
                                width: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(  colors: [Color(0xffa2b7f3), Color(0xffA595F8)]),
                                ),
                                child: MaterialButton(
                                  onPressed: ( ){
                                    setState(() {
                                      if(_formKey.currentState!.validate())
                                     {
                                           // Navigator.of(context).pushNamed('car_slot');not correct
                                       //to store in firestore important
                                         DatabaseService().insertData(nameController.text,carController.text,'${payway}',phoneController.text);
                                        time=='30m'?addTimeinM=1
                                            :time=='1h'? addTimeinM=2
                                            :time=='5h'? addTimeinM=3
                                            :time=='full'? addTimeinM=4
                                            : addTimeinM=0;
                                        addTimeinM==1?startTime(addTimeinM)
                                            :addTimeinM==2?startTime(addTimeinM)
                                            :addTimeinM==3?startTime(addTimeinM)
                                            :addTimeinM==4?startTime(addTimeinM)
                                            :addTimeinM=0;
                                      Navigator.of(context).pushNamed('park_slot');
                                       }
                                    });
                                    // print(nameController.text);
                                    // print(phoneController.text);

                                  },
                                  child: Text(
                                      'Booking',
                                      style: TextStyle(color: Colors.white,fontSize: 18)
                                              ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),


                      Container(
                        //  flex: 2,
                        height: 200,
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: -size.width * 0.7, /// var size
                              child: Container(
                                width: size.width,
                                height: size.width,
                                //color: Colors.lightBlueAccent,

                                decoration: const BoxDecoration(
                                    color: Colors.lightBlueAccent,
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.topLeft,
                                      colors: [
                                        Color(0xffA595F8),
                                        Color(0xffa2b7f3)
                                        // Colors.green,
                                      ],
                                    )


                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                    ],// children
                  ),
                ),
              ),
            ),

          ),
        ],
      ),
    );
  }
}// end log in