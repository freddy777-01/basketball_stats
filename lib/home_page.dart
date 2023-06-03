import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'bsk_theme.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  final String title = 'Basketball Status';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            constraints: const BoxConstraints.expand(
              width: 300,
              height: 370,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(30.0),
              ),
              boxShadow: [BoxShadow(color: Colors.white)],
            ),
            child: SizedBox(
              // height: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Image(
                    height: 300.0,
                    image: AssetImage('assets/images/nba.png'),
                  ),
                  SizedBox(
                    height: 3.0,
                  ),
                  Text(
                    'NBA \nStats application',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => context.go('/About'),
            style: BskTheme.btnStyle,
            child: const Text('About'),
          ),
          ElevatedButton.icon(
            onPressed: () => context.go('/Players'),
            style: ButtonStyle(
              textStyle: const MaterialStatePropertyAll(
                TextStyle(
                  fontSize: 20.0,
                ),
              ),
              foregroundColor: const MaterialStatePropertyAll(Colors.black),
              backgroundColor: const MaterialStatePropertyAll(Colors.white),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            label: const Text('Proceed'),
            icon: const Icon(Icons.arrow_forward),
          ),
        ],
      )),
    );
  }
}
