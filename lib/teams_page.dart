import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'player_details.dart';
import 'bsk_theme.dart';
import 'package:go_router/go_router.dart';
// import 'fetch_data.dart';
// import 'package:flutter/services.dart';

class Teams extends StatefulWidget {
  const Teams({super.key});

  @override
  PlayerPage createState() => PlayerPage();
}

class PlayerPage extends State<Teams> {
  List _teams = [];
  Future<void> getAllTeams() async {
    final String response =
        await rootBundle.loadString('assets/bskdata/teams.json');
    final data = await jsonDecode(response);
    setState(() {
      _teams = data['data'];
    });
  }

  @override
  void initState() {
    super.initState();
    getAllTeams();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BskTheme.bgColorDark,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.go('/'),
          icon: const Icon(Icons.home),
          color: BskTheme.navBarIconLight,
        ),
        title: const Text("Teams"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            _teams.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: _teams.length,
                      itemBuilder: (context, index) {
                        return Card(
                          key: ValueKey(_teams[index]['id']),
                          margin: const EdgeInsets.all(10),
                          color: Colors.white70,
                          shadowColor: Colors.red.shade300,
                          elevation: 7.0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${_teams[index]['full_name']} \t (${_teams[index]['abbreviation']})",
                                  style: BskTheme.heading1,
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  "City:\t ${_teams[index]['city']}",
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Conference :\t ${_teams[index]['conference']}",
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Division :\t ${_teams[index]['division']}",
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : const Center(
                    child: Text("No data"),
                  )
          ],
        ),
      ),
    );
  }
}
