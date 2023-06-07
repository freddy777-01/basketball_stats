import 'package:bsk/Models/game.dart';
import 'package:bsk/Models/player.dart';
import 'package:bsk/Models/team.dart';

class Status {
  final int? id;
  final Player? player;
  final Game? game;
  final Team? team;
  final int? reb;
  final int? ast;
  final int? turnover;
  final int? blk;

  Status({
    required this.id,
    required this.player,
    required this.game,
    required this.team,
    required this.reb,
    required this.ast,
    required this.turnover,
    required this.blk,
  });

  factory Status.statusObj(Map<String, dynamic> j) {
    return Status(
      id: j['id'],
      player: Player.playerObj(j['player']),
      game: Game.gameObj(j['game']),
      team: Team.teamObj(j['team']),
      reb: j['reb'],
      ast: j['ast'],
      turnover: j['turnover'],
      blk: j['blk'],
    );
  }
}
