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
    "AuditoriumLobbyAuditoriumStaircase" : " Walk out the doors towards Nobel Commons. Look immediately to the left to see a hallway with a staircase. Enter the hallway",
    "AuditoriumStaircaseAuditoriumLobby" : " Exit the staircase hallway and walk through the set of doors to your right.",
    "NobelCommonsArtGallery" : " Stand with the dome to your back. Walk down the hallway to your right. The Art Gallery will be on your left",
    "ArtGalleryNobelCommons" : " Stand with the Art Gallery to your right. Walk down the hallway until you see the main entrance to your left.",
    "NobelCommonsAuditoriumLobby" : " With the dome to your left",
    "AuditoriumLobbyNobelCommons" : " walk down the hallway and through the set of doors",
    "ArtGalleryAuditoriumStaircase" : " With the Art Gallery on your left",
    "AuditoriumStaircaseArtGallery" : " walk towards the set of doors in front of you and take a right into the hallway right before them. Walk up the stairs here",
    "ArtGalleryGandhiCommons" : " With the Art Gallery on your left",
    "GandhiCommonsArtGallery" : " walk forward until you see a hallway on your left. Walk down this hallway and find Gandhi Commons on your left halfway down",
    "NobelCommonsNobelStaircase" : " Go to the nearby stairs",
    "NobelStaircaseNobelCommons" : " Exit the stairs",
    "NobelCommonsGalileoCommons" : " With the dome to your left",
    "GalileoCommonsNobelCommons" : " walk down the hallway until you see a common area on your right",
    "NobelCommonsLanguageHallway1" : " With the dome to your left",
    "LanguageHallway1NobelCommons" : " walk down the hallway and take a right into the first hallway",
    "GalileoCommonsLanguageHallway1" : " With the windows of the commons behind you walk down the hallway on the left that is parallel to you",
    "LanguageHallway1GalileoCommons" : " The commons is on your right",
    "GalileoCommonsLanguageHallway2" : " With the windows of the commons behind you take a right and walk down the hallway. Take your first right",
    "LanguageHallway2GalileoCommons" : " Exit the hallway to the left and walk down the hallway to find Galileo Commons to your left.",
    "LanguageHallway1LanguageHallway2" : " Walk down the language hall to the perpendicular hallway in the middle. Cross through this hallway",
    "LanguageHallway2LanguageHallway1" : " Walk down the language hall to the perpendicular hallway in the middle. Cross through this hallway",
    "LanguageHallway2LanguageHallwayStaircase" : " Walk to the middle of the hallway and go up the staircase",
    "LanguageHallwayStaircaseLanguageHallway2" : " Exit the staircase into Language Hallway 2",
    "GalileoCommonsDaVinciCommons" : " With the windows of the commons behind you walk down the hallway to the right and take the first left into DaVinci Commons",
    "DaVinciCommonsGalileoCommons" : " Exit the commons to the right and walk down the hallway to find Galileo Commons on the left",
    "GalileoCommonsDaVinciStaircase" : " With the windows of the commons behind you walk down the hallway to the right and find the staircase on the left right after the entrance to DaVinci Commons",
    "DaVinciStaircaseGalileoCommons" : " Exit the stairs to the right and walk down the hallway to find Galileo Commons on the left",
    "GalileoCommonsCafeteria" : " With the windows of the commons behind you walk down the hallway to the right",
    "CafeteriaGalileoCommons" : " Walk down the hallway until you see Galileo Commons on your left",
    "DaVinciCommonsDaVinciStaircase" : " Exit the commons and find the staircase immediately to your left",
    "DaVinciStaircaseDaVinciCommons" : " Exit the staircase and walk into the commons immediately to your right",
    "DaVinciCommonsQuantumStaircase" : " Facing the commons entrance and keeping the big glass room behind you walk to the end of the right hallway and enter the staircase on your right",
    "QuantumStaircaseDaVinciCommons" : " Exit the staircase and walk down the hallway into the main space of DaVinci Commons",
    "DaVinciCommonsFishStaircase" : " Facing the commons entrance and keeping the big glass room behind you walk to the end of the left hallway and enter the staircase on the left side",
    "FishStaircaseDaVinciCommons" : " Exit the staircase and walk down the hallway until the first intersection. Take a left",
    "CafeteriaDaVinciStaircase" : " Walk straight down the hallway and find the staircase to your right",
    "DaVinciStaircaseCafeteria" : " Exit the staircase and walk to the end of the hallway on the left",
    "CafeteriaFishStaircase" : " Exit the cafeteria and take an immediate right. Walk down the hallway and walk up the stairs at the end",
    "FishStaircaseCafeteria" : " Exit the staircase and walk to the end of the hallway on your left",
    "TuringCommonsDaVinciStaircase" : " Exit Turing Commons and walk to the end of the hallway on your right. Then walk left and find the staircase on your right",
    "DaVinciStaircaseTuringCommons" : " Exit the staircase and walk left before taking an immediate right at the first hallway. Walk halfway through the hallway and enter turing commons on your left",
    "TuringCommonsTuringStaircase" : " Enter the staircase at the back of Turing Commons",
    "TuringStaircaseTuringCommons" : " Exit the staircase into Turing Commons",
    "TuringCommonsDoor6" : " Exit Turing Commons and walk to the left towards the Door 6 sign",
    "Door6TuringCommons" : " Walk down the hallway away from the Door 6 sign and find Turing Commons on your right",
    "EinsteinCommonsDoor6" : " Exit Einstein Commons and walk right towards the intersection. Take a right and the door will be at the end of the hall",
    "Door6EinsteinCommons" : " Walk away from the Door 6 sign and take a right at the intersection. Walk down the hallway and Einstein Commons will be the first on the left",
    "EinsteinCommonsEinsteinStaircase" : " Enter the staircase at the back of Einstein Commons",
    "EinsteinStaircaseEinsteinCommons" : " Exit the staircase into Einstein Commons",
    "EinsteinCommonsLanguageHallway2" : " Exit Einstein Commons to your left and enter the first hallway to your right",
    "LanguageHallway2EinsteinCommons" : " Exit the hallway and walk to your left to find Einstein Commons on your right",
    "EinsteinCommonsDarwinCommons" : " Exit Einstein Commons to your left and walk down the hall to find Darwin Commons on your left",
    "DarwinCommonsEinsteinCommons" : " Exit Darwin Commons to your right and walk down the hall to find Einstein Commons on your right",
    "DarwinCommonsLanguageHallway1" : " Exit the commons to the left and take an immediate right into the hallway",
    "LanguageHallway1DarwinCommons" : " Walk down the hallway and keep the windows/courtyard to your right. Take a left at the end of the hallway and the commons will be immediately to the right",
    "DarwinCommonsLanguageHallway2" : " Exit the commons to the right and take an immediate left into the hallway",
    "LanguageHallway2DarwinCommons" : " Walk down the hallway and keep the windows/courtyard to your left. Take a right at the end of the hallway and the commons will be immediately to the left",
    "DarwinCommonsFaradayCommons" : " Exit Darwin Commons to your left and find Faraday Commons on your right",
    "FaradayCommonsDarwinCommons" : " Exit Faraday Commons to your left and find Darwin Commons on your right",
    "FaradayCommonsLanguageHallway1" : " Exit Faraday Commons and walk down the hallway to the left. Turn into the first hallway on your left",
    "LanguageHallway1FaradayCommons" : " Walk down the hallway and keep the courtyard to your right. Take a right into the hallway at the end of the hall and the commons will be on your right",
    "FaradayCommonsFaradayStaircase" : " Exit Faraday Commons to the right and enter the stairwell immediately to your left",
    "FaradayStaircaseFaradayCommons" : " Exit Faraday Staircase and find Faraday Commons to your right",
    "FaradayCommonsGym2" : " Exit Faraday Commons to the right and take a right at the intersection. Gym 2 is immediately to the left",
    "Gym2FaradayCommons" : " Exit Gym 2 to the right towards the hallway intersection. Take a left and walk down the hallway to find Faraday Commons on your left",
    "Gym2FaradayStaircase" : " Exit Gym 2 to the right towards the hallway intersection. Take a left and find the stairwell immediately to your right",
    "FaradayStaircaseGym2" : " Walk out of the stairwell and take a left. Take a right at the intersection and Gym 2 is to your immediate left.",
    "Gym2GandhiCommons" : " Take a right out of Gym 2 followed by an immediate left and walk down the hallway. Find Gandhi Commons on your right",
    "GandhiCommonsGym2" : " With the windows of the commons on your left walk straight down the hallway and take a right where you see the Gym 2 sign",
    "Gym2Door9" : " Exit Gym 2 and take two right turns towards the Door 9 sign at the end of the hallway. Walk down this hallway to the door",
    "Door9Gym2" : " Walk away from the Door 9 sign and take the first left",
    "Door9FaradayCommons" : " Walk in the direction opposite to the Door 9 sign and take the first right. The commons should be on your left slightly down the hallway",
    "FaradayCommonsDoor9" : " With the windows of the commons to your right walk straight and take a left at the end of the hallway",
    "Door9FaradayStaircase" : " Walk in the direction opposite to the Door 9 sign and take the first right. Enter the staircase on your immediate right",
    "FaradayStaircaseDoor9" : " Exit the staircase and take two immediate lefts",
    "TuringCommonsTuringElevator" : " Walk out of Turing Commons and find the elevator on your left",
    "TuringElevatorTuringCommons" : " Take two right turns as soon as you exit the elevator and walk into the commons.",
    "TuringElevatorDoor6" : " After walking out of the elevator walk left to the end of the hallway",
    "Door6TuringElevator" : " Walk away from the door down the hallway until the elevator is on your right.",
    "TuringElevatorTuringHallway" : " Take a right as soon as you walk out of the elevator",
    "TuringHallwayTuringElevator" : " Walk down the hallway so that door 6 is ahead of you and the Cafeteria is behind you. The elevator will be in the middle of the hallway on your left near the entrance to Turing Commons",
    "TuringCommonsTuringHallway" : " Walk out of the commons and turn either right or left to find yourself in Turing Hallway",
    "TuringHallwayTuringCommons" : " Walk down the hallway so that door 6 is ahead of you and the Cafeteria is behind you. The commons will be in the middle of the hallway on your left",
    "TuringHallwayDaVinciStaircase" : " Head in the direction opposite to the Door 6 sign and take a left at the end of the hallway. The staircase will be on the right",
    "DaVinciStaircaseTuringHallway" : " Head in the direction of the cafeteria and take the first right",
    "BandHallwayAuditoriumLobby" : " Walk out of the double doors at the end of the hallway",
    "AuditoriumLobbyBandHallway" : " Walk to the trophy case and turn right to walk through the double doors",
    "FranklinCommonsFranklinStaircase" : " Walk down the common area away from Nobel Commons and see the staircase on your right at the end of the hall",
    "FranklinStaircaseFranklinCommons" : " Walk up staircase and take a left to find yourself in the commons",
    "FranklinCommonsNobelBalcony" : " Walk down the common with the college icons on your left and into the balcony",
    "NobelBalconyFranklinCommons" : " Keep the balcony to your left and walk straight into Franklin Commons",
    "NobelBalconyStaircaseNobelBalcony" : " Walk up the stairs",
    "NobelBalconyNobelBalconyStaircase" : " Walk down the stairs",
    "FranklinCommonsNewtonCommons" : " Walk down the common area with the college icons on your left and past the balcony. Newton Commons will be further down the hallway on the right",
    "NewtonCommonsFranklinCommons" : " Stand in the commons with the upward-leading ramp to your left. Exit the commons to the right and walk all the way down this hallway to find yourself in Franklin Commons",
    "NewtonCommonsNobelBalcony" : " Walk down the hallway with the balcony to your left. Newton Commons will be the first on the right",
    "NobelBalconyNewtonCommons" : " Stand in the commons with the upward-leading ramp to your left. Exit the commons to the right and walk down this hallway until you see the balcony on your right",
    "NewtonCommonsLibraryHallway" : " Walk up the ramp to the left of the commons to enter Library Hallway",
    "LibraryHallwayNewtonCommons" : " Walk down the hallway with the library to your left and walk down the ramp. Find Newton Commons on the right",
    "NewtonCommonsCurieStaircase" : " With the windows of the commons behind you and the ramp to the Library on your left take a right out of the commons. Walk down the hallway to the stairs at the end",
    "CurieStaircaseNewtonCommons" : " Walk up the stairs and take a right into the hallway. Walk down the hallway and into the first commons on the left",
    "NewtonCommonsCurieCommons" : " With the windows of the commons behind you and the ramp to the Library on your left take a right out of the commons. Walk down the hallway and up the first ramp on the left. Curie Commons is at the top",
    "CurieCommonsNewtonCommons" : " Walk down the ramp leading from the commons and take a right into the hallway. Walk down the hallway and into the first commons on the left",
    "CurieCommonsRoboticsStaircase" : " Face the Curie Commons sign and walk down the left hallway. The stairwell is at the end",
    "RoboticsStaircaseCurieCommons" : " Walk up the staircase and through the hallway on the left into the commons",
    "CurieCommonsSysLabStaircase" : " Face the Curie Commons sign and walk down the right hallway. Follow the right and left turns until the end where you can find the stairwell on the right",
    "SysLabStaircaseCurieCommons" : " Walk up the staircase and follow the twisting hallway until it opens up into Curie Commons",
    "LibraryLibraryStaircase" : " Walk out of the library and go straight",
    "LibraryStaircaseLibrary" : " Walk up the stairs",
    "LibraryLibraryHallway" : " Walk out of the library doors",
    "LibraryHallwayLibrary" : " Walk down the Library Hallway keeping the windows to your left and find it to your right in the middle of the hallway",
    "LibraryHallwayLibraryStaircase" : " Walk to the middle of the hallway. The staircase is opposite the library doors",
    "LibraryStaircaseLibraryHallway" : " Walk up the stairs",
    "HopperCommonsHopperStaircase" : " Walk down the commons keeping the whiteboard on your left. Take a right at the end of the hall to find the staircase",
    "HopperStaircaseHopperCommons" : " Walk up the stairs and exit the stairwell",
    "HopperCommonsLectureHall" : " Exit the commons through the hallway. Take a left at the bend and walk straight down the hall and up the ramp. Take a left and another immediate left at the doors",
    "LectureHallHopperCommons" : " Walk out of the doors and take a right. Walk down the ramp to the end of the hallway and take a right at the bend",
    "TeslaCommonsLectureHall" : " Walk out of the commons and take a right. Walk down the hallway to the intersection and take a right. Walk up the ramp and take a left. The Lecture Hall is to your immediate left",
    "LectureHallTeslaCommons" : " Walk out of the doors and take a right. Walk down the ramp. Take your first left at the intersection and walk down this hallway until the first left. Turn into the commons",
    "TeslaCommonsLibraryHallway" : " Walk out of the commons and take a left. Walk to the first intersection and take a right",
    "LibraryHallwayTeslaCommons" : " Keep the library to your right and walk down the hallway. Take a left at the intersection and walk down this hallway until the first right. Turn into the commons",
    "TeslaCommonsTeslaStaircase" : " Walk to the staircase in the back of the commons",
    "TeslaStaircaseTeslaCommons" : " Walk out of the staircase into the commons",
    "TeslaCommonsCarsonCommons" : " Walk out of the commons down the hall to the left and the commons should be on the left after the intersection",
    "CarsonCommonsTeslaCommons" : " Facing out of the commons walk right and the commons should be on the right down the hall",
    "CarsonCommonsCarverCommons" : " With the commons behind you walk left and Carver Commons will be on your right",
    "CarverCommonsCarsonCommons" : " With the windows behind you walk left and Carson Commons will be on your right",
    "CarsonCommonsLibraryHallway" : " With the commons behind you walk right and the long hallway will be on your left",
    "LibraryHallwayCarsonCommons" : " With the library to your right walk down the hallway and turn right. The commons will be on your left",
    "CarverCommonsCarverStaircase" : " With the windows to your right walk forward and into the stairwell on the left at the end of the hallway",
    "CarverStaircaseCarverCommons" : " walk up the stairs and walk to the right. The commons is on the left",
    "HopperCommonsHopperElevator" : " Walk out of the commons and the elevator will be on your left",
    "HopperElevatorHopperCommons" : " Exit the elevator and take a right. Follow this hallway into the commons",
    "HopperElevatorLectureHall" : " Exit the elevator and take a left. Walk down the hallway and up the ramp. Take a left at the top of the ramp and the Lecture Hall will be on the left",
    "LectureHallHopperElevator" : " Exit the Lecture Hall and take a right. Walk down the ramp and to the end of the hallway where there is an elevator on the right.",
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
  messageLIST.add("Start at "+from!);
  for (var i = 0; i < output2.length-1; i++){
    messageLIST.add(messages[output2[i]+output2[i+1]]!);
    print(messages[output2[i] + output2[i+1]]);
  }
  messageLIST.add("You have made it to "+to!+"! Your destination is close by, use the hot cold beacon.");
  return messageLIST;
  /// output1:
  /// [114, 113, 0, 6, 5]
  /// output2:
  /// [114, 113, 0, 6, 5]
}