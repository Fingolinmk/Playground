import 'package:flutter/material.dart';
import 'package:mqtt_interface/logic/localstate.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';

import '../helpers/locale.dart';
import '../helpers/typo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localstate = Provider.of<ComponentLocalState>(context)..load();
    //needs futurebuilder localstate.load();
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder<int>(
            future: localstate.connect(),
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data == 0) {
                  return const Text("Home, connected");
                } else {
                  return const Text("Home, connection failed");
                }
              } else {
                return const Text("Home, connecting");
              }
            }),
        actions: [
          IconButton(
              onPressed: () {
                Routemaster.of(context).push('/edit');
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: FutureBuilder<bool>(
          future: localstate.load(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data == true) {
                return Scaffold(
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Column(
                        children: [
                          Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: localstate.button_msgs
                                  .map((e) => e.getWidget(localstate))
                                  .toList()),
                          Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: localstate.rgb_msgs
                                  .map((e) => e.getWidget(localstate))
                                  .toList()),
                          Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: localstate.toggle_msgs
                                  .map((e) => e.getWidget(localstate))
                                  .toList()),
                          Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: localstate.slider_string_msgs
                                  .map((e) => e.getWidget(localstate))
                                  .toList()),
                        ],
                      ),
                    ),
                  ),
                  floatingActionButton: FloatingActionButton(
                    onPressed: () {
                      Routemaster.of(context).push("/add");
                    },
                    child: const Icon(Icons.add),
                  ),
                );
              } else {
                return Scaffold(
                  body: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.dashboard,
                          color: Colors.grey,
                          size: 200.0,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Text(
                            Strings.empty(),
                            style: Typo.H1(),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                          child: Text(
                            Strings.createCommand(),
                            style: Typo.description(),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Stack(
                            children: <Widget>[
                              Positioned.fill(
                                child: Container(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: <Color>[
                                        Color(0xFF0D47A1),
                                        Color(0xFF1976D2),
                                        Color(0xFF0D47A1),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.all(16.0),
                                  primary: Color.fromARGB(255, 255, 193, 193),
                                  textStyle: const TextStyle(fontSize: 20),
                                ),
                                onPressed: () {
                                  Routemaster.of(context).push("/add");
                                },
                                child: const Text('Add Widget'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            } else {
              return const Text("Loading?");
            }
          }),
    );
  }
}
