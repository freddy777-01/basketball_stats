import 'package:flutter/material.dart';
// import 'dart:async';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'models.dart';
import 'Models/player.dart';
import 'bsk_theme.dart';
import 'package:go_router/go_router.dart';
// import 'package:flutter/services.dart';
import 'player_details.dart';
import 'Network/fetch_data_from_file.dart';

class Players extends StatefulWidget {
  const Players({super.key});

  @override
  PlayerPage createState() => PlayerPage();
}

class PlayerPage extends State<Players> {
  List<Player> _allPlayers = [];
  late Future<List> futurePlayers;
  void _getAllPlayers() {
    futurePlayers = FetchDataFile.getallPlayers();
    setState(() {
      futurePlayers.then((data) {
        _allPlayers = data.map((player) => Player.playerObj(player)).toList();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getAllPlayers();
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
        title: const Text("Players"),
      ),
      body: Scrollbar(
        child: FutureBuilder(
          future: futurePlayers,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: _allPlayers.length,
                itemBuilder: (context, index) {
                  if (_allPlayers.isEmpty) {
                    return const Center(child: Text("Data not found"));
                  } else {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return PlayerDetail(
                            player: Player(
                              id: _allPlayers[index].id,
                              firstName: _allPlayers[index].firstName,
                              lastName: _allPlayers[index].lastName,
                              position: _allPlayers[index].position,
                              team: _allPlayers[index].team,
                            ),
                          );
                        }));
                      },
                      child: playerCard(Player(
                        id: _allPlayers[index].id,
                        firstName: _allPlayers[index].firstName,
                        lastName: _allPlayers[index].lastName,
                        position: _allPlayers[index].position,
                        team: _allPlayers[index].team,
                      )),
                    );
                  }
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Widget playerCard(Player player) {
    return Card(
      key: ValueKey(player.id),
      margin: const EdgeInsets.all(10),
      color: Colors.white70,
      shadowColor: Colors.red.shade300,
      elevation: 7.0,
      child: ListTile(
        leading: const CircleAvatar(child: Icon(Icons.person)),
        title: Text("${player.firstName} \t ${player.lastName}"),
        subtitle: Text("Team: ${player.team.fullName}"),
      ),
    );
  }
}
