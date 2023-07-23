import 'package:flutter/material.dart';

// Widget myInfoList(){
//   return MyInfosWidget();
// }

class MyInfosWidget extends StatefulWidget{
  const MyInfosWidget({super.key});
  @override
  State<MyInfosWidget> createState() => MyInfoWidgetState();
}
class MyInfoWidgetState extends State<MyInfosWidget>{
  double animPos = 20;

  @override
  void initState() {
    super.initState();
    Future(() {
      setState(() {
        animPos = 50.0;
      });
    });
  }

  Widget build(BuildContext context) {
    return Container(margin: EdgeInsets.only(top: 20, left: 5),child:
      ListView(children:[
      infoLabel(animPos, "How does the TJ_Scavenger App work?"),
      infoLabel(animPos, "How was TJ_Scavenger built?"),
      infoLabel(animPos, "Meet the Team"),
      infoLabel(animPos, "Want to learn more? Wednesday A Block MAD"),
    ]));
  }
}
//TODO: fix animation, add icons
//TODO: make actual info pages,
//TODO: profile and distance checker placeholder,
Widget infoLabel(double pos, String text){
  return Container(decoration: BoxDecoration(borderRadius:BorderRadius.circular(20) ,
    boxShadow: [
      BoxShadow(color: Colors.black.withOpacity(0.2),
        spreadRadius: 5,
        blurRadius: 3,
        offset: const Offset(-5, 5),),
    ],),
    margin: const EdgeInsets.all(10), child: AnimatedPositioned(
      left: pos,
      duration: const Duration(seconds: 50),
      child:
      InkWell( borderRadius: BorderRadius.circular(20), highlightColor: Color(0xFF6F2E34),
          splashColor: Colors.black,
          splashFactory: InkRipple.splashFactory,
          onTap: (){},
          child: Ink( padding: EdgeInsets.all(13), decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Color(0xFFEE7674)),
            child: Text(text,  style: TextStyle(color: Color(0xFFEFE0CB), fontFamily: 'SourceCodePro', fontSize: 20)))),
  ));
}


//make the info list tabs Slide & Fade animations