import 'package:dart_location_app/services/SessionManager.dart';
import 'package:dart_location_app/utills/Routes/Routes%20Name.dart';
import 'package:dart_location_app/utills/generalUtills.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final auth = FirebaseAuth.instance;
  final databaseref = FirebaseDatabase.instance.ref('user');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        actions:  [
          Padding(
              padding:const  EdgeInsets.only(right: 20),
              child: InkWell(
                  onTap: (){
                    auth.signOut().then((value){
                      GeneralUtils.ToastMessage('Logged Out');
                      Navigator.pushNamed(context, RoutesName.login);
                    }).onError((error, stackTrace){
                      GeneralUtils.ToastMessage(error.toString());
                    });
                  },

                  child:const  Icon(Icons.logout)))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration:const  BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(100),bottomLeft: Radius.circular(100),),
              ),
              child:const  Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CircleAvatar(
                      radius: 80,
                      child: Center(child:Icon(Icons.track_changes,size: 50,))),
                ],
              ),
            ),
            const SizedBox(height: 30,),
            Container(
              height: 300,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.orangeAccent.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
              StreamBuilder(
              stream: databaseref.child(SessionManager().userId.toString()).onValue,
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: LoadingIndicator(indicatorType: Indicator.ballClipRotate,strokeWidth: 3,));
          } else if (snapshot.hasData) {
            Map<dynamic, dynamic>? map = snapshot.data!.snapshot.value as Map<dynamic, dynamic>?;

            if (map != null) {
              // Process and display user profile information
              return
                ListTile(
                  title: Text(map['username'],style:const TextStyle(color: Colors.blue,fontSize: 23) ,),
                  subtitle:  Text(map['email'],style:const  TextStyle(color: Colors.blue,fontSize: 16)),
                  trailing: const Icon(Icons.arrow_circle_down,color: Colors.blue,),
                );
            } else {
              // Handle null data
              return const Text('Data not available');
            }
          } else {
            // Error state: Display an error message
            GeneralUtils.ToastMessage('Something went wrong');
            return Container(); // Return a fallback widget
          }
        },
      ),
                 const  Divider(),
                  Column(
                    children: [
                      Padding(
                        padding:const  EdgeInsets.only(left: 20),
                      child: Row(
                          children: [
                            Text('All Members -',style: Theme.of(context).textTheme.titleLarge!.copyWith(),)
                          ],
                        ),
                      ),
                      Padding(
                        padding:const  EdgeInsets.only(top: 70,left: 40),
                        child: Row(
                          children: [
                            IconButton(onPressed: (){
                              Navigator.pushNamed(context, RoutesName.trackLocation);
                            }, icon:const  Icon(Icons.location_searching,size: 38,color: Colors.blue,)),
                            const SizedBox(width: 129,),
                            IconButton(onPressed: (){
                              Navigator.pushNamed(context, RoutesName.theme);
                            }, icon:const  Icon(Icons.theaters,size: 38,color: Colors.blue,)),
                          ],
                        ),
                      ),
                  const  Padding(
                     padding: EdgeInsets.only(left: 25),
                     child:   Row(
                            children: [
                              Text(' Location',style: TextStyle(fontSize: 20,color: Colors.blue,)),
                               SizedBox(width: 100,),
                              Text('Themes',style: TextStyle(fontSize: 20,color: Colors.blue,)),
                            ],
                          ),
                   ),

                    ],
                  )
                ],
              ),
            ),
            Padding(
                padding:const EdgeInsets.only(top: 150,left: 280),
                child: FloatingActionButton(onPressed: (){},child:const  Center(child: Icon(Icons.add),),))
      ],
              ),

    )
    );
  }
}