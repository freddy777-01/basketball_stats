import 'package:bsk/Models/team.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'dart:async';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'player_details.dart';
import 'bsk_theme.dart';
import 'package:go_router/go_router.dart';
// import 'fetch_data.dart';
// import 'package:flutter/services.dart';
import 'Network/fetch_data_from_file.dart';
import 'dart:math';

class Teams extends StatefulWidget {
  const Teams({super.key});

  @override
  TeamsPage createState() => TeamsPage();
}

class TeamsPage extends State<Teams> {
  List<Team> _teams = [];
  late Future<List> futureData;

  void _getAllTeams() {
    futureData = FetchDataFile.getAllTeams();
    setState(() {
      futureData.then((data) {
        _teams = data.map((team) => Team.teamObj(team)).toList();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getAllTeams();
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
      body: FutureBuilder(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.only(
                left: 4.0,
                right: 4.0,
                top: 5.0,
                bottom: 5.0,
              ),
              child: Column(
                children: [
                  _teams.isNotEmpty
                      ? Expanded(
                          child: ListView.builder(
                            itemCount: _teams.length,
                            itemBuilder: (context, index) {
                              return teamCard(
                                Team(
                                    id: _teams[index].id,
                                    abbreviation: _teams[index].abbreviation,
                                    city: _teams[index].city,
                                    conference: _teams[index].conference,
                                    division: _teams[index].division,
                                    fullName: _teams[index].fullName,
                                    name: _teams[index].name),
                              );
                            },
                          ),
                        )
                      : const Center(
                          child: Text("No data"),
                        )
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget teamCard(Team team) {
    Random random = Random();
    int randomNumber = random.nextInt(30) + 1;
    return Card(
      key: ValueKey(team.id),
      margin: const EdgeInsets.all(10),
      color: Colors.white70,
      shadowColor: Colors.red.shade300,
      elevation: 7.0,
      child: ListTile(
        leading: CircleAvatar(
            backgroundColor: Colors.white,
            child: Image(
                image: AssetImage(
                    "assets/team_logos/team_photo_$randomNumber.png"))),
        title: Text(
          "${team.fullName} \t (${team.abbreviation})",
          style: BskTheme.heading1,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 7,
            ),
            Text(
              "City:\t ${team.city}",
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Conference :\t ${team.conference}",
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Division :\t ${team.division}",
            ),
          ],
        ),
      ),
    );
  }
}
