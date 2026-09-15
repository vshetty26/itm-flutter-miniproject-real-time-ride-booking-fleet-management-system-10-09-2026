import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_screen.dart';
import 'home_screen.dart';
import 'theme.dart';

void main() => runApp(const RideFlowApp());

class RideFlowApp extends StatefulWidget {
  const RideFlowApp({super.key});

  @override
  State<RideFlowApp> createState() => _RideFlowAppState();
}

class _RideFlowAppState extends State<RideFlowApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  bool _isLoggedIn = false;
  bool _isDriver = false;
  bool _isReady = false;

  @override
  void initState() {
    super.initState();
    _restoreSession();
  }

  Future<void> _signOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    if (!mounted) return;

    setState(() {
      _isLoggedIn = false;
      _isDriver = false;
      _isReady = true;
    });
  }

  Future<void> _restoreSession() async {
    final prefs = await SharedPreferences.getInstance();
    final loggedIn = prefs.getBool('rideflow_user_logged_in') ?? false;
    final driver = prefs.getBool('rideflow_user_is_driver') ?? false;

    if (!mounted) return;

    setState(() {
      _isLoggedIn = loggedIn;
      _isDriver = driver;
      _isReady = true;
    });
  }

  Future<void> _openHome(bool isDriver) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('rideflow_user_logged_in', true);
    await prefs.setBool('rideflow_user_is_driver', isDriver);

    if (!mounted) return;

    setState(() {
      _isLoggedIn = true;
      _isDriver = isDriver;
    });

    _navigatorKey.currentState!.pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen(isDriver: isDriver)));
  }

  @override
  Widget build(BuildContext context) {
    if (!_isReady) {
      return MaterialApp(
        title: 'RideFlow',
        debugShowCheckedModeBanner: false,
        theme: buildRideFlowTheme(),
        home: const Scaffold(body: Center(child: CircularProgressIndicator())),
      );
    }

    return MaterialApp(
      title: 'RideFlow',
      debugShowCheckedModeBanner: false,
      theme: buildRideFlowTheme(),
      navigatorKey: _navigatorKey,
      home: _isLoggedIn
          ? HomeScreen(isDriver: _isDriver, onSignOut: _signOut)
          : AuthScreen(onAuthenticated: _openHome),
    );
  }
}
