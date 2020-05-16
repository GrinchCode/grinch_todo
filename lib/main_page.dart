import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/colors.dart';
import 'package:todo/home/home.dart';

import 'colors.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentPage = 0;

  List<Page> _pages;

  @override
  void initState() {
    _pages = [
      Page(
        body: DashboardContainer(),
        icon: Icons.dashboard,
        index: 0,
        onPress: () => changePage(0),
        type: 0,
      ),
      Page(
        body: TasksContainer(),
        icon: Icons.alarm,
        index: 1,
        onPress: () => changePage(1),
        type: 0,
      ),
      Page(
        icon: Icons.add,
        onPress: () {
          Navigator.pushNamed(context, '/task', arguments: 'type');
        },
        type: 1,
      ),
      Page(
        body: TODOContainer(),
        icon: Icons.check_box,
        index: 3,
        onPress: () => changePage(3),
        type: 0,
      ),
      Page(
        body: ProfileContainer(),
        icon: Icons.person,
        index: 4,
        onPress: () => changePage(4),
        type: 0,
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentPage].body,
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 70.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _pages.map<Widget>((page) {
              if (page.type == 0) {
                return IconButton(
                  onPressed: () => page.onPress(),
                  icon: Icon(
                    page.icon,
                    color: _currentPage == page.index
                        ? GrinchColors.blueDark
                        : Colors.grey,
                  ),
                );
              } //
              else {
                return MainButton(page);
              }
            }).toList(),
          ),
        ),
      ),
    );
  }

  void changePage(int index) {
    setState(() {
      _currentPage = index;
    });
  }
}

class MainButton extends StatelessWidget {
  final Page page;

  const MainButton(this.page);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10.0,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50.0),
        child: SizedBox(
          height: 60.0,
          width: 60.0,
          child: Material(
            color: GrinchColors.blueDark,
            child: IconButton(
              onPressed: () => page.onPress(),
              icon: Icon(
                page.icon,
                color: Colors.white,
                size: 30.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Page {
  Widget body;
  IconData icon;
  int index;
  VoidCallback onPress;
  int type;

  Page({
    this.body,
    this.index,
    this.icon,
    this.onPress,
    this.type,
  });
}
