import 'package:flutter/material.dart';
import 'tsd_navbar.dart';
import 'tsd_pages.dart';

// <key>NSLocationTemporaryUsageDescriptionDictionary</key>
// <dict>
// <key>YourPurposeKey</key>
// <string>The example App requires temporary access to the device&apos;s precise location.</string>
// </dict>
//ADD TO THE info.plist of ios inorder to await _geolocatorPlatform.requestTemporaryFullAccuracy(
//       purposeKey: "TemporaryPreciseAccuracy"

void main() { //MaterialApp is stateless, Scaffold is stateful
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF6F2E34)),
        useMaterial3: true,
        fontFamily: 'SourceCodePro'
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int page=1; //will number pages 1-4

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFE0CB),
      appBar: AppBar(
        backgroundColor: Color(0xFF6F2E34),
        title: Text('TJ Scavenger Shell', style: TextStyle(color: Color(0xFFEFE0CB)),),
      ),
      body: buildPages(page),
      bottomNavigationBar: buildNav(this),
    );
  }
}

Container buildPages(int page){
  switch(page){
    case 1: return freshMode1(); break;
    case 2: return leaderboard2(); break;
    case 3: return clueboard3(); break;
    default: return home0();
  }
  return Container();
}
