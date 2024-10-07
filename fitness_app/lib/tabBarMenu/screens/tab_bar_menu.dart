import 'package:fitness_app/common/app_colors.dart';
import 'package:fitness_app/common/strings.dart';
import 'package:flutter/material.dart';

import '../../common/mock_data.dart';

class TabBarMenu extends StatefulWidget {
  const TabBarMenu({super.key, this.menuIndex});
  final int? menuIndex;

  @override
  State<TabBarMenu> createState() => _TabBarMenu();
}

class _TabBarMenu extends State<TabBarMenu> {
  int _selectedIndex = 0;

  List<Map<String, Object>>? _screens;
  List<Icon>? _icons;

  @override
  void initState() {
    super.initState();
    _screens = screens;

    _icons = icons;

    if (widget.menuIndex != null) {
      _selectedIndex = widget.menuIndex!;
    }
  }

  void _selectScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundGrey,
      appBar: AppBar(
        backgroundColor: AppColors.mainBlueMenu,
        title: Row(
          children: [
            _icons![_selectedIndex],
            const SizedBox(
              width: 10,
            ),
            Text(
              _screens![_selectedIndex]['title'] as String,
              style: const TextStyle(
                color: AppColors.backgroundGrey,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
      body: _screens![_selectedIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.sports_gymnastics),
              label: Strings.trainingSession),
          BottomNavigationBarItem(
              icon: Icon(Icons.change_circle_outlined),
              label: Strings.updateSession),
          BottomNavigationBarItem(
              icon: Icon(Icons.add), label: Strings.newTrainingSession),
          BottomNavigationBarItem(
              icon: Icon(Icons.auto_graph), label: Strings.iDontKnowSession),
          BottomNavigationBarItem(
              icon: Icon(Icons.history), label: Strings.historySession),
        ],
        onTap: _selectScreen,
        backgroundColor: AppColors.mainBlueMenu,
        unselectedItemColor: AppColors.disableBlue,
        selectedItemColor: AppColors.selectedOption,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
