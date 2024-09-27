import 'package:fitness_app/common/app_colors.dart';
import 'package:fitness_app/common/strings.dart';
import 'package:fitness_app/history/screens/history_screen.dart';
import 'package:fitness_app/newTraining/add_training_screen.dart';
import 'package:fitness_app/progress/progress_screen.dart';
import 'package:fitness_app/training/screens/training_screen.dart';
import 'package:fitness_app/update/update_screen.dart';
import 'package:flutter/material.dart';

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
    _screens = [
      {
        'title': Strings.trainingSession,
        'screen': TrainingScreen(),
      },
      {
        'title': Strings.updateSession,
        'screen': const UpdateScreen(),
      },
      {
        'title': Strings.newTrainingSession,
        'screen': const AddTrainingScreen(),
      },
      {
        'title': Strings.iDontKnowSession,
        'screen': const ProgressScreen(),
      },
      {
        'title': Strings.historySession,
        'screen': const HistoryScreen(),
      },
    ];

    _icons = [
      const Icon(
        Icons.sports_gymnastics,
        color: AppColors.justWhite,
      ),
      const Icon(
        Icons.change_circle_outlined,
        color: AppColors.justWhite,
      ),
      const Icon(
        Icons.add,
        color: AppColors.justWhite,
      ),
      const Icon(
        Icons.auto_graph,
        color: AppColors.justWhite,
      ),
      const Icon(
        Icons.history,
        color: AppColors.justWhite,
      ),
    ];

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
