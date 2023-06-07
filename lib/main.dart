import 'package:bsk/about_page.dart';
import 'package:flutter/material.dart';
import 'bsk_theme.dart';
import 'package:go_router/go_router.dart';
import 'home_page.dart';
import 'bottom_navigation.dart';
import 'players_page.dart';
import 'intro_page.dart';
import 'teams_page.dart';
import 'games_page.dart';
import 'stats_page.dart';

void main() {
  runApp(const MyApp());
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MyHomePage(),
    ),
    GoRoute(
      path: '/Intro',
      builder: (context, state) => const IntroPage(),
    ),
    GoRoute(
      path: '/About',
      builder: (context, state) => const About(),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => BottomNav(
        child: child,
      ),
      routes: <RouteBase>[
        GoRoute(
          path: '/Players',
          builder: (context, state) => const Players(),
        ),
        GoRoute(
          path: '/Teams',
          builder: (context, state) => const Teams(),
        ),
        GoRoute(
          path: '/Games',
          builder: (context, state) => const Games(),
        ),
        GoRoute(
          path: '/Stats',
          builder: (context, state) => const Stats(),
        ),
      ],
    )
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = BskTheme.bodyLight();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'BasketBall Stats',
      theme: theme,
      routerConfig: router,
    );
  }
}
