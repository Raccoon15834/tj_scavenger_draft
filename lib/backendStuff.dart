import 'package:dijkstra/dijkstra.dart';
//each connection has a message (directional) DONE, and a weighting
//make graph and a map with them
//each connection has many sattelite rooms + itself (another map)

//check sattelites map to see what its landmark is
//to return directions - dijkstra the map
//from the boboutput you need to get the messages
List<String> dij(List<String> l) {
  String? from = l.elementAt(0);
  String? to = l.elementAt(1);
  Map<String, String> messages = {
    "AuditoriumLobbyGym1":" Enter Gym 1 to the left of the cubbies",
    "Gym1AuditoriumLobby":" Exit Gym 1 into the lobby",
    "AuditoriumLobbyArtGallery":" Walk through the doorway towards Nobel Commons",
    "ArtGalleryAuditoriumLobby":" Walk through the doorway away from the Nobel Commons",
    "AuditoriumLobbyAuditoriumStaircase":" Enter the nearby staircase",
    "AuditoriumStaircaseAuditoriumLobby":" Exit the staircase",
    "NobelCommonsArtGallery":" Facing the dome go down the hallway to the Art Gallery",
    "ArtGalleryNobelCommons":" Go down the hallway to Nobel Commons",
    "NobelCommonsAuditoriumLobby":" Go down the hallway to the Auditorium Lobby",
    "AuditoriumLobbyNobelCommons":" Go down the hallway to Nobel Commons",
    "ArtGalleryAuditoriumStaircase":" Enter the nearby staircase",
    "AuditoriumStaircaseArtGallery":" Exit the staircase",
    "ArtGalleryGandhiCommons":" Go around the corner to Gandhi Commons",
    "GandhiCommonsArtGallery":" Go down the hallway to the Art Gallery",
    "NobelCommonsNobelStaircase":" Go to the nearby stairs",
    "NobelStaircaseNobelCommons":" Exit the stairs",
    "NobelCommonsGalileoCommons":" Go down the hallway to Galileo Commons",
    "GalileoCommonsNobelCommons":" Go down the hallway to Nobel Commons",
    "NobelCommonsLanguageHallway1":" Go around the corner to Language Hallway 1",
    "LanguageHallway1NobelCommons":" Go down the hallway and around the corner to Nobel Commons",
    "GalileoCommonsLanguageHallway1":" Enter Language Hallway 1 (closer to Nobel Commons)",
    "LanguageHallway1GalileoCommons":" Exit language hallway and walk to the right",
    "GalileoCommonsLanguageHallway2":" Enter Language Hallway 2 (farther from Nobel Commons)",
    "LanguageHallway2GalileoCommons":" Exit language hallway and walk to the right",
    "LanguageHallway1LanguageHallway2":" Use the small hallway between both Language Hallways",
    "LanguageHallway2LanguageHallway1":" Use the small hallway between both Language Hallways",
    "LanguageHallway2LanguageHallwayStaircase":" Walk to the staircase in the middle of Language Hallway 2",
    "LanguageHallwayStaircaseLanguageHallway2":" Exit the staircase into Language Hallway 2",
    "GalileoCommonsDaVinciCommons":" Facing the Greenhouse Courtyard windows walk left and enter DaVinci Commons on the left",
    "DaVinciCommonsGalileoCommons":" Exit DaVinci commons and walk to the right",
    "GalileoCommonsDaVinciStaircase":" Facing the Greenhouse Courtyard windows walk left past DaVinci Commons and enter the staircase to the left",
    "DaVinciStaircaseGalileoCommons":" Exit DaVinci stairwell and walk to the right",
    "GalileoCommonsCafeteria":" Facing the Greenhouse Courtyard windows walk left to the end of the hallway",
    "CafeteriaGalileoCommons":" Walk straight until you see Galileo Commons on your left",
    "DaVinciCommonsDaVinciStaircase":" Exit the commons and find the staircase immediately to your left",
    "DaVinciStaircaseDaVinciCommons":" Exit the staircase and walk into the commons immediately to your right",
    "DaVinciCommonsQuantumStaircase":" Facing the commons entrance walk to the end of the right hallway and enter the staircase",
    "QuantumStaircaseDaVinciCommons":" Exit the staircase and walk into the main space of DaVinci Commons",
    "DaVinciCommonsFishStaircase":" Facing the commons entrance walk to the end of the left hallway and enter the staircase",
    "FishStaircaseDaVinciCommons":" Exit the staircase and walk into the main space of DaVinci Commons",
    "CafeteriaDaVinciStaircase":" Walk straight down the hallway and find the staircase to your right",
    "DaVinciStaircaseCafeteria":" Exit the staircase and walk to the end of the hallway on the left",
    "CafeteriaFishStaircase":" Exit the cafeteria and walk to the end of the hallway on your right",
    "FishStaircaseCafeteria":" Exit the staircase and walk to the end of the hallway on your left",
    "TuringCommonsDaVinciStaircase":" Exit Turing Commons and walk to the end of the hallway on your right. Then walk left and find the staircase on your right",
    "DaVinciStaircaseTuringCommons":" Exit the staircase and walk left before taking an immediate right at the first hallway. Walk halfway through the hallway and enter turing commons on your left",
    "TuringCommonsTuringStaircase":" Enter the staircase at the back of Turing Commons",
    "TuringStaircaseTuringCommons":" Exit the staircase into Turing Commons",
    "TuringCommonsDoor6":" Exit Turing Commons and walk to the left towards the Door 6 sign",
    "Door6TuringCommons":" Walk down the hallway away from the Door 6 sign and find Turing Commons on your right",
    "EinsteinCommonsDoor6":" Exit Einstein Commons walk right towards the hallway intersection",
    "Door6EinsteinCommons":" Facing the Door 6 sign walk right and find Einstein commons on your left",
    "EinsteinCommonsEinsteinStaircase":" Enter the staircase at the back of Einstein Commons",
    "EinsteinStaircaseEinsteinCommons":" Exit the staircase into Einstein Commons",
    "EinsteinCommonsLanguageHallway2":" Exit Einstein Commons to your left and enter the Language Hallway 2 (first one you see) to your right",
    "LanguageHallway2EinsteinCommons":" Exit the hallway to your left and find Einstein Commons on your right",
    "EinsteinCommonsDarwinCommons":" Exit Einstein Commons to your left and find Darwin Commons on your left",
    "DarwinCommonsEinsteinCommons":" Exit Darwin Commons to your right and find Einstein Commons on your right",
    "DarwinCommonsLanguageHallway1":" Enter Language Hallway 1 from the left of the commons",
    "LanguageHallway1DarwinCommons":" Enter Darwin Commons at the end of the hallway",
    "DarwinCommonsLanguageHallway2":" Enter Language Hallway 2 from the right of the commons",
    "LanguageHallway2DarwinCommons":" Enter Darwin Commons at the end of the hallway",
    "DarwinCommonsFaradayCommons":" Exit Darwin Commons to your left and find Einstein Commons on your left",
    "FaradayCommonsDarwinCommons":" Exit Faraday Commons to your left and find Darwin Commons on your left",
    "FaradayCommonsLanguageHallway1":" Exit Faraday Commons to the left and turn left into Language Hallway 1",
    "LanguageHallway1FaradayCommons":" Exit Language Hallway 1 to the right and find Faraday Commons on your right",
    "FaradayCommonsFaradayStaircase":" Exit Faraday Commons to the right and enter Faraday Staircase immediately to your left",
    "FaradayStaircaseFaradayCommons":" Exit Faraday Staircase and find Faraday Commons to your right",
    "FaradayCommonsGym2":" Exit Faraday Commons to the right and find the Gym 2 entrance around the corner of the hallway intersection",
    "Gym2FaradayCommons":" Exit Gym 2 to the right towards the hallway intersection. Then walk down the hallway and find Faraday Commons on your left",
    "Gym2GandhiCommons":" Take a right out of Gym 2 followed by an immediate left and walk down the hallway. Find the Gandhi Commons on your right",
    "GandhiCommonsGym2":" Facing the windows to the courtyard walk right and find the Gym 2 entrance to your right",
    "Gym2Door9":" Exit Gym 2 and take two right turns towards the Door 9 sign",
    "Door9Gym2":" Walk in the direction opposite to the Door 9 sign and take the first left",
    "Door9FaradayCommons":" Walk in the direction opposite to the Door 9 sign and take the first right. The commons should be on your left slightly down the hallway",
    "FaradayCommonsDoor9":" Facing the windows to the courtyard walk left and the Door 9 sign should be on your left",
    "Door9FaradayStaircase":" Walk in the direction opposite to the Door 9 sign and take the first right. Enter the staircase on your immediate right",
    "FaradayStaircaseDoor9":" Exit the staircase and take two immediate lefts",
    "TuringCommonsTuringElevator":" Walk out of Turing Commons and find the elevator on your left",
    "TuringElevatorTuringCommons":" Walk into Turing Commons",
    "TuringElevatorDoor6":" Walk in the direction of the Door 6 sign at the end of the hallway",
    "Door6TuringElevator":" Walk in the opposite direction of the Door 6 sign",
    "TuringElevatorTuringHallway":" Walk straight in the direction where the commons is on your right",
    "TuringHallwayTuringElevator":" Head in the direction of the Door 6 sign and find the elevator on your left",
    "TuringCommonsTuringHallway":" Head into the main hallway and walk straight in the direction where the commons is on your right",
    "TuringHallwayTuringCommons":" Head in the direction of the Door 6 sign and the commons should be on your left",
    "TuringHallwayDaVinciStaircase":" Head in the direction opposite to the Door 6 sign and take a right at the end of the hallway",
    "DaVinciStaircaseTuringHallway":" Head in the direction of the cafeteria and take the first right",
    "BandHallwayAuditoriumLobby":" Walk to the trophy case and turn left through the double doors",
    "AuditoriumLobbyBandHallway":" Walk out of the double doors at the end of the hallway",
    "AuditoriumStaircaseFranklinStaircase":" Walk up the staircase",
    "FranklinStaircaseAuditoriumStaircase":" Walk down the staircase",
    "NobelStaircaseNobelBalconyStaircase":" Walk up the staircase",
    "NobelBalconyStaircaseNobelStaircase":" Walk down the staircase",
    "DaVinciStaircaseCurieStaircase":" Walk up the staircase",
    "CurieStaircaseDaVinciStaircase":" Walk down the staircase",
    "QuantumStaircaseRoboticsStaircase":" Walk up the staircase",
    "RoboticsStaircaseQuantumStaircase":" Walk down the staircase",
    "FishStaircaseSysLabStaircase":" Walk up the staircase",
    "SysLabStaircaseFishStaircase":" Walk down the staircase",
    "LanguageHallwayStaircaseLibraryStaircase":" Walk up the staircase",
    "LibraryStaircaseLanguageHallwayStaircase":" Walk down the staircase",
  };
  Map<String, String> landmarkSatellites= {
    "AuditoriumLobby":"AuditoriumLobby",
    "Auditorium":"AuditoriumLobby",
    "130":"AuditoriumLobby",
    "BandHallway":"BandHallway",
    "131":"BandHallway",
    "134":"BandHallway",
    "135":"BandHallway",
    "NobelCommons":"NobelCommons",
    "Admin":"NobelCommons",
    "Dome":"NobelCommons",
    "115":"NobelCommons",
    "68":"NobelCommons",
    "ArtGallery":"ArtGallery",
    "PCR":"ArtGallery",
    "118":"ArtGallery",
    "111":"ArtGallery",
    "113":"ArtGallery",
    "GalileoCommons":"GalileoCommons",
    "12":"GalileoCommons",
    "11":"GalileoCommons",
    "14":"GalileoCommons",
    "15":"GalileoCommons",
    "DaVinciCommons":"DaVinciCommons",
    "3":"DaVinciCommons",
    "4":"DaVinciCommons",
    "5":"DaVinciCommons",
    "6":"DaVinciCommons",
    "7":"DaVinciCommons",
    "8":"DaVinciCommons",
    "9":"DaVinciCommons",
    "DaVinciStaircase":"DaVinciStaircase",
    "LostandFound":"DaVinciStaircase",
    "Cafeteria":"Cafeteria",
    "2":"Cafeteria",
    "16":"Cafeteria",
    "17":"Cafeteria",
    "10":"Cafeteria",
    "TuringCommons":"TuringCommons",
    "26":"TuringCommons",
    "27":"TuringCommons",
    "28":"TuringCommons",
    "29":"TuringCommons",
    "31":"TuringCommons",
    "33":"TuringCommons",
    "34":"TuringCommons",
    "36":"TuringCommons",
    "TuringElevator":"TuringElevator",
    "23":"TuringElevator",
    "37":"TuringElevator",
    "39":"TuringElevator",
    "TuringHallway":"TuringHallway",
    "22":"TuringHallway",
    "18":"TuringHallway",
    "Door6":"Door6",
    "40":"Door6",
    "42":"Door6",
    "44":"Door6",
    "45":"Door6",
    "46":"Door6",
    "48":"Door6",
    "EinsteinCommons":"EinsteinCommons",
    "50":"EinsteinCommons",
    "51":"EinsteinCommons",
    "52":"EinsteinCommons",
    "53":"EinsteinCommons",
    "54":"EinsteinCommons",
    "47":"EinsteinCommons",
    "56":"EinsteinCommons",
    "57":"EinsteinCommons",
    "LanguageHallway1":"LanguageHallway1",
    "69":"LanguageHallway1",
    "70":"LanguageHallway1",
    "71":"LanguageHallway1",
    "73":"LanguageHallway1",
    "74":"LanguageHallway1",
    "75":"LanguageHallway1",
    "LanguageHallway2":"LanguageHallway2",
    "66":"LanguageHallway2",
    "65":"LanguageHallway2",
    "64":"LanguageHallway2",
    "62":"LanguageHallway2",
    "61":"LanguageHallway2",
    "60":"LanguageHallway2",
    "DarwinCommons":"DarwinCommons",
    "77":"DarwinCommons",
    "80":"DarwinCommons",
    "81":"DarwinCommons",
    "Planetarium":"DarwinCommons",
    "58":"DarwinCommons",
    "59":"DarwinCommons",
    "FaradayCommons":"FaradayCommons",
    "83":"FaradayCommons",
    "84":"FaradayCommons",
    "85":"FaradayCommons",
    "86":"FaradayCommons",
    "87":"FaradayCommons",
    "82":"FaradayCommons",
    "GandhiCommons":"GandhiCommons",
    "105":"GandhiCommons",
    "106":"GandhiCommons",
    "107":"GandhiCommons",
    "109":"GandhiCommons",
    "103":"GandhiCommons",
    "104":"GandhiCommons",
    "110":"GandhiCommons",
    "Door9":"Door9",
    "88":"Door9",
    "89":"Door9",
    "WeightRoom":"WeightRoom",
    "Boy’sTeamRoom":"WeightRoom",
    "Girl’sTeamRoom":"WeightRoom",
    "FranklinCommons":"FranklinCommons",
    "224":"FranklinCommons",
    "225":"FranklinCommons",
    "226":"FranklinCommons",
    "227":"FranklinCommons",
    "BlackBox/228":"FranklinCommons",
    "StudentServices":"FranklinCommons",
    "NobelBalcony":"NobelBalcony",
    "219":"NobelBalcony",
    "NewtonCommons":"NewtonCommons",
    "216":"NewtonCommons",
    "217":"NewtonCommons",
    "218":"NewtonCommons",
    "215":"NewtonCommons",
    "214":"NewtonCommons",
    "211":"NewtonCommons",
    "212":"NewtonCommons",
    "CurieCommons":"CurieCommons",
    "200":"CurieCommons",
    "201":"CurieCommons",
    "202":"CurieCommons",
    "203":"CurieCommons",
    "206":"CurieCommons",
    "207":"CurieCommons",
    "208":"CurieCommons",
    "HopperCommons":"HopperCommons",
    "229":"HopperCommons",
    "230":"HopperCommons",
    "231":"HopperCommons",
    "232":"HopperCommons",
    "233":"HopperCommons",
    "234":"HopperCommons",
    "235":"HopperCommons",
    "236":"HopperCommons",
    "237":"HopperCommons",
    "238":"HopperCommons",
    "HopperElevator":"HopperElevator",
    "239":"HopperElevator",
    "240":"HopperElevator",
    "LectureHall":"LectureHall",
    "241(LectureHall)":"LectureHall",
    "242":"LectureHall",
    "243":"LectureHall",
    "244":"LectureHall",
    "245":"LectureHall",
    "TeslaCommons":"TeslaCommons",
    "246":"TeslaCommons",
    "247":"TeslaCommons",
    "248":"TeslaCommons",
    "249":"TeslaCommons",
    "250":"TeslaCommons",
    "251":"TeslaCommons",
    "252":"TeslaCommons",
    "253":"TeslaCommons",
    "CarsonCommons":"CarsonCommons",
    "278":"CarsonCommons",
    "281":"CarsonCommons",
    "282":"CarsonCommons",
    "254":"CarsonCommons",
    "255":"CarsonCommons",
    "CarverCommons":"CarverCommons",
    "283":"CarverCommons",
    "284":"CarverCommons",
    "285":"CarverCommons",
    "286":"CarverCommons",
    "287":"CarverCommons",
  };
  Map graph = {//as you read through, if loc1 doesnt exist - add it, otherwise add to its value pair map
    "Auditorium Lobby": {"Gym 1": 1, "Art Gallery": 2, "Auditorium Staircase": 1,},
    "Nobel Commons": {"Auditorium Lobby": 2, "Art Gallery": 1, "Nobel Staircase": 1, "Galileo Commons": 2, "Language Hallway 1": 3},
    "Art Gallery": {"Auditorium Staircase": 1, "Gandhi Commons": 1},
    "Galileo Commons": {"Language Hallway 1": 4, "Language Hallway 2": 3, "DaVinci Commons":2, "DaVinci Staircase": 2, "Cafeteria": 3},
    "Language Hallway 1": {"Language Hallway 2": 1},
    "Language Hallway 2": {"Language Hallway Staircase": 1},
    "DaVinci Commons": {"DaVinci Staircase": 1, "Quantum Staircase": 1, "Fish Staircase": 1},
    //"Cafeteria": {"DaVinci Staircase": 2},
    "NobelStaircase":{
      "NobelBalconyStaircase":1,},

    "ArtGallery":{
      "AuditoriumStaircase":1,"GandhiCommons":2,},

    "NobelCommons":{
      "ArtGallery":1,"AuditoriumLobby":2,"NobelStaircase":1,"GalileoCommons":2,"LanguageHallway1":3,},

    "EinsteinCommons":{
      "Door6":2,"EinsteinStaircase":1,"LanguageHallway2":4,"DarwinCommons":2,},

    "DaVinciStaircase":{
      "CurieStaircase":1,},

    "LanguageHallway2":{
      "LanguageHallwayStaircase":1,},

    "DarwinCommons":{
      "LanguageHallway1":3,"LanguageHallway2":3,"FaradayCommons":2,},

    "LanguageHallway1":{
      "LanguageHallway2":1,},

    "GalileoCommons":{
      "LanguageHallway1":4,"LanguageHallway2":3,"DaVinciCommons":2,"DaVinciStaircase":2,"Cafeteria":3,},

    "DaVinciCommons":{
      "DaVinciStaircase":1,"QuantumStaircase":1,"FishStaircase":1,},

    "FaradayCommons":{
      "LanguageHallway1":4,"FaradayStaircase":1,"Gym2":2,},

    "TuringCommons":{
      "DaVinciStaircase":4,"TuringStaircase":1,"Door6":2,"TuringElevator":1,"TuringHallway":2,},

    "LanguageHallwayStaircase":{
      "LibraryStaircase":1,},

    "BandHallway":{
      "AuditoriumLobby":1,},

    "Gym2":{
      "FaradayStaircase":2,"GandhiCommons":2,"Door9":1,},

    "TuringHallway":{
      "DaVinciStaircase":2,},

    "FishStaircase":{
      "SysLabStaircase":1,},

    "Door9":{
      "FaradayCommons":2,"FaradayStaircase":2,},

    "AuditoriumLobby":{
      "Gym1":1,"ArtGallery":2,"AuditoriumStaircase":1,},

    "QuantumStaircase":{
      "RoboticsStaircase":1,},

    "AuditoriumStaircase":{
      "FranklinStaircase":1,},

    "Cafeteria":{
      "DaVinciStaircase":2,"FishStaircase":2,},

    "TuringElevator":{
      "Door6":1,"TuringHallway":1,},
  };
  from = from.replaceAll(' ','');
  to = to.replaceAll(' ','');
  from = landmarkSatellites[from];
  to = landmarkSatellites[to];
  var output2 = Dijkstra.findPathFromGraph(graph, from, to);
  List<String> messageLIST = [];
  for (var i = 0; i < output2.length-1; i++){
    messageLIST.add(messages[output2[i]+output2[i+1]]!);
    print(messages[output2[i] + output2[i+1]]);
  }
  return messageLIST;
  /// output1:
  /// [114, 113, 0, 6, 5]
  /// output2:
  /// [114, 113, 0, 6, 5]
}