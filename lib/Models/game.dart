import 'team.dart';

class Game {
  final int? gameId;
  final DateTime gameDate;
  final int? homeTeamScore;
  final int? visitorTeamScore;
  final int? period;
  final int? season;
  final String? status;
  final Team? homeTeam;
  final Team? visitorTeam;

  Game({
    required this.gameDate,
    required this.gameId,
    required this.homeTeam,
    required this.homeTeamScore,
    required this.period,
    required this.season,
    required this.status,
    required this.visitorTeamScore,
    required this.visitorTeam,
  });
//  DateTime.parse(game.gameDate.toString())
  factory Game.gameObj(Map<String, dynamic> j) {
    return Game(
      gameDate: DateTime.parse(j['date']),
      gameId: j['id '],
      homeTeam: Team.teamObj(j['home_team']),
      homeTeamScore: j['home_team_score'],
      period: j['period'],
      season: j['season'],
      status: j['status'],
      visitorTeamScore: j['visitor_team_score'],
      visitorTeam: Team.teamObj(j['visitor_team']),
    );
  }
}
