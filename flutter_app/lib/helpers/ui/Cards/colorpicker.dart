import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../logic/localstate.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({
    required this.callback,
    required this.name,
    required this.topic,
    required Key? key,
  }) : super(key: key);

  final String name;
  final String topic;
  final void Function(int, int, int) callback;

  @override
  ColorPickerState createState() {
    return ColorPickerState();
  }
}

class ColorPickerState extends State<ColorPicker> {
  int r = 0;
  int g = 0;
  int b = 0;
  bool edit = false;

  @override
  Widget build(BuildContext context) {
    final localstate = Provider.of<ComponentLocalState>(context);

    return InkWell(
      onLongPress: () {
        setState(() {
          edit = !edit;
        });
      },
      child: Card(
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Column(children: [
            Column(
              children: [
                Container(
                  color: Colors.black12,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(widget.name),
                        const Spacer(),
                        if (edit)
                          IconButton(
                            icon: const Icon(Icons.delete),
                            color: Colors.black,
                            onPressed: () {
                              localstate.removeRGB(widget.name, widget.topic);
                            },
                          ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Row(
                    children: [
                      const Text("R"),
                      Expanded(
                        child: Slider(
                          thumbColor: Colors.red,
                          activeColor: Colors.redAccent,
                          min: 0,
                          value: r.toDouble(),
                          max: 255,
                          divisions: 255,
                          label: r.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              r = value.toInt();
                              widget.callback(r, g, b);
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text("G"),
                      Expanded(
                        child: Slider(
                            thumbColor: Colors.green,
                            activeColor: Colors.greenAccent,
                            value: g.toDouble(),
                            max: 255,
                            divisions: 255,
                            label: g.round().toString(),
                            onChanged: (double value) {
                              setState(() {
                                g = value.toInt();
                                widget.callback(r, g, b);
                              });
                            }),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Row(
                    children: [
                      const Text("B"),
                      Expanded(
                        child: Slider(
                            thumbColor: Colors.blue,
                            activeColor: Colors.blueAccent,
                            value: b.toDouble(),
                            max: 255,
                            divisions: 255,
                            label: b.round().toString(),
                            onChanged: (double value) {
                              setState(() {
                                b = value.toInt();
                                widget.callback(r, g, b);
                              });
                            }),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(r, g, b, 1),
                border: Border.all(
                  color: Color.fromRGBO(r, g, b, 1),
                ),
                //borderRadius: const BorderRadius.all(Radius.circular(5))
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "R :$r G: $g B: $b",
                      style: TextStyle(
                        color:
                            Color.fromRGBO(r, g, b, 1).computeLuminance() > 0.5
                                ? Colors.black
                                : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
