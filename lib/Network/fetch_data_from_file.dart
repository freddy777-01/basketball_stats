import 'dart:async';
import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

class FetchDataFile {
  // Files
  static String gamesFile = "assets/bskdata/games.json";
  static String playersFile = "assets/bskdata/players.json";
  static String teamsFile = "assets/bskdata/teams.json";
  static String statsFile = "assets/bskdata/status.json";

  static Future<List> getallPlayers() async {
    final String response = await rootBundle.loadString(playersFile);
    final List data = await jsonDecode(response)['data'];
    return data;
  }

/*   static Future getAPlayer(int id) async {
    final response = await http
        .get(Uri.parse('https://www.balldontlie.io/api/v1/players/$id'));
    if (response.statusCode == 200) {
      return jsonData = jsonDecode(response.body);
    } else {
      throw Exception('Failed to load Players');
    }
  } */

  static Future<List> getAllTeams() async {
    final String response = await rootBundle.loadString(teamsFile);
    final List data = await jsonDecode(response)['data'];
    return data;
  }

/*   static Future getATeam(int id) async {
    final response = await http
        .get(Uri.parse('https://www.balldontlie.io/api/v1/teams/$id'));
    if (response.statusCode == 200) {
      jsonData = jsonDecode(response.body);
    } else {
      throw Exception('Failed to load Players');
    }
  } */

  static Future<List> getAllGames() async {
    final String response = await rootBundle.loadString(gamesFile);
    final List data = await jsonDecode(response)['data'];
    return data;
  }

/*   static Future getAGame(int id) async {
    final response = await http
        .get(Uri.parse('https://www.balldontlie.io/api/v1/games/$id'));
    if (response.statusCode == 200) {
      jsonData = jsonDecode(response.body);
    } else {
      throw Exception('Failed to load Players');
    }
  } */

  static Future<List> getAllStatus() async {
    final String response = await rootBundle.loadString(statsFile);
    final List data = await jsonDecode(response)['data'];
    return data;
  }
}

/* void main(List<String> args) {
  FetchDataFile.getAllStatus();
  // print(FetchData.convertToMap(j));
  // print(FetchData.jsonData);
} */
