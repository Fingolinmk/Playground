import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';

import '../../logic/localstate.dart';
import '../../logic/mqtt_button_message.dart';
import '../locale.dart';

class AddCardForm extends StatefulWidget {
  const AddCardForm({Key? key}) : super(key: key);

  @override
  AddCardFormState createState() {
    return AddCardFormState();
  }
}

class AddCardFormState extends State<AddCardForm> {
  String topic = "";
  String payload = "";
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
              labelText: Strings.payload(),
            ),
            onChanged: (value) {
              payload = value;
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
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  localstate.addButtonMessage(MqttButtonMessage(
                      topic: topic, payload: payload, name: name));
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
