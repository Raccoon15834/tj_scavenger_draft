import 'package:flutter/material.dart';

// Widget myInfoList(){
//   return MyInfosWidget();
// }

class MyInfosWidget extends StatefulWidget{
  const MyInfosWidget({super.key});
  @override
  State<MyInfosWidget> createState() => MyInfoWidgetState();
}
class MyInfoWidgetState extends State<MyInfosWidget> with TickerProviderStateMixin {
  late AnimationController _animation;

  @override
  void initState() {
    super.initState();
    _animation = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..forward();
  }
  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }


  Widget build(BuildContext context) {
    return Container(margin: EdgeInsets.only(top: 20, left: 5),child:
      ListView(children:[
      infoLabel(_animation, "How does the TJ_Scavenger App work?",-0.75),
      infoLabel(_animation, "How was TJ_Scavenger built?",-0.5),
      infoLabel(_animation, "Meet the Team",-0.75),
      infoLabel(_animation, "Want to learn more? Wednesday A Block MAD",-1),
    ]));
  }
}
//TODO: fix animation (stack is not constrained error), add icons
//TODO: make actual info pages,
//TODO: profile and distance checker placeholder,
//TODO: calibrate beeper based on original distance from destination
Widget infoLabel(AnimationController posAnim, String text, double firstOffset){
  Animation<Offset> myAnim = Tween<Offset>(
    begin:  Offset(firstOffset, 0.0),
    end: Offset.zero,
  ).animate(CurvedAnimation(
      parent: posAnim,
      curve: Curves.elasticOut
  ));
  return SlideTransition(
      position: myAnim,
      child: Container(decoration: BoxDecoration(borderRadius:BorderRadius.circular(20) ,
    boxShadow: [
      BoxShadow(color: Colors.black.withOpacity(0.2),
        spreadRadius: 5,
        blurRadius: 3,
        offset: const Offset(-5, 5),),
    ],),
    margin: const EdgeInsets.all(10),
    child:
      InkWell( borderRadius: BorderRadius.circular(20), highlightColor: const Color(0xFF6F2E34),
          splashColor: Colors.black,
          splashFactory: InkRipple.splashFactory,
          onTap: (){},
          child: Ink( padding: EdgeInsets.all(13), decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Color(0xFFEE7674)),
            child: Text(text,  style: TextStyle(color: Color(0xFFEFE0CB), fontFamily: 'SourceCodePro', fontSize: 20)))),
  ));
}


//make the info list tabs Slide & Fade animations