import 'package:flutter/material.dart';
import 'main.dart';
import 'package:lottie/lottie.dart';
import 'package:drop_cap_text/drop_cap_text.dart';

//TODO: make content fade in, the lotties repeat once only, and the

Scaffold howitworks1(MyHomePageState state){
  TextStyle contentStyle = const TextStyle(color: Colors.black, fontFamily: 'SourceCodePro', fontSize: 15, height: 1.2);
  double imSize = 120;
  return Scaffold(
    appBar: infoBar(state, 'How It Works'),
    body: Container(padding: EdgeInsets.all(15), color: Color(0xFFEFE0CB),child: ListView(children: [
      Container( padding: EdgeInsets.all(10),
          child: DropCapText('TJ_Scavenger_Draft provides you with directions to any location within the school from any location in the school. However, to use this app you must have a fcps email to log in, and be within 15 meters of the school building. Search for your target room through the room\'s number, or teacher name (coming soon) and directions will guide you to your destination by referring to recognizable landmarks. Additionally, for further assitance, a hot-cold radar will update you on whether you are approaching closer, or straying further from your intended target.',
          style: contentStyle, dropCap: DropCap(width:imSize, height: imSize, child: Lottie.asset('assets/animation_lkzliura.json', repeat: false)) ))
      , Container( padding: EdgeInsets.all(10),
    child: DropCapText('Our Scavenger Hunt (Coming Soon) will launch homecoming week. Students will be pitted against each other to be the quickest to solve the clues and find the hidden images around the school. Those who find the most images, the fastest will move up on the leader board. At the end of the each semester the top 3 winners from each grade will win a small prize. =＾● ⋏ ●＾= ',
        dropCapPosition: DropCapPosition.end, style: contentStyle, dropCap: DropCap(width: imSize, height:imSize, child: Lottie.asset('assets/animation_lkzoxj16.json', repeat: false))),),
      Container( padding: EdgeInsets.all(10),
        child: DropCapText('You can see the current standings on the leaderboard page. Students will be compared to classmates in their own grade, and we will be vetting the emails to verify players are correctly reporting the grade they are in. ',
          style: contentStyle, dropCap: DropCap(width:imSize, height: imSize, child: Lottie.asset('assets/animation_lkzpazuy.json', repeat: false)) ))
    ],)
  ));
}
Scaffold howitwasbuilt2(MyHomePageState state){
  return Scaffold(appBar: infoBar(state, 'How We Built This'),);
}
Scaffold meetteam3(MyHomePageState state){
  return Scaffold(appBar: infoBar(state, 'Meet the Team'),);
}
Scaffold learnmore4(MyHomePageState state){
  return Scaffold(appBar: infoBar(state, 'How to Learn More'),);
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
