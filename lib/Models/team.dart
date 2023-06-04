import 'dart:convert';

class Team {
  final int? id;
  final String? abbreviation;
  final String? city;
  final String? conference;
  final String? division;
  final String? fullName;
  final String? name;

  Team({
    required this.id,
    required this.abbreviation,
    required this.city,
    required this.conference,
    required this.division,
    required this.fullName,
    required this.name,
  });

  factory Team.teamObj(Map<String, dynamic> jsonData) {
    return Team(
        id: jsonData['id'],
        abbreviation: jsonData['abbreviation'],
        city: jsonData['city'],
        conference: jsonData['conference'],
        division: jsonData['division'],
        fullName: jsonData['full_name'],
        name: jsonData['name']);
  }
}
