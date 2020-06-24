import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          TaskTile(
            title: 'Category',
            child: TaskTags(
              categories: categories,
              onAddTag: (entry) => categories.addEntries([entry]),
            ),
          ),
          Expanded(
            child: Container(),
          ),
          PrimaryButton(
            text: 'Create Task',
            onTap: () => print('presionado'),
          ),
        ],
      ),
    );
  }
}

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key key,
    @required this.child,
    @required this.title,
  })  : assert(child != null),
        // ignore: prefer_is_empty
        assert(title != null && title.length > 0,
            'El `title` debe ser un string no vacio'),
        super(key: key);

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          'Category',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16.0,
          ),
        ),
        child,
      ],
    );
  }
}

class TaskTags extends StatelessWidget {
  const TaskTags({Key key, this.categories, this.onAddTag}) : super(key: key);

  final Map<String, Color> categories;
  final ValueSetter<MapEntry<String, Color>> onAddTag;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Wrap(
        children: [
          for (final entry in categories.entries)
            TaskTag(tag: entry.key, color: entry.value)
        ],
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
            onPressed: () => onAddTag(MapEntry('Wibo 3', Colors.pink)),
            child: Text('Add tag'),
            textColor: Colors.white,
          ),
        ],
      ),
    ]);
  }
}

class TaskTag extends StatelessWidget {
  const TaskTag({Key key, this.tag, this.color}) : super(key: key);

  final String tag;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        tag,
        style: TextStyle(
          color: color,
          fontSize: 16.0,
        ),
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key key,
    @required this.text,
    this.onTap,
  })  : assert(text != null),
        super(key: key);

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Theme.of(context).primaryColor,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      onPressed: onTap,
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
    );
  }
}
