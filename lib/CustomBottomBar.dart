import 'package:flutter/material.dart';
import 'package:wanna_plant/History/historyScreen.dart';
import 'package:wanna_plant/constants.dart';
import 'package:wanna_plant/favorite/favoriteScreen.dart';
import 'package:wanna_plant/homepage/homeScreen.dart';
import 'package:wanna_plant/profile/profileScreen.dart';

// class LinkPage extends StatefulWidget {
//   const LinkPage({Key? key}) : super(key: key);

//   @override
//   _LinkPageState createState() => _LinkPageState();
// }

// class _LinkPageState extends State<LinkPage> {
//   var index = 0;
//   final screens = [
//     Home(),
//     FavoriteScreen(),
//     HistoryScreen(),
//     profileScreen(),
//   ];

//   void _onItemTapped(int val) {
//     setState(
//       () {
//         index = val;
//         // if (val == 0) {
//         //   Navigator.pushNamed(context, '/Homepage');
//         // }
//         // if (val == 1) {
//         //   Navigator.pushNamed(context, '/Favorite');
//         // }
//         // if (val == 2) {
//         //   Navigator.pushNamed(context, '/History');
//         // }
//         // if (val == 3) {
//         //   Navigator.pushNamed(context, '/Profile');
//         // }
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//      // body: screens[index],
//       bottomNavigationBar:
//       SizedBox(
//         height: 75,
//         child: ClipRRect(
//           borderRadius: const BorderRadius.only(
//             topRight: Radius.circular(40),
//             topLeft: Radius.circular(40),
//           ),
//           child: BottomNavigationBar(
//             showUnselectedLabels: false,
//             type: BottomNavigationBarType.fixed,
//             selectedItemColor: Colors.green,
//             showSelectedLabels: true,
//             landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
//             // unselectedIconTheme:
//             //     IconThemeData(color: Colors.grey, size: 25, opacity: .8),
//             currentIndex: index,
//             onTap: _onItemTapped,
//             items: [
//               BottomNavigationBarItem(
//                 icon: Container(
//                   width: 40,
//                   height: 40,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(20),
//                       ),
//                       color: index == 0
//                           ? gbase.withOpacity(0.3)
//                           : Colors.transparent),
//                   child: Icon(Icons.home),
//                 ),
//                 label: 'Home',
//               ),
//               BottomNavigationBarItem(
//                 icon: Container(
//                   width: 40,
//                   height: 40,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(20),
//                       ),
//                       color: index == 1
//                           ? gbase.withOpacity(0.3)
//                           : Colors.transparent),
//                   child: Icon(Icons.favorite),
//                 ),
//                 label: 'Favorite',
//               ),
//               BottomNavigationBarItem(
//                 icon: Container(
//                   width: 40,
//                   height: 40,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(20),
//                       ),
//                       color: index == 2
//                           ? gbase.withOpacity(0.3)
//                           : Colors.transparent),
//                   child: Icon(Icons.local_activity_rounded),
//                 ),
//                 label: 'Activity',
//               ),
//               BottomNavigationBarItem(
//                 icon: Container(
//                   width: 40,
//                   height: 40,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(20),
//                       ),
//                       color: index == 3
//                           ? gbase.withOpacity(0.3)
//                           : Colors.transparent),
//                   child: Icon(Icons.person),
//                 ),
//                 label: 'Profile',
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
int index_bottombar = 0;

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({Key? key}) : super(key: key);

  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  // final screens = [
  //   Home(),
  //   FavoriteScreen(),
  //   HistoryScreen(),
  //   profileScreen(),
  // ];

  void _onItemTapped(int val) {
    setState(() {
      index_bottombar = val;
      if (index_bottombar == 0) {
        // Navigator.pushNamed(context, '/Homepage');
        Navigator.pushNamedAndRemoveUntil(
            context, '/Homepage', (route) => false);
      }
      if (index_bottombar == 1) {
        // Navigator.pushNamed(context, '/Favorite');
        Navigator.pushNamedAndRemoveUntil(
            context, '/Favorite', (route) => false);
      }
      if (index_bottombar == 2) {
        // Navigator.pushNamed(context, '/History');
        Navigator.pushNamedAndRemoveUntil(
            context, '/History', (route) => false);
      }
      if (index_bottombar == 3) {
        // Navigator.pushNamed(context, '/Profile');
        Navigator.pushNamedAndRemoveUntil(
            context, '/Profile', (route) => false);
      }
    });
  }

  @override
  void initState() {
    super.initState();
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
          currentIndex: index_bottombar,
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
                    color: index_bottombar == 0
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
                    color: index_bottombar == 1
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
                    color: index_bottombar == 2
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
                    color: index_bottombar == 3
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
