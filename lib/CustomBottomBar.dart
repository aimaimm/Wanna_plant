import 'package:flutter/material.dart';
import 'package:wanna_plant/constants.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({Key? key}) : super(key: key);

  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  var index = 0;

  void _onItemTapped(int val) {
    setState(
      () {
        index = val;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(40),
          topLeft: Radius.circular(40),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.green,
          showSelectedLabels: true,
          landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
          // unselectedIconTheme:
          //     IconThemeData(color: Colors.grey, size: 25, opacity: .8),
          currentIndex: index,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: index == 0
                        ? gbase.withOpacity(0.3)
                        : Colors.transparent),
                child: Icon(Icons.home),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: index == 1
                        ? gbase.withOpacity(0.3)
                        : Colors.transparent),
                child: Icon(Icons.favorite),
              ),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: index == 2
                        ? gbase.withOpacity(0.3)
                        : Colors.transparent),
                child: Icon(Icons.local_activity_rounded),
              ),
              label: 'Activity',
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: index == 3
                        ? gbase.withOpacity(0.3)
                        : Colors.transparent),
                child: Icon(Icons.person),
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
