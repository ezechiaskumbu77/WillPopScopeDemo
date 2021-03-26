/// Flutter code sample for WillPopScope

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool shouldPop = true;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return shouldPop;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Flutter WillPopScope demo"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                child: Text('Push'),
                //onPressed Methode, First occurance
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return MyStatefulWidget();
                      },
                    ),
                  );
                },
              ),
              OutlinedButton(
                child: Text('shouldPop: $shouldPop'),
                 //onPressed Methode, Second occurance
                onPressed: () {
                  setState(
                    () {
                      shouldPop = !shouldPop;
                    },
                  );
                },
              ),
              Text("Push to a new screen, then tap on shouldPop "
                  "button to toggle its value. Press the back "
                  "button in the appBar to check its behaviour "
                  "for different values of shouldPop"),
            ],
          ),
        ),
      ),
    );
  }
}
