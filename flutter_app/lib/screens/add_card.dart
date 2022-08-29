import 'package:flutter/material.dart';
import 'package:mqtt_interface/helpers/ui/rgb_form.dart';
import 'package:mqtt_interface/helpers/ui/slider_form.dart';
import 'package:mqtt_interface/helpers/ui/toggle_form.dart';

import '../helpers/locale.dart';
import '../helpers/ui/button_form.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final items = [
    'Button',
    'RGB Selector',
    'Slider',
    'Toggle Button',
  ];
  var selected = 'Button';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(Strings.addCardType()),
                const SizedBox(
                  width: 20,
                ),
                DropdownButton<String>(
                  value: selected,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      selected = newValue!;
                    });
                  },
                  items: items.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            if (selected == "Button") const AddCardForm(),
            if (selected == "RGB Selector") const AddRGBForm(),
            if (selected == "Toggle Button") const AddToggleForm(),
            if (selected == "Slider") const AddSliderForm(),
          ],
        ),
      ),
    );
  }
}
