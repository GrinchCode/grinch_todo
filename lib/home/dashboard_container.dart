import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardContainer extends StatefulWidget {
  @override
  _DashboardContainerState createState() => _DashboardContainerState();
}

class _DashboardContainerState extends State<DashboardContainer> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 60);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          HeaderContainer(
            //gretting: null,
            gretting: 'Hola, Frank.',
          ),
          Container(
            color: Colors.blue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: 200,
                  color: Colors.red,
                  child: Text('Hola', style: style),
                ),
                Text('Hello', style: style),
                Text('Hallo', style: style),
                Text('Ciao', style: style),
                Switch.adaptive(
                  value: value,
                  onChanged: (newValue) {
                    setState(() {
                      value = newValue;
                    });
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget headerContainer({@required String gretting}) {
    assert(gretting != null, 'Un saludo tiene que ser un texto no nulo');
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
            'Martes 13, mayo (dia 55 cuarentena)',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 26.0,
            ),
          ),
          SizedBox(height: 84),
          MyText(gretting),
        ],
      ),
    );
  }
}

class HeaderContainer extends StatefulWidget {
  const HeaderContainer({this.gretting});
  //: assert(gretting != null, 'Un saludo tiene que ser un texto no nulo');

  final String gretting;

  @override
  _HeaderContainerState createState() => _HeaderContainerState();
}

class _HeaderContainerState extends State<HeaderContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      padding: const EdgeInsets.symmetric(horizontal: 10.0).copyWith(
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
          SizedBox(height: 84),
          MyText(widget.gretting),
        ],
      ),
    );
  }
}

class MyText extends StatelessWidget {
  MyText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 26.0,
      ),
    );
  }
}
