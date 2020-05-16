import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/colors.dart';

class TaskPage extends StatefulWidget {
  final String type;

  TaskPage({this.type});

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg-2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Text(
                'Create\nNew Task',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20.0,
              ).copyWith(bottom: 50.0),
              child: TextField(
                style: TextStyle(
                  fontSize: 20.0,
                ),
                decoration: InputDecoration(
                  hintText: 'Name',
                  labelText: 'Name',
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            Expanded(
              child: BottomContainer(),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomContainer extends StatefulWidget {
  @override
  _BottomContainerState createState() => _BottomContainerState();
}

class _BottomContainerState extends State<BottomContainer> {
  Map<String, Color> categories;

  @override
  void initState() {
    categories = {
      'Libros': Colors.red,
      'Articulo': Colors.black,
      'Videos': Colors.purple,
      'Mar': Colors.blue,
      'Grinch Code': Colors.green,
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
      ),
      padding: EdgeInsets.all(20.0).copyWith(
        bottom: 10.0 + MediaQuery.of(context).padding.bottom,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Category',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16.0,
            ),
          ),
          Wrap(
            children: categories
                .map<String, Widget>((title, color) {
                  return MapEntry(
                      title,
                      Container(
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 10.0,
                        ),
                        child: Text(
                          title,
                          style: TextStyle(
                            color: color,
                            fontSize: 16.0,
                          ),
                        ),
                      ));
                })
                .values
                .toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                color: Colors.green,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                onPressed: () {
                  setState(() {
                    categories['Wibo 3'] = Colors.pink;
                  });
                },
                child: Text('Add tag'),
                textColor: Colors.white,
              ),
            ],
          ),
          Expanded(
            child: Container(),
          ),
          FlatButton(
            color: GrinchColors.blueDark,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            onPressed: () {},
            padding: EdgeInsets.symmetric(
              vertical: 15.0,
            ),
            child: Text(
              'Create task',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
