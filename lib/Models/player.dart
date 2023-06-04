import 'dart:convert';

import 'package:bsk/Models/team.dart';

class Player {
  final int? id;
  final String? firstName;
  final String? lastName;
  final int? heightInches;
  final int? heightFeet;
  final String? position;
  final Team team;
  final int? weightPounds;

  Player({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.position,
    required this.team,
    this.heightFeet,
    this.heightInches,
    this.weightPounds,
  });

  factory Player.playerObj(Map<String, dynamic> jsonData) {
    return Player(
        id: jsonData['id'],
        firstName: jsonData['first_name'],
        lastName: jsonData['last_name'],
        position: jsonData['position'],
        team: Team.teamObj(jsonData['team']),
        heightFeet: jsonData['height_feet'],
        heightInches: jsonData['height_inches'],
        weightPounds: jsonData['weight_pounds']);
  }
}
