import 'package:flutter/material.dart';
import 'main.dart';
import 'package:lottie/lottie.dart';
import 'package:drop_cap_text/drop_cap_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

Scaffold howitworks1(MyHomePageState state){
  TextStyle contentStyle = const TextStyle(color: Colors.black, fontFamily: 'SourceCodePro', fontSize: 15, height: 1.2);
  double imSize = 120;
  return Scaffold(
    appBar: infoBar(state, 'How It Works'),
    body: Container(padding: const EdgeInsets.all(15), color: Color(0xFFEFE0CB),child: ListView(children: [
      Container( padding: const EdgeInsets.all(10),
          child: DropCapText('TJ_Scavenger_Draft provides you with directions to any location within the school from any location in the school. However, to use this app you must have a fcps email to log in, and be within 15 meters of the school building. Search for your target room through the room\'s number, or teacher name (coming soon) and directions will guide you to your destination by referring to recognizable landmarks. Additionally, for further assitance, a hot-cold radar will update you on whether you are approaching closer, or straying further from your intended target.',
          style: contentStyle, dropCap: DropCap(width:imSize, height: imSize, child: const Icon(Icons.location_on_sharp, color: Color(0xFFEE7674), size: 100)) ))
      , Container( padding: const EdgeInsets.all(10),
    child: DropCapText('Our Scavenger Hunt (Coming Soon) will launch homecoming week. Students will be pitted against each other to be the quickest to solve the clues and find the hidden images around the school. Those who find the most images, the fastest will move up on the leader board. At the end of the each semester the top 3 winners from each grade will win a small prize. =＾● ⋏ ●＾= ',
        dropCapPosition: DropCapPosition.end, style: contentStyle, dropCap: DropCap(width: imSize, height:imSize, child: const Icon(Icons.location_on_sharp, color: Color(0xFFEE7674), size: 100))),),
      Container( padding: const EdgeInsets.all(10),
        child: DropCapText('You can see the current standings on the leaderboard page. Students will be compared to classmates in their own grade, and we will be vetting the emails to verify players are correctly reporting the grade they are in. ',
          style: contentStyle, dropCap: DropCap(width:imSize, height: imSize, child: const Icon(Icons.location_on_sharp, color: Color(0xFFEE7674), size: 100)) ))
    ],)
  ));
}
Scaffold howitwasbuilt2(MyHomePageState state){
  TextStyle contentStyle = const TextStyle(color: Colors.black, fontFamily: 'SourceCodePro', fontSize: 15, height: 1.2);
  double imSize = 120;
  return Scaffold(appBar: infoBar(state, 'How We Built This'),
      body: Container(padding: const EdgeInsets.all(15), color: const Color(0xFFEFE0CB),child: ListView(children: [
         Container( padding: const EdgeInsets.all(10),
          child: DropCapText(' The back-end of the textual directions was a Graph of interconnected landmarks. Then to find the most intuitive string of landmarks to get to a destination values of connections in the neural network were adjusted based on personal experience. Finally, though originally developed in python, we switched to C++ and then Java to integrate it the Dijkstra algorithm with Dart in flutter.  ',
              dropCapPosition: DropCapPosition.end, style: contentStyle, dropCap: DropCap(width: imSize, height:imSize, child: const Icon(Icons.location_on_sharp, color: Color(0xFFEE7674), size: 100))),),
        Container( padding: const EdgeInsets.all(10),
            child: DropCapText('We created a hot-cold beeper animation utilized the geolocator package, which gives latitude longitude coordinates, as well as floor. Then the lottie database of premade animations, as well as the lottie packages allowed us to fade the color according to meters to destination',
                style: contentStyle, dropCap: DropCap(width:imSize, height: imSize, child: const Icon(Icons.location_on_sharp, color: Color(0xFFEE7674), size: 100)) )),
        Container( padding: const EdgeInsets.all(10),
          child: DropCapText('The front end was created with flutter utilizing various packages (lottie, geolocator, drop_cap, fluid_bottom_navbar, etc.) to give the app professional-looking animations and flow. GET EXCITED for the new scavenger hunt feature!',
              dropCapPosition: DropCapPosition.end, style: contentStyle, dropCap: DropCap(width: imSize, height:imSize, child: const Icon(Icons.location_on_sharp, color: Color(0xFFEE7674), size: 100))),),

      ],)
      ));
}
Scaffold meetteam3(MyHomePageState state){
  TextStyle contentStyle = const TextStyle(color: Colors.black, fontFamily: 'SourceCodePro', fontSize: 15, height: 1.2);
  double listPad = 10;
  return Scaffold(appBar: infoBar(state, 'Meet the Team'),
  body: Container(padding: EdgeInsets.all(15), color: Color(0xFFEFE0CB),child: ListView( children: [
    Container(padding: EdgeInsets.all(listPad), child:Row(children:[ Icon(Icons.person), Text('Alexander Nassif', style: contentStyle),],)),
    Container(padding: EdgeInsets.all(listPad), child:Row(children:[ Icon(Icons.person), Text('Anusha Das', style: contentStyle),],)),
    Container(padding: EdgeInsets.all(listPad), child:Row(children:[ Icon(Icons.person), Text('Arvind Ragunathan', style: contentStyle),],)),
    Container(padding: EdgeInsets.all(listPad), child:Row(children:[ Icon(Icons.person), Text('Grace Jagga', style: contentStyle),],)),
    Container(padding: EdgeInsets.all(listPad), child:Row(children:[ Icon(Icons.person), Text('Rishabbh Chhabra', style: contentStyle),],)),
    Container(padding: EdgeInsets.all(listPad), child:Row(children:[ Icon(Icons.person), Text('Shreyan Dey', style: contentStyle),],)),
    Container(padding: EdgeInsets.all(listPad), child:Row(children:[ Icon(Icons.person), Text('Syed Hdr', style: contentStyle),],)),
  ],)));
}
Scaffold learnmore4(MyHomePageState state){
  return Scaffold(appBar: infoBar(state, 'How to Learn More',),
  body: Container(padding: EdgeInsets.all(25), color: Color(0xFFEFE0CB),child: ListView(children: [Text('Mobile Apps Development Club holds lectures on Android Studio, as well as flutter every Wednesday B Block. If you need help with code, feel free to pop in and ask one of the officers (See \'Meet the Team\'). Also if you have an idea for a project, you can pitch to us, and we can help make your vision a reality ;) '),
    Container(padding: EdgeInsets.all(15),alignment: Alignment.topCenter, child: Lottie.asset('assets/animation_llfhu00u.json', height: 300, repeat: true))])));
}
Scaffold profileInfo(MyHomePageState state, String? profileEmail, String? name){
  TextStyle contentStyle = const TextStyle(color: Colors.black, fontFamily: 'SourceCodePro', fontSize: 15, height: 1.2, fontWeight: FontWeight.bold);
  TextStyle textStyle = const TextStyle(color: Colors.black, fontFamily: 'SourceCodePro', fontSize: 15, height: 1.2);
  double listPad = 10;
  return Scaffold(appBar: infoBar(state, 'Profile Page',),
      body: Container(padding: EdgeInsets.all(15), color: Color(0xFFEFE0CB),child: ListView( children: [
        Container(padding: EdgeInsets.all(listPad), child: Text('Please sign in with your fcpsschools.net email. Or else you will not be able to use our location finding feature (⌐■_■)', style: textStyle)),
        Container(padding: EdgeInsets.all(listPad),child: Text('Email: ${profileEmail}', style: contentStyle)),
        Container(padding: EdgeInsets.all(listPad),child: Text('Name: ${name}', style: contentStyle)),
        Container(padding: EdgeInsets.all(listPad),child: Text('Profile Picture: Feature Coming Soon', style: contentStyle)),
        Container(padding: EdgeInsets.all(listPad),child: Text('Class Schedule: Feature Coming Soon', style: contentStyle)),
        Container(decoration: BoxDecoration(borderRadius:BorderRadius.circular(20) , color: Color(0xFFEE7674),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 3,
              offset: const Offset(-5, 5),),
          ],),
          margin: const EdgeInsets.all(10),
          child:
          InkWell( borderRadius: BorderRadius.circular(20),
              highlightColor: const Color(0xFF6F2E34),
              splashColor: Colors.black,
              splashFactory: InkRipple.splashFactory,
              onTap: (){state.setState(() {
                state.infoNum=6;
                state.infoScreen=true;
              });},
              child: Ink( padding: EdgeInsets.all(13), decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Color(0xFFEE7674)),
                  child: Text('Log In',  style: const TextStyle(color: Color(0xFFEFE0CB), fontFamily: 'SourceCodePro', fontSize: 20)))),
        ),Container(decoration: BoxDecoration(borderRadius:BorderRadius.circular(20) , color: Color(0xFFEE7674),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 3,
              offset: const Offset(-5, 5),),
          ],),
          margin: const EdgeInsets.all(10),
          child:
          InkWell( borderRadius: BorderRadius.circular(20),
              highlightColor: const Color(0xFF6F2E34),
              splashColor: Colors.black,
              splashFactory: InkRipple.splashFactory,
              onTap: (){state.setState(() {
                signout(state.context, state);
              });},
              child: Ink( padding: EdgeInsets.all(13), decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Color(0xFFEE7674)),
                  child: Text('Log out',  style: const TextStyle(color: Color(0xFFEFE0CB), fontFamily: 'SourceCodePro', fontSize: 20)))),
        ),

      ],)));
}
Scaffold loginPage(MyHomePageState state){
  TextStyle contentStyle = const TextStyle(color: Colors.black, fontFamily: 'SourceCodePro', fontSize: 15, height: 1.2);
  TextStyle titleStyle = TextStyle(fontFamily: 'Oswald', fontSize: 50);
  return Scaffold(appBar: infoBar2(state, 'Log in',),
  body: Container(alignment: Alignment.center, color: const Color(0xFF6F2E34), width: double.infinity, height: double.infinity,
      child: Card(color: Color(0xFFEFE0CB), margin: EdgeInsets.only(top: 200, bottom:200, right:50, left:50), elevation: 20,
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [Container(padding: const EdgeInsets.only(right:10, left: 10),child:Text('NavTJ Log In', style: titleStyle)),
            Container(padding: const EdgeInsets.all(15),child:Text('Please log in with the fcpsschools.net email ಠﻌಠ', style: contentStyle)),
            MaterialButton(
              onPressed: (){
                signup(state.context, state);
              },
              color: Colors.teal[100],
              elevation: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(height: 30.0,width: 30.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                        image: AssetImage('assets/googleimage.png'),
                        fit: BoxFit.cover),
                        shape: BoxShape.circle,
                ),
            ),
            SizedBox(
              width: 20,
            ),
            Text("Sign In with Google")
        ],),
      ),]))));
}

