import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitCircle(
          color: Colors.greenAccent,
          size: 65.0,
          duration: Duration(milliseconds: 1000),
        ),
      ),
    );
  }
}
