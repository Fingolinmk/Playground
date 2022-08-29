import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';

import '../../logic/localstate.dart';
import '../../logic/mqtt_rgb_message.dart';
import '../locale.dart';

class AddRGBForm extends StatefulWidget {
  const AddRGBForm({Key? key}) : super(key: key);

  @override
  AddRGBFormState createState() {
    return AddRGBFormState();
  }
}

class AddRGBFormState extends State<AddRGBForm> {
  String topic = "";
  List<String> types = ["simple", "json"];
  String type = "simple";
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
                return Strings.pleaseEnterText();
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
                return Strings.pleaseEnterText();
              }

              return null;
            },
          ),
          Row(
            children: [
              Text(Strings.howToSendRGBVal()),
              const SizedBox(width: 5),
              DropdownButton<String>(
                value: type,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    type = newValue!;
                  });
                },
                items: types.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
          if (type == "simple") Text("rgb(Red_val, Green_val, Blue_val)"),
          if (type == "json")
            Text("{\"R\": Red_val,\"G\": Green_val,\"B\": Blue_val}"),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  localstate.addRGBMessage(
                      MqttRGBMessage(topic: topic, name: name, type: type));
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
