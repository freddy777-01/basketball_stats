// import 'package:bsk/bsk_theme.dart';
import 'package:bsk/bsk_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({this.child, super.key});

  final Widget? child;

  int _changeIndex(BuildContext context) {
    final pageUrl = GoRouterState.of(context).location;

    if (pageUrl.startsWith('/Players')) {
      return 0;
    } else if (pageUrl.startsWith('/Teams')) {
      return 1;
    } else if (pageUrl.startsWith('/Games')) {
      return 2;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _changeIndex(context),
        onTap: (index) {
          switch (index) {
            case 0:
              context.go('/Players');
              break;
            case 1:
              context.go('/Teams');
              break;
            case 2:
              context.go('/Games');
              break;
            default:
              context.go('/');
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Image(
              image: AssetImage('assets/icons/group_.png'),
              width: 30.0,
              height: 30.0,
              fit: BoxFit.contain,
            ),
            label: 'Players',
          ),
          BottomNavigationBarItem(
            icon: Image(
              image: AssetImage('assets/icons/groups_.png'),
              width: 30.0,
              height: 30.0,
              fit: BoxFit.contain,
            ),
            label: 'Teams',
          ),
          BottomNavigationBarItem(
            icon: Image(
              image: AssetImage('assets/icons/sports_basketball_.png'),
              width: 30.0,
              height: 30.0,
              fit: BoxFit.contain,
            ),
            label: 'Games',
          ),
          BottomNavigationBarItem(
            icon: Image(
              image: AssetImage('assets/icons/monitoring_.png'),
              width: 30.0,
              height: 30.0,
              fit: BoxFit.contain,
            ),
            label: 'Stats',
          ),
          BottomNavigationBarItem(
            icon: Image(
              image: AssetImage('assets/icons/avg_pace_.png'),
              width: 30.0,
              height: 30.0,
              fit: BoxFit.contain,
            ),
            label: 'Season Avg',
          ),
        ],
        unselectedItemColor: Colors.black,
        selectedItemColor: BskTheme.bgColorDark,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
      ),
    );
  }
}

/* class BottomNavBar extends State<BottomNav> {
  int _selectedIndex = 0;


  int _changeIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });

  }

  @override

} */
