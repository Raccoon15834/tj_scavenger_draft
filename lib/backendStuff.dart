import 'package:dijkstra/dijkstra.dart';
List<String> dij(List<String> l) {
  String from = l.elementAt(0);
  String to = l.elementAt(1);
  Map graph = {
    "Auditorium Lobby": {"Gym 1": 1, "Art Gallery": 2, "Auditorium Staircase": 1},
    "Nobel Commons": {"Auditorium Lobby": 2, "Art Gallery": 1, "Nobel Staircase": 1, "Galileo Commons": 2, "Language Hallway 1": 3},
    "Art Gallery": {"Auditorium Staircase": 1, "Gandhi Commons": 1},
    "Galileo Commons": {"Language Hallway 1": 4, "Language Hallway 2": 3, "DaVinci Commons":2, "DaVinci Staircase": 2, "Cafeteria": 3},
    "Language Hallway 1": {"Language Hallway 2": 1},
    "Language Hallway 2": {"Language Hallway Staircase": 1},
    "DaVinci Commons": {"DaVinci Staircase": 1, "Quantum Staircase": 1, "Fish Staircase": 1},
    "Cafeteria": {"DaVinci Staircase": 2},
    "A114": {"A113": 1},
    "A111": {"A112": 1},
    "A112": {"A111": 1}
  };

  var output2 = Dijkstra.findPathFromGraph(graph, from, to);
  List<String> bob = [];

  for (var i = 0; i < output2.length; i++){
    bob.add(output2[i]);
  }
  return bob;
  /// output1:
  /// [114, 113, 0, 6, 5]
  /// output2:
  /// [114, 113, 0, 6, 5]
}