import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class InternetCheck extends StatefulWidget {
  const InternetCheck({super.key});

  @override
  _InternetCheckState createState() => _InternetCheckState();
}

class _InternetCheckState extends State<InternetCheck> {
  bool isConnected = true;

  @override
  void initState() {
    super.initState();
    checkInternetConnection();
  }

  Future<void> checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        setState(() {
          isConnected = true;
        });
      }
    } on SocketException catch (_) {
      setState(() {
        isConnected = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isConnected
        ? Container() // Return an empty container when connected
        : Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SpinKitFadingCube(
                    color: Colors.red,
                    size: 50.0,
                  ),
                  const Text('No Internet Connection'),
                  ElevatedButton(
                    onPressed: checkInternetConnection,
                    child: const Text('Try Again'),
                  ),
                ],
              ),
            ),
          );
  }
}
