import 'package:flutter/material.dart';
import 'package:mqtt_interface/screens/add_card.dart';
import 'package:mqtt_interface/screens/edit_connection.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';

import 'logic/localstate.dart';
import 'screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routes = RouteMap(routes: {
    '/': (_) => const MaterialPage(child: HomeScreen()),
    '/add': (_) => const MaterialPage(child: AddScreen()),
    '/edit': (_) => const MaterialPage(child: EditConnectionScreen()),
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ComponentLocalState()..load(),
      child: MaterialApp.router(
        theme: ThemeData(),
        title: 'MQTT Interface',
        debugShowCheckedModeBanner: false,
        routerDelegate: RoutemasterDelegate(routesBuilder: (context) => routes),
        routeInformationParser: const RoutemasterParser(),
      ),
    );
  }
}
