import 'package:flutter/material.dart';
// import 'dart:async';
import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'player.dart';
import 'bsk_theme.dart';
import 'package:go_router/go_router.dart';
// import 'package:flutter/services.dart';
import 'player_details.dart';

class Players extends StatefulWidget {
  const Players({super.key});

  @override
  PlayerPage createState() => PlayerPage();
}

class PlayerPage extends State<Players> {
  List allPlayers = [];

  void _getAllPlayers() {
    DefaultAssetBundle.of(context)
        .loadString('assets/bskdata/players.json')
        .then((value) {
      final data = jsonDecode(value);
      setState(() {
        allPlayers = data['data'];
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
        child: ListView.builder(
          itemCount: allPlayers.length,
          itemBuilder: (context, index) {
            if (allPlayers.isEmpty) {
              return const Center(child: Text("Data not found"));
            } else {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PlayerDetail(
                      player: Player(
                        id: allPlayers[index]['id'],
                        firstName: allPlayers[index]['first_name'],
                        lastName: allPlayers[index]['last_name'],
                        position: allPlayers[index]['position'],
                        city: allPlayers[index]['team']['city'],
                        conference: allPlayers[index]['team']['conference'],
                        team: allPlayers[index]['team']['full_name'],
                      ),
                    );
                  }));
                },
                child: playerCard(Player(
                  id: allPlayers[index]['id'],
                  firstName: allPlayers[index]['first_name'],
                  lastName: allPlayers[index]['last_name'],
                  position: allPlayers[index]['position'],
                  city: allPlayers[index]['team']['city'],
                  conference: allPlayers[index]['team']['conference'],
                  team: allPlayers[index]['team']['full_name'],
                )),
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
        subtitle: Text("Team: ${player.team}"),
      ),
    );
  }
}
