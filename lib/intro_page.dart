import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'bsk_theme.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

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
        title: const Text('Players'),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints.expand(
            width: 300,
            height: 400,
          ),
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/pexels-b.jpg'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(50.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: null,
                style: BskTheme.btnStyle,
                child: const Text('Check all players'),
              ),
              ElevatedButton(
                onPressed: null,
                style: BskTheme.btnStyle,
                child: const Text('Check a specific player'),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: const BottomNav(),
    );
  }
}
