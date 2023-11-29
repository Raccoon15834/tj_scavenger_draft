import 'package:flutter/material.dart';
import 'package:tj_scavenger_draft/tsd_pages.dart';
import 'main.dart';
import 'tsd_locations.dart';
import 'package:lottie/lottie.dart';
import 'package:drop_cap_text/drop_cap_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'backendStuff.dart';
import 'package:geolocator/geolocator.dart';

Scaffold howitworks1(MyHomePageState state){
  TextStyle contentStyle = const TextStyle(color: Colors.black, fontFamily: 'SourceCodePro', fontSize: 15, height: 1.2);
  double imSize = 120;
  return Scaffold(
    appBar: infoBar(state, 'How It Works'),
    body: Container(padding: const EdgeInsets.all(15), color: const Color(0xFFEFE0CB),child: ListView(children: [
      Container( padding: const EdgeInsets.all(10),
          child: DropCapText('TJ_Scavenger_Draft provides you with directions to any location within the school from anywhere inside. However, to use this app you must have a fcps email to log in, and be approximately within 15 meters of the school building. Search for your target room through the room\'s number, or teacher name (feature coming soon) and directions will guide you to your destination by referring to recognizable landmarks. Additionally, for further assitance, a hot-cold radar will update you on whether you are approaching closer, or straying further from your intended target.',
          style: contentStyle, dropCap: DropCap(width:imSize, height: imSize, child: const iconPopUp(myIcon: Icons.location_on_rounded)) ))
      , Container( padding: const EdgeInsets.all(10),
    child: DropCapText('Our Scavenger Hunt (Coming Soon) will launch homecoming week. Students will be pitted against each other to be the quickest to solve the clues and find the hidden images around the school. Those who find the most images, the fastest will move up on the leader board. At the end of each semester, the top 3 winners from each grade will win a small prize. =＾● ⋏ ●＾= ',
        dropCapPosition: DropCapPosition.end, style: contentStyle, dropCap: DropCap(width: imSize, height:imSize, child: const iconPopUp(myIcon: Icons.stars_rounded))),),
      Container( padding: const EdgeInsets.all(10),
        child: DropCapText('You can see the current standings on the leaderboard page. There will be four different leaderboards for each grade, and we will be vetting the emails to verify players are correctly reporting the grade they are in. ',
          style: contentStyle, dropCap: DropCap(width:imSize, height: imSize, child: const iconPopUp(myIcon: Icons.security_rounded)) ))
    ],)
  ));
}
Scaffold howitwasbuilt2(MyHomePageState state){
  TextStyle contentStyle = const TextStyle(color: Colors.black, fontFamily: 'SourceCodePro', fontSize: 15, height: 1.2);
  double imSize = 120;
  return Scaffold(appBar: infoBar(state, 'How We Built This'),
      body: Container(padding: const EdgeInsets.all(15), color: const Color(0xFFEFE0CB),child: ListView(children: [
         Container( padding: const EdgeInsets.all(10),
          child: DropCapText(' The back-end of the textual directions was a Graph of interconnected landmarks. Then an algorithm finds the shortest string of landmarks to get to your destination. Values of connections in the network were adjusted based on personal experience to make sure the route is intuitive. Finally, though originally developed in python, we switched to C++ to integrate the Dijkstra algorithm with Dart in flutter.  ',
              dropCapPosition: DropCapPosition.end, style: contentStyle, dropCap: DropCap(width: imSize, height:imSize, child: const iconPopUp(myIcon: Icons.webhook_rounded))),),
        Container( padding: const EdgeInsets.all(10),
            child: DropCapText('We created a hot-cold beeper animation utilizing the geolocator package, which gives latitude longitude coordinates, as well as floor (from altitude). Then the lottie database of premade animations allowed us to fade the color of the beeper according to meters to destination',
                style: contentStyle, dropCap: DropCap(width:imSize, height: imSize, child: const iconPopUp(myIcon: Icons.directions_walk_rounded)) )),
        Container( padding: const EdgeInsets.all(10),
          child: DropCapText('The front end was created with Flutter utilizing various packages (lottie, geolocator, drop_cap, fluid_bottom_navbar, firebase_core etc.) to give the app professional-looking animations and flow. Flutter allows development and testing across platforms. GET EXCITED for the new scavenger hunt feature!',
              dropCapPosition: DropCapPosition.end, style: contentStyle, dropCap: DropCap(width: imSize, height:imSize, child: const iconPopUp(myIcon: Icons.bubble_chart_rounded))),),

      ],)
      ));
}
Scaffold meetteam3(MyHomePageState state){
  TextStyle contentStyle = const TextStyle(color: Colors.black, fontFamily: 'SourceCodePro', fontSize: 15, height: 1.2);
  double listPad = 10;
  return Scaffold(appBar: infoBar(state, 'Meet the Team'),
  body: Container(padding: const EdgeInsets.all(15), color: const Color(0xFFEFE0CB),child: ListView( children: [
    Container(padding: EdgeInsets.all(listPad), child:Row(children:[ const Icon(Icons.person), Text('Alexander Nassif', style: contentStyle),],)),
    Container(padding: EdgeInsets.all(listPad), child:Row(children:[ const Icon(Icons.person), Text('Anusha Das', style: contentStyle),],)),
    Container(padding: EdgeInsets.all(listPad), child:Row(children:[ const Icon(Icons.person), Text('Arvind Ragunathan', style: contentStyle),],)),
    Container(padding: EdgeInsets.all(listPad), child:Row(children:[ const Icon(Icons.person), Text('Grace Jagga', style: contentStyle),],)),
    Container(padding: EdgeInsets.all(listPad), child:Row(children:[ const Icon(Icons.person), Text('Rishabbh Chhabra', style: contentStyle),],)),
    Container(padding: EdgeInsets.all(listPad), child:Row(children:[ const Icon(Icons.person), Text('Shreyan Dey', style: contentStyle),],)),
    Container(padding: EdgeInsets.all(listPad), child:Row(children:[ const Icon(Icons.person), Text('Syed Raza Haider', style: contentStyle),],)),
  ],)));
}
Scaffold learnmore4(MyHomePageState state){
  return Scaffold(appBar: infoBar(state, 'How to Learn More',),
  body: Container(padding: const EdgeInsets.all(25), color: const Color(0xFFEFE0CB),child: ListView(children: [const Text('Mobile Apps Development Club holds lectures on Android Studio, as well as flutter every Wednesday B Block. If you need help with code, feel free to pop in and ask one of the officers (See \'Meet the Team\'). Also if you have an idea for a project, you can pitch to us, and we can help make your vision a reality ;) '),
    Container(padding: const EdgeInsets.all(15),alignment: Alignment.topCenter, child: Lottie.asset('assets/animation_llfhu00u.json', height: 300, repeat: true))])));
}
Scaffold profileInfo(MyHomePageState state, String? profileEmail, String? name){
  TextStyle contentStyle = const TextStyle(color: Colors.black, fontFamily: 'SourceCodePro', fontSize: 15, height: 1.2, fontWeight: FontWeight.bold);
  TextStyle textStyle = const TextStyle(color: Colors.black, fontFamily: 'SourceCodePro', fontSize: 15, height: 1.2);
  double listPad = 10;
  return Scaffold(appBar: infoBar(state, 'Profile Page',),
      body: Container(padding: const EdgeInsets.all(15), color: const Color(0xFFEFE0CB),child: ListView( children: [
        Container(padding: EdgeInsets.all(listPad), child: Text('Please sign in with your fcpsschools.net email. Or else you will not be able to use our location finding feature (⌐■_■)', style: textStyle)),
        Container(padding: EdgeInsets.all(listPad),child: Text('Email: $profileEmail', style: contentStyle)),
        Container(padding: EdgeInsets.all(listPad),child: Text('Name: $name', style: contentStyle)),
        Container(padding: EdgeInsets.all(listPad),child: Text('Profile Picture: Feature Coming Soon', style: contentStyle)),
        Container(padding: EdgeInsets.all(listPad),child: Text('Class Schedule: Feature Coming Soon', style: contentStyle)),
        Container(decoration: BoxDecoration(borderRadius:BorderRadius.circular(20) , color: const Color(0xFFEE7674),
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
              child: Ink( padding: const EdgeInsets.all(13), decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: const Color(0xFFEE7674)),
                  child: const Text('Log In',  style: TextStyle(color: Color(0xFFEFE0CB), fontFamily: 'SourceCodePro', fontSize: 20)))),
        ),Container(decoration: BoxDecoration(borderRadius:BorderRadius.circular(20) , color: const Color(0xFFEE7674),
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
              child: Ink( padding: const EdgeInsets.all(13), decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: const Color(0xFFEE7674)),
                  child: const Text('Log out',  style: TextStyle(color: Color(0xFFEFE0CB), fontFamily: 'SourceCodePro', fontSize: 20)))),
        ),

      ],)));
}
Scaffold loginPage(MyHomePageState state){
  TextStyle contentStyle = const TextStyle(color: Colors.black, fontFamily: 'SourceCodePro', fontSize: 15, height: 1.2);
  TextStyle titleStyle = const TextStyle(fontFamily: 'Oswald', fontSize: 50);
  return Scaffold(appBar: infoBar2(state, 'Log in',),
  body: Container(alignment: Alignment.center, color: const Color(0xFF6F2E34), width: double.infinity, height: double.infinity,
      child: Card(color: const Color(0xFFEFE0CB), margin: const EdgeInsets.only(top: 200, bottom:200, right:50, left:50), elevation: 20,
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
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                        image: AssetImage('assets/googleimage.png'),
                        fit: BoxFit.cover),
                        shape: BoxShape.circle,
                ),
            ),
            const SizedBox(
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
        state.fcpsLogIn = state.profileEmail?.endsWith('fcpsschools.net');
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
    state.fcpsLogIn=false;
  });
}
Widget buildLocationInfoScreen(HotColdState state, Location loc, int num){
  TextStyle contentStyle = const TextStyle(color: Colors.black, fontFamily: 'SourceCodePro', fontSize: 15, height: 1.2, fontWeight: FontWeight.bold);
  TextStyle textStyle = const TextStyle(color: Colors.black, fontFamily: 'SourceCodePro', fontSize: 15, height: 1.2);
  double listPad = 10;
  String prompt = "Is this the room you want to go to?";
  String yesButtonText = "Let's Go!";
  if(num==2) {
    prompt = "Is the room you are currently at?";
    yesButtonText = "I am Here!";
  }
  return ListView(shrinkWrap: true, children: [
        Container(padding: EdgeInsets.all(listPad), child: Text(prompt, style: textStyle)),
        Container(padding: EdgeInsets.all(listPad),child: Text('Room Name: ${loc.roomNum}', style: contentStyle)),
        Container(padding: EdgeInsets.all(listPad),child: Text('Teacher: ${loc.teacherName}', style: contentStyle)),
        Container(decoration: BoxDecoration(borderRadius:BorderRadius.circular(20) , color: const Color(0xFFEE7674),
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
                state.displayLocInfoScreen=false;
                if(num==1) state.destination = state.infoScreenLocation;
                if(num==2) state.currentLoc = state.infoScreenLocation;
                state.searchMode2 = false;
                state.searchMode = false;
                List<String> temp = [state.currentLoc.roomNum, state.destination.roomNum];
                List<String> li =dij(temp);
                state.directions = li;
                state.distBtwLocNTarget = Geolocator.distanceBetween(state.currentLoc.latitude, state.currentLoc.longitude, state.destination.latitude, state.destination.longitude);

              });},
              child: Ink( padding: const EdgeInsets.all(13), decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Color(0xFFEE7674)),
                  child:  Text(yesButtonText,  style:  const TextStyle(color: Color(0xFFEFE0CB), fontFamily: 'SourceCodePro', fontSize: 20)))),
        ),Container(decoration: BoxDecoration(borderRadius:BorderRadius.circular(20) , color: const Color(0xFFEE7674),
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
                  state.displayLocInfoScreen=false;
                  state.searchMode2 = false;
                  state.searchMode = false;
                  // List<String> temp = [state.currentLoc.roomNum, state.destination.roomNum];
                  // List<String> li =dij(temp);
                  // state.directions = li;
                  // state.distBtwLocNTarget = Geolocator.distanceBetween(state.currentLoc.latitude, state.currentLoc.longitude, state.destination.latitude, state.destination.longitude);
              });},
              child: Ink( padding: const EdgeInsets.all(13), decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: const Color(0xFFEE7674)),
                  child: const Text('Cancel',  style:  TextStyle(color: Color(0xFFEFE0CB), fontFamily: 'SourceCodePro', fontSize: 20)))),
        ),

      ],);
}




