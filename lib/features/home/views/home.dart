import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nilcom/common/colors.dart';
import 'package:nilcom/common/paths.dart';
import 'package:nilcom/features/dashboard/views/dashboard.dart';
import 'package:nilcom/features/profile/views/profile.dart';

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
    const Dashboard(),
    const Profile(),
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
              label: 'Home'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(userDeActiveSvg),
              activeIcon: SvgPicture.asset(userActiveSvg),
              label: 'Profile'),
        ],
      ),
    );
  }
}
