import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class FetchData {
  static Future<List> getallPlayers() async {
    final response =
        await http.get(Uri.parse('https://www.balldontlie.io/api/v1/players'));
    if (response.statusCode == 200) {
      // jsonData = jsonDecode(response.body);
      return jsonDecode(response.body)['data'];
    } else {
      throw Exception('Failed to load Players');
    }
  }

  static Future<Map> getAPlayer(int id) async {
    final response = await http
        .get(Uri.parse('https://www.balldontlie.io/api/v1/players/$id'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load Players');
    }
  }

  static Future<List> getAllTeams() async {
    final response =
        await http.get(Uri.parse('https://www.balldontlie.io/api/v1/teams'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['data'];
    } else {
      throw Exception('Failed to load Players');
    }
  }

  static Future<Map> getATeam(int id) async {
    final response = await http
        .get(Uri.parse('https://www.balldontlie.io/api/v1/teams/$id'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load Players');
    }
  }

  static Future<List> getAllGames() async {
    final response =
        await http.get(Uri.parse('https://www.balldontlie.io/api/v1/games'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['data'];
    } else {
      throw Exception('Failed to load Players');
    }
  }

  static Future<Map> getAGame(int id) async {
    final response = await http
        .get(Uri.parse('https://www.balldontlie.io/api/v1/games/$id'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load Players');
    }
  }

  static Future<List> getAllStats() async {
    final response =
        await http.get(Uri.parse('https://www.balldontlie.io/api/v1/stats'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['data'];
    } else {
      throw Exception('Failed to load Players');
    }
  }
}