Future<void> signup(BuildContext context, MyHomePageState state) async {
  //await Firebase.initializeApp();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  await auth.signOut();
  await googleSignIn.signOut();
  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
  if (googleSignInAccount != null) {
    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    // Getting users credential
    UserCredential result = await auth.signInWithCredential(authCredential);
    User? user = result.user;

    if (result != null) {
      state.setState(() {
        if(user!=null){
          state.profileEmail=user.email;
          state.userDisplayName = user.displayName;
        }
        else state.profileEmail='error';
        state.infoScreen=true;
        state.infoNum=5;
      });
    }  // if result not null we simply call the MaterialpageRoute,
    // for go to the HomePage screen
  }
}
Future<void> signout(BuildContext context, MyHomePageState state) async {
  //await Firebase.initializeApp();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  await auth.signOut();
  await googleSignIn.signOut();

  state.setState(() {
    state.profileEmail = 'Unknown';
    state.userDisplayName = 'Unknown';
  });
}




AppBar infoBar(MyHomePageState state, String text){
  return AppBar(
    backgroundColor: Color(0xFF6F2E34),
    leading: GestureDetector(
      child: Icon( Icons.arrow_back_ios, color: Color(0xFFEFE0CB),  ),
      onTap: () {
        state.setState(() {
          state.infoScreen= false;
          state.page=0;
        });
      } ,
    ),
    title: Text(text, style: TextStyle(color: Color(0xFFEFE0CB)),),
  );
}
AppBar infoBar2(MyHomePageState state, String text){
  return AppBar(
    backgroundColor: Color(0xFF6F2E34),
    leading: GestureDetector(
      child: Icon( Icons.arrow_back_ios, color: Color(0xFFEFE0CB),  ),
      onTap: () {
        state.setState(() {
          state.infoScreen=true;
          state.infoNum=5;
        });
      } ,
    ),
    title: Text(text, style: TextStyle(color: Color(0xFFEFE0CB)),),
  );
}
