import 'package:flutter/material.dart';

class DashboardContainer extends StatefulWidget {
  @override
  _DashboardContainerState createState() => _DashboardContainerState();
}

class _DashboardContainerState extends State<DashboardContainer> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          HeaderContainer(),
        ],
      ),
    );
  }
}

class HeaderContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      padding: EdgeInsets.symmetric(
        horizontal: 10.0,
      ).copyWith(
        top: MediaQuery.of(context).padding.top,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20.0),
        ),
        image: DecorationImage(
          image: AssetImage('assets/images/bg-1.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Martes 12, mayo (dia 55 cuarentena)',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 26.0,
            ),
          ),
        ],
      ),
    );
  }
}
