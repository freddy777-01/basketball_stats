import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'bsk_theme.dart';

class About extends StatelessWidget {
  const About({super.key});

  static List<String> features = [
    'it contains data from season 1946 - t0 current date.',
    'Live(ish) game stats are available (Updated every ~ 10 minutes)',
    'Rate limits of 60 request per minute',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.go('/'),
          icon: const Icon(Icons.home),
          color: BskTheme.navBarIconLight,
        ),
        title: const Text('About'),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(10.0, 25.0, 10.0, 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              'About the App',
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              'NBA Stats Application is build based in balldontile API, which is a free API.',
              style: TextStyle(
                fontSize: 17.0,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Row(
              children: [
                Text(
                  'Features:',
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: features.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Text('${index + 1}'),
                    title: Text(
                      features[index],
                      style: const TextStyle(fontSize: 19.0),
                    ),
                  );
                },
              ),
            ),
            Row(
              children: [
                ElevatedButton.icon(
                  style: ButtonStyle(
                    textStyle: const MaterialStatePropertyAll(
                      TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    foregroundColor:
                        const MaterialStatePropertyAll(Colors.black),
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.white),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  onPressed: () => context.go('/'),
                  label: const Text('Home'),
                  icon: const Icon(Icons.arrow_back),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
