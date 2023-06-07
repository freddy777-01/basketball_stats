import 'package:bsk/Models/status.dart';
// import 'package:bsk/Models/team.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'dart:async';
// import 'package:http/http.dart' as http;
// import 'player_details.dart';
import 'bsk_theme.dart';
import 'package:go_router/go_router.dart';
// import 'fetch_data.dart';
// import 'package:flutter/services.dart';
import 'Network/fetch_data_from_file.dart';
// import 'dart:math';

class Stats extends StatefulWidget {
  const Stats({super.key});

  @override
  StatsPage createState() => StatsPage();
}

class StatsPage extends State<Stats> {
  List<Status> _stats = [];
  late Future<List> _futureStatus;

  void _getAllStats() {
    _futureStatus = FetchDataFile.getAllStatus();
    setState(() {
      _futureStatus.then((data) {
        _stats = data.map((stats) => Status.statusObj(stats)).toList();
        // print("length of Status = ${data.length}");
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getAllStats();
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
        title: const Text("Status"),
      ),
      body: FutureBuilder(
        future: _futureStatus,
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
                  _stats.isNotEmpty
                      ? Expanded(
                          child: ListView.builder(
                            itemCount: _stats.length,
                            itemBuilder: (context, index) {
                              return statsCard(Status(
                                id: _stats[index].id,
                                player: _stats[index].player,
                                game: _stats[index].game,
                                team: _stats[index].team,
                                reb: _stats[index].reb,
                                ast: _stats[index].ast,
                                turnover: _stats[index].turnover,
                                blk: _stats[index].blk,
                              ));
                            },
                          ),
                        )
                      : Expanded(
                          child: Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size.fromWidth(200.0),
                              ),
                              onPressed: () => _getAllStats(),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.refresh),
                                  SizedBox(
                                    width: 7.0,
                                  ),
                                  Text("Refresh"),
                                ],
                              ),
                            ),
                          ),
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

  Widget statsCard(Status status) {
    // Random random = Random();
    // int randomNumber = random.nextInt(30) + 1;

    return Card(
      key: ValueKey(status.id),
      margin: const EdgeInsets.all(10),
      color: Colors.white70,
      shadowColor: Colors.red.shade300,
      elevation: 7.0,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "${status.game!.homeTeam}",
                style: BskTheme.abbriviationText,
              ),
              const Image(
                image: AssetImage("assets/images/vs-image.png"),
                height: 60.0,
                width: 60.0,
              ),
              Text(
                "${status.game!.visitorTeam}",
                style: BskTheme.abbriviationText,
              ),
            ],
          ),
          const DottedLine(
            dashColor: Colors.black,
            lineThickness: 2.5,
            dashLength: 6.0,
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text('Season : ${status.game!.season.toString()}'),
          Text('Match Player : ${status.player!.firstName}'),
          Text('Match Team : ${status.team!.fullName}'),
          Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(status.game!.homeTeamScore.toString()),
                Text(
                  'Scores',
                  style: BskTheme.heading1,
                ),
                Text(status.game!.visitorTeam.toString()),
                ListTile(
                  leading: const Text('Reb'),
                  trailing: Text(status.reb.toString()),
                ),
                ListTile(
                  leading: const Text('Trunover'),
                  trailing: Text(status.turnover.toString()),
                ),
                ListTile(
                  leading: const Text('AST'),
                  trailing: Text(status.ast.toString()),
                ),
                ListTile(
                  leading: const Text('Block'),
                  trailing: Text(status.blk.toString()),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
