import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'bsk_theme.dart';
import 'package:dotted_line/dotted_line.dart';
import 'Models/game.dart';

class Games extends StatefulWidget {
  const Games({super.key});

  @override
  GamesPage createState() => GamesPage();
}

class GamesPage extends State<Games> {
  List<Game> _gamesList = [];
  Widget? _stats;
  final verticalSpace = const SizedBox(
    height: 5.0,
  );
  final horizontalSpace = const SizedBox(
    width: 2.0,
  );
  void _getGames() {
    DefaultAssetBundle.of(context)
        .loadString('assets/bskdata/games.json')
        .then((value) {
      final List data = jsonDecode(value)['data'];
      setState(() {
        _gamesList = data.map((game) => Game.gameObj(game)).toList();
      });
    });
  }

  void _changeGameStats(game) {
    setState(() {
      _stats = gameStats(game);
    });
  }

  @override
  void initState() {
    super.initState();
    _getGames();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BskTheme.bgColorDark,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(
            onPressed: () => context.go('/'), icon: const Icon(Icons.home)),
        title: const Text("Games"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _gamesList.length,
              itemBuilder: (context, index) {
                return miniGameCard(
                  Game(
                    gameId: _gamesList[index].gameId,
                    gameDate: _gamesList[index].gameDate,
                    homeTeamScore: _gamesList[index].homeTeamScore,
                    visitorTeamScore: _gamesList[index].visitorTeamScore,
                    period: _gamesList[index].period,
                    status: _gamesList[index].status,
                    homeTeam: _gamesList[index].homeTeam,
                    visitorTeam: _gamesList[index].visitorTeam,
                    season: _gamesList[index].season,
                  ),
                );
              },
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.only(top: 5.0),
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width,
                minHeight: 200.0,
              ),
              decoration: const BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Game Status',
                    style: BskTheme.heading1,
                  ),
                  verticalSpace,
                  const DottedLine(
                    dashLength: 10,
                    dashColor: Colors.brown,
                    lineThickness: 1.5,
                  ),
                  verticalSpace,
                  Expanded(
                      child: Center(
                    child: _stats,
                  )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget gameStats(Game game) {
    return Column(
      children: [
        Text(
          'Year : ${game.season.toString()}',
          style: BskTheme.heading1,
        ),
        Text(
          'Status : ${game.status}',
          style: BskTheme.heading1,
        ),
        verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(game.homeTeamScore.toString()),
            Text(
              'Scores',
              style: BskTheme.heading1,
            ),
            Text(game.visitorTeamScore.toString())
          ],
        )
      ],
    );
  }

  Widget miniGameCard(Game game) {
    final gameTime = DateTime.parse(game.gameDate.toString());

    return GestureDetector(
      onTap: () {
        _changeGameStats(game);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 5.0, left: 5.0, top: 10.0),
        padding: const EdgeInsets.all(5.0),
        constraints: const BoxConstraints(
          maxWidth: 300.0,
          maxHeight: 100.0,
        ),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0.0, 0.75),
              blurRadius: 15.0,
            ),
          ],
          color: Colors.white60,
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "${game.homeTeam!.abbreviation}",
                  style: BskTheme.abbriviationText,
                ),
                const Image(
                  image: AssetImage("assets/images/vs-image.png"),
                  height: 60.0,
                  width: 60.0,
                ),
                Text(
                  "${game.visitorTeam!.abbreviation}",
                  style: BskTheme.abbriviationText,
                ),
              ],
            ),
            verticalSpace,
            Text(
              "Time",
              style: BskTheme.heading1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Chip(label: Text("${gameTime.hour}\t:\t${gameTime.minute}")),
                horizontalSpace,
                Text(
                  gameTime.timeZoneName,
                  style: const TextStyle(fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
