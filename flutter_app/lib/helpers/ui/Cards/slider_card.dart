import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../logic/localstate.dart';
import '../../string_helper/add_word_at.dart';

class SliderCard extends StatefulWidget {
  const SliderCard({
    required this.callback,
    required this.name,
    required this.topic,
    required this.minimum,
    required this.maximum,
    required this.msg,
    required this.position,
    required Key? key,
  }) : super(key: key);

  final String name;
  final String topic;
  final int minimum;
  final int maximum;
  final int position;
  final String msg;
  final void Function(int, int) callback;

  @override
  SliderCardState createState() {
    return SliderCardState();
  }
}

class SliderCardState extends State<SliderCard> {
  int value = 0;

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
                      const Text("Value"),
                      Expanded(
                        child: Slider(
                          thumbColor: Colors.red,
                          activeColor: Colors.redAccent,
                          min: 0,
                          value: value.toDouble(),
                          max: 255,
                          divisions: 255,
                          label: value.toString(),
                          onChanged: (double val) {
                            setState(() {
                              value = val.toInt();
                              widget.callback(widget.position, value);
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                border: Border.all(
                  color: Colors.black,
                ),
                //borderRadius: const BorderRadius.all(Radius.circular(5))
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Value :$value",
                    ),
                    Text(addNumberAt(widget.msg, widget.position, value)),
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
