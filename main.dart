
//important note
/*
------smart parking sys. u.o.b info & comm.dep.
-----programmed by misk sabah under rules of supervisor
-----first version
----- 6 slot in 2 section are active
 */
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:parking/info_page.dart';
import 'package:parking/models/ultra_data.dart';
import 'package:parking/park_slot.dart';
import 'package:parking/parking_list.dart';
import 'package:parking/sin_up.dart';
import 'package:provider/provider.dart';
import 'car_slot.dart';
import 'log_in.dart';

//async
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    /*ChangeNotifierProvider(
        create: (context)=>ultra_data( ),*/
    return  ChangeNotifierProvider(
      create: (context)=>ultra_data( ),
      child: MaterialApp (
                  debugShowCheckedModeBanner: false,
                  home: FutureBuilder(
                    future: Firebase.initializeApp(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('error');
                      }
                      if (snapshot.connectionState == ConnectionState.done) {
                        return info_page();
                      }
                      return Text('loading');
                    },
                  ),
                  routes: {

                'parking_list':(context) => parking_list(),
                'park_slot':(context) => park_slots(),
                'car_slot':(context) => car_slot('null',0),
                'login': (context) => log_in(),
                'sin_up': (context) => sin_up(),
// end my project
                },
      //  ),
      ),
    );
  }
}

