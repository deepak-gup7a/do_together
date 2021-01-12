import 'package:flutter/material.dart';

class EmptyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100.0,
        width: 200.0,
        color: Colors.transparent,
        child: new Container(
            decoration: new BoxDecoration(
                color: Colors.blue,
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(40.0),
                  topRight: const Radius.circular(40.0),
                  bottomRight: const Radius.circular(40.0),
                  bottomLeft: const Radius.circular(40.0),

                )
            ),
            child: new Center(
              child: new Text(
                'TASK',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  color: Colors.white.withOpacity(1.0),
//height: 2.0,
                  fontSize: 40.0,
                ),
//style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.2),
              ),
            )
        ),
      ),
    );
  }
}
