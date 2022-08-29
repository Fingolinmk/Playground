import 'package:flutter/material.dart';
import 'package:mqtt_interface/helpers/locale.dart';
import 'package:mqtt_interface/logic/localstate.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';

class EditConnectionScreen extends StatelessWidget {
  const EditConnectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localstate = Provider.of<ComponentLocalState>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Connection'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const EditConnectionForm(),
              Text("${Strings.address()} : ${localstate.address}"),
              Text("${Strings.port()} : ${localstate.port}"),
              Text("${Strings.deviceName()} : ${localstate.myName}"),
              Row(
                children: [
                  Text("Connection Status:"),
                  if (localstate.isAlive())
                    const Icon(
                      Icons.link,
                      color: Colors.green,
                    ),
                  if (!localstate.isAlive())
                    const Icon(Icons.link_off, color: Colors.red),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: localstate.isAlive()
                        ? null
                        : () {
                            print("TEST TODO");
                            localstate.connect();
                          },
                    child: const Icon(Icons.sync),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Create a Form widget.
class EditConnectionForm extends StatefulWidget {
  const EditConnectionForm({Key? key}) : super(key: key);

  @override
  EditConnectionFormState createState() {
    return EditConnectionFormState();
  }
}

class EditConnectionFormState extends State<EditConnectionForm> {
  String address = "";
  String myName = "";
  int port = 0;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final localstate = Provider.of<ComponentLocalState>(context);

    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: InputDecoration(
              border: const UnderlineInputBorder(),
              labelText: Strings.address(),
            ),
            onChanged: (value) {
              address = value;
            },
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a host-adress';
              }
              return null;
            },
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: const UnderlineInputBorder(),
              labelText: Strings.port(),
            ),
            onChanged: (value) {
              if (int.tryParse(value) != null) port = int.parse(value);
            },
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  int.tryParse(value) == null) {
                return 'Please enter a number';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              border: const UnderlineInputBorder(),
              labelText: Strings.deviceName(),
            ),
            onChanged: (value) {
              myName = value;
            },
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }

              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  localstate.setAddress(address);
                  localstate.setMyName(myName);
                  localstate.setPort(port);
                  localstate.save();
                  //    Routemaster.of(context).push("/");
                }
              },
              child: Text(Strings.save()),
            ),
          ),
        ],
      ),
    );
  }
}
