import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class FetchDataFile {
  static Map<String, dynamic>? jsonData;
  static Map<String, dynamic>? fetchedData;
  // Files
  static String gamesFile = "assets/bskdata/games.json";
  static String playersFile = "assets/bskdata/players.json";
  static String teamsFile = "assets/bskdata/teams.json";
  static String statsFile = "assets/bskdata/stats.json";

  FetchDataFile.getAllPlayers() {
    () async {
      final response = await http
          .get(Uri.parse('https://www.balldontlie.io/api/v1/players'));
      if (response.statusCode == 200) {
        // jsonData = jsonDecode(response.body);
        convertToMap(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load Players');
      }
    };
  }
/*   static Future getallPlayers() async {
    final response =
        await http.get(Uri.parse('https://www.balldontlie.io/api/v1/players'));
    if (response.statusCode == 200) {
      // jsonData = jsonDecode(response.body);
      convertToMap(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Players');
    }
  } */

  static Future getAPlayer(int id) async {
    final response = await http
        .get(Uri.parse('https://www.balldontlie.io/api/v1/players/$id'));
    if (response.statusCode == 200) {
      return jsonData = jsonDecode(response.body);
    } else {
      throw Exception('Failed to load Players');
    }
  }

  static Future getAllTeams() async {
    final response =
        await http.get(Uri.parse('https://www.balldontlie.io/api/v1/teams'));
    if (response.statusCode == 200) {
      jsonData = jsonDecode(response.body);
    } else {
      throw Exception('Failed to load Players');
    }
  }

  static Future getATeam(int id) async {
    final response = await http
        .get(Uri.parse('https://www.balldontlie.io/api/v1/teams/$id'));
    if (response.statusCode == 200) {
      jsonData = jsonDecode(response.body);
    } else {
      throw Exception('Failed to load Players');
    }
  }

  static Future getAllGames() async {
    final response =
        await http.get(Uri.parse('https://www.balldontlie.io/api/v1/games'));
    if (response.statusCode == 200) {
      jsonData = jsonDecode(response.body);
    } else {
      throw Exception('Failed to load Players');
    }
  }

  static Future getAGame(int id) async {
    final response = await http
        .get(Uri.parse('https://www.balldontlie.io/api/v1/games/$id'));
    if (response.statusCode == 200) {
      jsonData = jsonDecode(response.body);
    } else {
      throw Exception('Failed to load Players');
    }
  }

  static Future getAllStats(int id) async {
    final response = await http
        .get(Uri.parse('https://www.balldontlie.io/api/v1/stats/$id'));
    if (response.statusCode == 200) {
      jsonData = jsonDecode(response.body);
    } else {
      throw Exception('Failed to load Players');
    }
  }

  static void convertToMap(Map<String, dynamic> jsonData) {
    // print(jsonData['data'][0]['first_name']);
    fetchedData = jsonData;
  }
}

/* void main(List<String> args) {
  FetchData.getallPlayers();
  // print(FetchData.convertToMap(j));
  // print(FetchData.jsonData);
} */
