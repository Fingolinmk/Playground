import 'package:flutter/material.dart';
import 'package:mqtt_interface/logic/mqtt_toggle_message.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';

import '../../logic/localstate.dart';
import '../../logic/mqtt_button_message.dart';
import '../locale.dart';

class AddToggleForm extends StatefulWidget {
  const AddToggleForm({Key? key}) : super(key: key);

  @override
  AddToggleFormState createState() {
    return AddToggleFormState();
  }
}

class AddToggleFormState extends State<AddToggleForm> {
  String topic = "";
  String msg_on = "";
  String msg_off = "";
  String name = "";
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
              labelText: Strings.enterAName(),
            ),
            onChanged: (value) {
              name = value;
            },
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              border: const UnderlineInputBorder(),
              labelText: Strings.payloadOn(),
            ),
            onChanged: (value) {
              msg_on = value;
            },
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              border: const UnderlineInputBorder(),
              labelText: Strings.payloadOff(),
            ),
            onChanged: (value) {
              msg_off = value;
            },
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              border: const UnderlineInputBorder(),
              labelText: Strings.topic(),
            ),
            onChanged: (value) {
              topic = value;
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
                  localstate.addToggleMessage(MqttToggleMessage(
                      topic: topic,
                      onMsg: msg_on,
                      offMsg: msg_off,
                      name: name));
                  localstate.save();

                  Routemaster.of(context).push("/");
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
