import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nilcom/bookmark/views/bookmark.dart';
import 'package:nilcom/browse/views/browse.dart';
import 'package:nilcom/common/colors.dart';
import 'package:nilcom/common/paths.dart';
import 'package:nilcom/features/dashboard/views/dashboard.dart';
import 'package:nilcom/features/discover/views/discover.dart';
import 'package:nilcom/features/profile/views/profile.dart';
import 'package:nilcom/more/views/more.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> list = [
    const Discover(),
    const Browse(),
    const Bookmark(),
    const More(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedLabelStyle: const TextStyle(color: titleColor),
        onTap: onTap,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(homeDeActiveSvg),
              activeIcon: SvgPicture.asset(homeActiveSvg),
              label: 'Discover'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(browseDeActiveSvg),
              activeIcon: SvgPicture.asset(browseActiveSvg),
              label: 'Browse'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(bookmarkDeActiveSvg),
              activeIcon: SvgPicture.asset(bookmarkActiveSvg),
              label: 'Bookmark'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(userDeActiveSvg),
              activeIcon: SvgPicture.asset(userActiveSvg),
              label: 'More'),
        ],
      ),
    );
  }
}