AppBar infoBar(MyHomePageState state, String text){
  return AppBar(
    backgroundColor:const Color(0xFF6F2E34),
    leading: GestureDetector(
      child: const Icon( Icons.arrow_back_ios, color: Color(0xFFEFE0CB),  ),
      onTap: () {
        state.setState(() {
          state.infoScreen= false;
          state.page=0;
        });
      } ,
    ),
    title: Text(text, style: const TextStyle(color: Color(0xFFEFE0CB)),),
  );
}
AppBar infoBar2(MyHomePageState state, String text){
  return AppBar(
    backgroundColor: const Color(0xFF6F2E34),
    leading: GestureDetector(
      child: const Icon( Icons.arrow_back_ios, color: Color(0xFFEFE0CB),  ),
      onTap: () {
        state.setState(() {
          state.infoScreen=true;
          state.infoNum=5;
        });
      } ,
    ),
    title: Text(text, style: const TextStyle(color: Color(0xFFEFE0CB)),),
  );
}

class iconPopUp extends StatefulWidget{
  const iconPopUp({super.key, required this.myIcon});
  final IconData myIcon;

  @override
  State<iconPopUp> createState() => iconPopUpState(ic: myIcon);
}

class iconPopUpState extends State<iconPopUp> with TickerProviderStateMixin {
  //ANIMATION PARTS
  iconPopUpState({required this.ic});
  late AnimationController _animation; //PART ONE
  final IconData ic;

  @override
  void initState() {//PART TWO
    super.initState();
    _animation = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    )..forward();
  }
  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }
  late final Animation<double> myAnim = CurvedAnimation(
    parent: _animation,
    curve: Curves.elasticOut,
  );
  Widget build(BuildContext context) {
    return ScaleTransition(
        scale: myAnim,
        child: Icon(ic, color: const Color(0xFFEE7674), size: 100)
    );
  }
}


