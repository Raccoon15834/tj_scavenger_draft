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
    "AuditoriumLobbyGym1" : " Enter Gym 1 to the left of the cubbies",
    "Gym1AuditoriumLobby" : " Exit Gym 1 into the lobby",
    "AuditoriumLobbyArtGallery" : " Walk through the doorway towards Nobel Commons",
    "ArtGalleryAuditoriumLobby" : " Walk through the doorway away from the Nobel Commons",
    "AuditoriumLobbyAuditoriumStaircase" : " Enter the nearby staircase",
    "AuditoriumStaircaseAuditoriumLobby" : " Exit the staircase",
    "NobelCommonsArtGallery" : " Facing the dome go down the hallway to the Art Gallery",
    "ArtGalleryNobelCommons" : " Go down the hallway to Nobel Commons",
    "NobelCommonsAuditoriumLobby" : " Go down the hallway to the Auditorium Lobby",
    "AuditoriumLobbyNobelCommons" : " Go down the hallway to Nobel Commons",
    "ArtGalleryAuditoriumStaircase" : " Enter the nearby staircase",
    "AuditoriumStaircaseArtGallery" : " Exit the staircase",
    "ArtGalleryGandhiCommons" : " Go around the corner to Gandhi Commons",
    "GandhiCommonsArtGallery" : " Go down the hallway to the Art Gallery",
    "NobelCommonsNobelStaircase" : " Go to the nearby stairs",
    "NobelStaircaseNobelCommons" : " Exit the stairs",
    "NobelCommonsGalileoCommons" : " Go down the hallway to Galileo Commons",
    "GalileoCommonsNobelCommons" : " Go down the hallway to Nobel Commons",
    "NobelCommonsLanguageHallway1" : " Go around the corner to Language Hallway 1",
    "LanguageHallway1NobelCommons" : " Go down the hallway and around the corner to Nobel Commons",
    "GalileoCommonsLanguageHallway1" : " Enter Language Hallway 1 (closer to Nobel Commons)",
    "LanguageHallway1GalileoCommons" : " Exit language hallway and walk to the right",
    "GalileoCommonsLanguageHallway2" : " Enter Language Hallway 2 (farther from Nobel Commons)",
    "LanguageHallway2GalileoCommons" : " Exit language hallway and walk to the right",
    "LanguageHallway1LanguageHallway2" : " Use the small hallway between both Language Hallways",
    "LanguageHallway2LanguageHallway1" : " Use the small hallway between both Language Hallways",
    "LanguageHallway2LanguageHallwayStaircase" : " Walk to the staircase in the middle of Language Hallway 2",
    "LanguageHallwayStaircaseLanguageHallway2" : " Exit the staircase into Language Hallway 2",
    "GalileoCommonsDaVinciCommons" : " Facing the Greenhouse Courtyard windows walk left and enter DaVinci Commons on the left",
    "DaVinciCommonsGalileoCommons" : " Exit DaVinci commons and walk to the right",
    "GalileoCommonsDaVinciStaircase" : " Facing the Greenhouse Courtyard windows walk left past DaVinci Commons and enter the staircase to the left",
    "DaVinciStaircaseGalileoCommons" : " Exit DaVinci Staircase and walk to the right",
    "GalileoCommonsCafeteria" : " Facing the Greenhouse Courtyard windows walk left to the end of the hallway",
    "CafeteriaGalileoCommons" : " Walk straight until you see Galileo Commons on your left",
    "DaVinciCommonsDaVinciStaircase" : " Exit the commons and find the staircase immediately to your left",
    "DaVinciStaircaseDaVinciCommons" : " Exit the staircase and walk into the commons immediately to your right",
    "DaVinciCommonsQuantumStaircase" : " Facing the commons entrance walk to the end of the right hallway and enter the staircase",
    "QuantumStaircaseDaVinciCommons" : " Exit the staircase and walk into the main space of DaVinci Commons",
    "DaVinciCommonsFishStaircase" : " Facing the commons entrance walk to the end of the left hallway and enter the staircase",
    "FishStaircaseDaVinciCommons" : " Exit the staircase and walk into the main space of DaVinci Commons",
    "CafeteriaDaVinciStaircase" : " Walk straight down the hallway and find the staircase to your right",
    "DaVinciStaircaseCafeteria" : " Exit the staircase and walk to the end of the hallway on the left",
    "CafeteriaFishStaircase" : " Exit the cafeteria and walk to the end of the hallway on your right",
    "FishStaircaseCafeteria" : " Exit the staircase and walk to the end of the hallway on your left",
    "TuringCommonsDaVinciStaircase" : " Exit Turing Commons and walk to the end of the hallway on your right. Then walk left and find the staircase on your right",
    "DaVinciStaircaseTuringCommons" : " Exit the staircase and walk left before taking an immediate right at the first hallway. Walk halfway through the hallway and enter turing commons on your left",
    "TuringCommonsTuringStaircase" : " Enter the staircase at the back of Turing Commons",
    "TuringStaircaseTuringCommons" : " Exit the staircase into Turing Commons",
    "TuringCommonsDoor6" : " Exit Turing Commons and walk to the left towards the Door 6 sign",
    "Door6TuringCommons" : " Walk down the hallway away from the Door 6 sign and find Turing Commons on your right",
    "EinsteinCommonsDoor6" : " Exit Einstein Commons walk right towards the hallway intersection",
    "Door6EinsteinCommons" : " Facing the Door 6 sign walk right and find Einstein commons on your left",
    "EinsteinCommonsEinsteinStaircase" : " Enter the staircase at the back of Einstein Commons",
    "EinsteinStaircaseEinsteinCommons" : " Exit the staircase into Einstein Commons",
    "EinsteinCommonsLanguageHallway2" : " Exit Einstein Commons to your left and enter the Language Hallway 2 (first one you see) to your right",
    "LanguageHallway2EinsteinCommons" : " Exit the hallway to your left and find Einstein Commons on your right",
    "EinsteinCommonsDarwinCommons" : " Exit Einstein Commons to your left and find Darwin Commons on your left",
    "DarwinCommonsEinsteinCommons" : " Exit Darwin Commons to your right and find Einstein Commons on your right",
    "DarwinCommonsLanguageHallway1" : " Enter Language Hallway 1 from the left of the commons",
    "LanguageHallway1DarwinCommons" : " Enter Darwin Commons at the end of the hallway",
    "DarwinCommonsLanguageHallway2" : " Enter Language Hallway 2 from the right of the commons",
    "LanguageHallway2DarwinCommons" : " Enter Darwin Commons at the end of the hallway",
    "DarwinCommonsFaradayCommons" : " Exit Darwin Commons to your left and find Einstein Commons on your left",
    "FaradayCommonsDarwinCommons" : " Exit Faraday Commons to your left and find Darwin Commons on your left",
    "FaradayCommonsLanguageHallway1" : " Exit Faraday Commons to the left and turn left into Language Hallway 1",
    "LanguageHallway1FaradayCommons" : " Exit Language Hallway 1 to the right and find Faraday Commons on your right",
    "FaradayCommonsFaradayStaircase" : " Exit Faraday Commons to the right and enter Faraday Staircase immediately to your left",
    "FaradayStaircaseFaradayCommons" : " Exit Faraday Staircase and find Faraday Commons to your right",
    "FaradayCommonsGym2" : " Exit Faraday Commons to the right and find the Gym 2 entrance around the corner of the hallway intersection",
    "Gym2FaradayCommons" : " Exit Gym 2 to the right towards the hallway intersection. Then walk down the hallway and find Faraday Commons on your left",
    "Gym2FaradayStaircase" : " As you are exiting the staircase",
    "FaradayStaircaseGym2" : " ",
    "Gym2GandhiCommons" : " Take a right out of Gym 2 followed by an immediate left and walk down the hallway. Find the Gandhi Commons on your right",
    "GandhiCommonsGym2" : " Facing the windows to the courtyard walk right and find the Gym 2 entrance to your right",
    "Gym2Door9" : " Exit Gym 2 and take two right turns towards the Door 9 sign",
    "Door9Gym2" : " Walk in the direction opposite to the Door 9 sign and take the first left",
    "Door9FaradayCommons" : " Walk in the direction opposite to the Door 9 sign and take the first right. The commons should be on your left slightly down the hallway",
    "FaradayCommonsDoor9" : " Facing the windows to the courtyard walk left and the Door 9 sign should be on your left",
    "Door9FaradayStaircase" : " Walk in the direction opposite to the Door 9 sign and take the first right. Enter the staircase on your immediate right",
    "FaradayStaircaseDoor9" : " Exit the staircase and take two immediate lefts",
    "TuringCommonsTuringElevator" : " Walk out of Turing Commons and find the elevator on your left",
    "TuringElevatorTuringCommons" : " Walk into Turing Commons",
    "TuringElevatorDoor6" : " Walk in the direction of the Door 6 sign at the end of the hallway",
    "Door6TuringElevator" : " Walk in the opposite direction of the Door 6 sign",
    "TuringElevatorTuringHallway" : " Walk straight in the direction where the commons is on your right",
    "TuringHallwayTuringElevator" : " Head in the direction of the Door 6 sign and find the elevator on your left",
    "TuringCommonsTuringHallway" : " Head into the main hallway and walk straight in the direction where the commons is on your right",
    "TuringHallwayTuringCommons" : " Head in the direction of the Door 6 sign and the commons should be on your left",
    "TuringHallwayDaVinciStaircase" : " Head in the direction opposite to the Door 6 sign and take a right at the end of the hallway",
    "DaVinciStaircaseTuringHallway" : " Head in the direction of the cafeteria and take the first right",
    "BandHallwayAuditoriumLobby" : " Walk to the trophy case and turn left through the double doors",
    "AuditoriumLobbyBandHallway" : " Walk out of the double doors at the end of the hallway",
    "FranklinCommonsFranklinStaircase" : " Walk down the common area away from Nobel Commons and see the staircase on your right",
    "FranklinStaircaseFranklinCommons" : " Walk up staircase and take a left to find yourself in the commons",
    "FranklinCommonsNobelBalcony" : " Walk down the common with the college icons on your left and see balcony past the commons on the right",
    "NobelBalconyFranklinCommons" : " Walk straight with the courtyard to your left and the dome to your right to the commons",
    "NobelBalconyStaircaseNobelBalcony" : " Walk up the stairs",
    "NobelBalconyNobelBalconyStaircase" : " Walk down the stairs",
    "FranklinCommonsNewtonCommons" : " Walk down the common area with the college icons on your left and pass through Nobel Balcony. Walk straight through it and arrive in Newton commons past the first hallway intersection",
    "NewtonCommonsFranklinCommons" : " Walk straight towards the large open area and pass through Nobel Balcony. Walk through the balcony and find yourself in Nobel Commons",
    "NewtonCommonsNobelBalcony" : " Face the large windows and walk straight down to Nobel Balcony",
    "NobelBalconyNewtonCommons" : " Face away from the commons with college icons and walk straight with the stairs on your right to Newton Commons",
    "NewtonCommonsLibraryHallway" : " Face the large windows and take a left up the ramp immediately to go down Library Hallway",
    "LibraryHallwayNewtonCommons" : " Walk down the hallway with the library on your left and walk down the ramp. Turn right to enter Newton Commons",
    "NewtonCommonsCurieStaircase" : " Face with your back to the large windows and walk down the hallway",
    "CurieStaircaseNewtonCommons" : " pass by the ramp and take the staircase at the end of the hallway to your left",
    "NewtonCommonsCurieCommons" : " Face with your back to the large windows and walk down the hallway going up the ramp immediately to your left",
    "CurieCommonsNewtonCommons" : " Walk straight with the elevator to your back and go down the ramp there. Walk straight until the first opening on your left before the ramp.",
    "CurieCommonsRoboticsStaircase" : " Facing the elevator walk left down the hallway to the staircase",
    "RoboticsStaircaseCurieCommons" : " Walk up the stairs and take a left.",
    "CurieCommonsSysLabStaircase" : " Facing the elevator walk right down the hallway and take a left in front of room 200. Follow the hallway and walk through to the staircase across from Room 201",
    "SysLabStaircaseCurieCommons" : " Walk up the staircase and take a left. Follow the hallway straight and find yourself in Curie Commons",
    "LibraryLibraryStaircase" : " Walk out of the library and go straight",
    "LibraryStaircaseLibrary" : " Walk up the stairs and take a left",
    "LibraryLibraryHallway" : " Walk out of the library doors",
    "LibraryHallwayLibrary" : " Walk down the Library Hallway keeping the windows to your left",
    "LibraryHallwayLibraryStaircase" : " Walk down Library Hallway keeping the windows to your left until reaching the library doors. Take a left to find the staircase",
    "LibraryStaircaseLibraryHallway" : " Walk up the stairs",
    "HopperCommonsHopperStaircase" : " Walk down the commons keeping the whiteboard on your left. Take a right at the end of the hall to find the staircase",
    "HopperStaircaseHopperCommons" : " Walk up the stairs and take a left",
    "HopperCommonsLectureHall" : " Walk down the commons keeping the whiteboard to the right. Take a left at the bend and walk straight down the hall and up the ramp. Take a left and another immediate left at the doors",
    "LectureHallHopperCommons" : " Walk out of the doors and take a right. Walk down the ramp to the end of the hallway and take a right",
    "TeslaCommonsLectureHall" : " Walk out of the commons and take a right. Walk down the hallway to the intersection and take a right. Walk up the ramp and take a left. The Lecture Hall is to your immediate left",
    "LectureHallTeslaCommons" : " Walk out of the doors and take a right. Take your first left and walk down the hallway to your first left. Turn here and find yourself in Tesla Commons",
    "TeslaCommonsLibraryHallway" : " Walk out of the commons down the hall to the left and the hallway should be on the right",
    "LibraryHallwayTeslaCommons" : " Facing the library walk left to the end of the hallway then go left and the commons should be on the right",
    "TeslaCommonsTeslaStaircase" : " Walk to the staircase in the back of the commons",
    "TeslaStaircaseTeslaCommons" : " Walk out of the staircase into the commons",
    "TeslaCommonsCarsonCommons" : " Walk out of the commons down the hall to the left and the commons should be on the right",
    "CarsonCommonsTeslaCommons" : " Facing out of the commons walk right and the commons should be on the right down the hall",
    "CarsonCommonsCarverCommons" : " Facing out of the commons walk left and Carver commons will be on your right",
    "CarverCommonsCarsonCommons" : " Facing the window walk right and Carson commons will be on your right",
    "CarsonCommonsLibraryHallway" : " Facing out of the commons walk right and the large hallway will be on your left",
    "LibraryHallwayCarsonCommons" : " Facing the library walk left to the end of the hallway and then turn right",
    "CarverCommonsCarverStaircase" : " Facing the windows walk left towards the bathrooms and then into the stairwell",
    "CarverStaircaseCarverCommons" : " Walk to the right of the bathrooms and the commons will be on the left",
    "HopperCommonsHopperElevator" : " Walk out of the commons and the elevator will be on your left",
    "HopperElevatorHopperCommons" : " Walk into the commons around the corner opposite to the ramp",
    "HopperElevatorLectureHall" : " Walk down the hall to the left of the elevator and take a left at the top of the ramp at the lecture hall",
    "LectureHallHopperElevator" : " Walk down and up the ramp and the elevator will be on your right",
    "AuditoriumStaircaseFranklinStaircase" : " Walk up the staircase",
    "FranklinStaircaseAuditoriumStaircase" : " Walk down the staircase",
    "NobelStaircaseNobelBalconyStaircase" : " Walk up the staircase",
    "NobelBalconyStaircaseNobelStaircase" : " Walk down the staircase",
    "DaVinciStaircaseCurieStaircase" : " Walk up the staircase",
    "CurieStaircaseDaVinciStaircase" : " Walk down the staircase",
    "QuantumStaircaseRoboticsStaircase" : " Walk up the staircase",
    "RoboticsStaircaseQuantumStaircase" : " Walk down the staircase",
    "FishStaircaseSysLabStaircase" : " Walk up the staircase",
    "SysLabStaircaseFishStaircase" : " Walk down the staircase",
    "LanguageHallwayStaircaseLibraryStaircase" : " Walk up the staircase",
    "LibraryStaircaseLanguageHallwayStaircase" : " Walk down the staircase",
    "TuringStaircaseHopperStaircase" : " Walk up the staircase",
    "HopperStaircaseTuringStaircase" : " Walk down the staircase",
    "TeslaStaircaseEinsteinStaircase" : " Walk up the staircase",
    "EinsteinStaircaseTeslaStaircase" : " Walk down the staircase",
    "FaradayStaircaseCarverStaircase" : " Walk up the staircase",
    "CarverStaircaseFaradayStaircase" : " Walk down the staircase",
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
    "LanguageHallwayStaircase":"LanguageHallwayStaircase",
    "QuantumStaircase":"QuantumStaircase",
    "LibraryStaircase":"LibraryStaircase",
    "FranklinStaircase":"FranklinStaircase",
    "EinsteinStaircase":"EinsteinStaircase",
    "FishStaircase":"FishStaircase",
    "RoboticsStaircase":"RoboticsStaircase",
    "Library":"Library",
    "FaradayStaircase":"FaradayStaircase",
    "TuringStaircase":"TuringStaircase",
    "Gym1":"Gym1",
    "Gym2":"Gym2",
    "SysLabStaircase":"SysLabStaircase",
    "AuditoriumStaircase":"AuditoriumStaircase",
    "NobelStaircase":"NobelStaircase",
    "TeslaStaircase":"TeslaStaircase",
    "LibraryHallway":"LibraryHallway",
    "HopperStaircase":"HopperStaircase",
    "NobelBalconyStaircase":"NobelBalconyStaircase",
    "CurieStaircase":"CurieStaircase",
    "CarverStaircase":"CarverStaircase",
  };
  Map graph = {//as you read through, if loc1 doesnt exist - add it, otherwise add to its value pair map
    //"Cafeteria": {"DaVinci Staircase": 2},
    "NobelCommons":{
      "ArtGallery":1,"AuditoriumLobby":2,"NobelStaircase":1,"GalileoCommons":2,"LanguageHallway1":3,},

    "EinsteinCommons":{
      "Door6":2,"EinsteinStaircase":1,"LanguageHallway2":4,"DarwinCommons":2,},

    "FranklinCommons":{
      "FranklinStaircase":1,"NobelBalcony":1,"NewtonCommons":2,},

    "CarverCommons":{
      "CarsonCommons":2,"CarverStaircase":1,},

    "FaradayCommons":{
      "DarwinCommons":2,"LanguageHallway1":4,"FaradayStaircase":1,"Gym2":2,"Door9":2,},

    "CarsonCommons":{
      "TeslaCommons":2,"CarverCommons":2,"LibraryHallway":1,},

    "LanguageHallwayStaircase":{
      "LanguageHallway2":1,"LibraryStaircase":1,},

    "BandHallway":{
      "AuditoriumLobby":1,},

    "TuringHallway":{
      "TuringElevator":1,"TuringCommons":2,"DaVinciStaircase":2,},

    "QuantumStaircase":{
      "DaVinciCommons":1,"RoboticsStaircase":1,},

    "LibraryStaircase":{
      "Library":2,"LibraryHallway":1,"LanguageHallwayStaircase":1,},

    "HopperElevator":{
      "HopperCommons":1,"LectureHall":1,},

    "ArtGallery":{
      "AuditoriumLobby":2,"NobelCommons":1,"AuditoriumStaircase":1,"GandhiCommons":2,},

    "FranklinStaircase":{
      "FranklinCommons":1,"AuditoriumStaircase":1,},

    "DaVinciStaircase":{
      "GalileoCommons":2,"DaVinciCommons":1,"Cafeteria":2,"TuringCommons":4,"TuringHallway":2,"CurieStaircase":1,},

    "LanguageHallway2":{
      "GalileoCommons":3,"LanguageHallway1":1,"LanguageHallwayStaircase":1,"EinsteinCommons":4,"DarwinCommons":3,},

    "LanguageHallway1":{
      "NobelCommons":3,"GalileoCommons":4,"LanguageHallway2":1,"DarwinCommons":3,"FaradayCommons":4,},

    "EinsteinStaircase":{
      "EinsteinCommons":1,"TeslaStaircase":1,},

    "FishStaircase":{
      "DaVinciCommons":1,"Cafeteria":2,"SysLabStaircase":1,},

    "RoboticsStaircase":{
      "CurieCommons":1,"QuantumStaircase":1,},

    "Library":{
      "LibraryStaircase":2,"LibraryHallway":1,},

    "Cafeteria":{
      "GalileoCommons":3,"DaVinciStaircase":2,"FishStaircase":2,},

    "HopperCommons":{
      "HopperStaircase":1,"LectureHall":2,"HopperElevator":1,},

    "GalileoCommons":{
      "NobelCommons":2,"LanguageHallway1":4,"LanguageHallway2":3,"DaVinciCommons":2,"DaVinciStaircase":2,"Cafeteria":3,},

    "FaradayStaircase":{
      "FaradayCommons":1,"Gym2":2,"Door9":2,"CarverStaircase":1,},

    "TuringStaircase":{
      "TuringCommons":1,"HopperStaircase":1,},

    "TuringCommons":{
      "DaVinciStaircase":4,"TuringStaircase":1,"Door6":2,"TuringElevator":1,"TuringHallway":2,},

    "Gym1":{
      "AuditoriumLobby":1,},

    "GandhiCommons":{
      "ArtGallery":2,"Gym2":2,},

    "Gym2":{
      "FaradayCommons":2,"FaradayStaircase":2,"GandhiCommons":2,"Door9":1,},

    "SysLabStaircase":{
      "CurieCommons":1,"FishStaircase":1,},

    "Door9":{
      "Gym2":1,"FaradayCommons":2,"FaradayStaircase":2,},

    "Door6":{
      "TuringCommons":2,"EinsteinCommons":2,"TuringElevator":1,},

    "AuditoriumStaircase":{
      "AuditoriumLobby":1,"ArtGallery":1,"FranklinStaircase":1,},

    "TuringElevator":{
      "TuringCommons":1,"Door6":1,"TuringHallway":1,},

    "NobelStaircase":{
      "NobelCommons":1,"NobelBalconyStaircase":1,},

    "TeslaCommons":{
      "LectureHall":2,"LibraryHallway":3,"TeslaStaircase":1,"CarsonCommons":2,},

    "LectureHall":{
      "HopperCommons":2,"TeslaCommons":2,"HopperElevator":1,},

    "TeslaStaircase":{
      "TeslaCommons":1,"EinsteinStaircase":1,},

    "DarwinCommons":{
      "EinsteinCommons":2,"LanguageHallway1":3,"LanguageHallway2":3,"FaradayCommons":2,},

    "DaVinciCommons":{
      "GalileoCommons":2,"DaVinciStaircase":1,"QuantumStaircase":1,"FishStaircase":1,},

    "LibraryHallway":{
      "NewtonCommons":1,"Library":1,"LibraryStaircase":1,"TeslaCommons":3,"CarsonCommons":1,},

    "NewtonCommons":{
      "FranklinCommons":2,"NobelBalcony":2,"LibraryHallway":1,"CurieStaircase":1,"CurieCommons":2,},

    "CurieCommons":{
      "NewtonCommons":2,"RoboticsStaircase":1,"SysLabStaircase":1,},

    "HopperStaircase":{
      "HopperCommons":1,"TuringStaircase":1,},

    "NobelBalconyStaircase":{
      "NobelBalcony":1,"NobelStaircase":1,},

    "AuditoriumLobby":{
      "Gym1":1,"ArtGallery":2,"AuditoriumStaircase":1,"NobelCommons":2,"BandHallway":1,},

    "NobelBalcony":{
      "FranklinCommons":1,"NobelBalconyStaircase":1,"NewtonCommons":2,},

    "CurieStaircase":{
      "NewtonCommons":1,"DaVinciStaircase":1,},

    "CarverStaircase":{
      "CarverCommons":1,"FaradayStaircase":1,},
  };
  from = from.replaceAll(' ','');
  to = to.replaceAll(' ','');
  from = landmarkSatellites[from];
  to = landmarkSatellites[to];
  if(from==to){
    String samePlace = "Your current location and destination are both super close to "+from!+ ", try looking around!";
    return [samePlace];
  }
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