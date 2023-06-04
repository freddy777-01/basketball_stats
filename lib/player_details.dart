import 'package:flutter/material.dart';
import 'Models/player.dart';
import 'package:dotted_line/dotted_line.dart';
import 'bsk_theme.dart';

class PlayerDetail extends StatelessWidget {
  final Player player;

  const PlayerDetail({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    const space = SizedBox(
      width: 10.0,
    );
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("Player"),
      ),
      body: Center(
        child: Card(
          key: ValueKey(player.id),
          margin: const EdgeInsets.all(10),
          color: Colors.white70,
          shadowColor: Colors.red.shade300,
          elevation: 7.0,
          child: Column(
            children: [
              ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.person),
                ),
                title: Text("${player.firstName}\t ${player.lastName}"),
              ),
              const DottedLine(
                dashLength: 10,
                dashColor: Colors.brown,
                lineThickness: 2,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'First Name :',
                            style: BskTheme.heading1,
                          ),
                          space,
                          Text("${player.firstName}"),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Last Name',
                            style: BskTheme.heading1,
                          ),
                          space,
                          Text("${player.lastName}")
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Position',
                            style: BskTheme.heading1,
                          ),
                          space,
                          Text("${player.position}"),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Team',
                            style: BskTheme.heading1,
                          ),
                          space,
                          Text("${player.team.fullName}"),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'City',
                            style: BskTheme.heading1,
                          ),
                          space,
                          Text("${player.team.city}"),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Division',
                            style: BskTheme.heading1,
                          ),
                          space,
                          Text("${player.team.division}"),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
