import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../logic/localstate.dart';

class ToggleCard extends StatefulWidget {
  const ToggleCard(
      {required this.name,
      required this.topic,
      required this.callback,
      required Key? key})
      : super(key: key);

  final String name;
  final String topic;
  final void Function(bool) callback;

  @override
  State<ToggleCard> createState() => _ToggleCardState();
}

class _ToggleCardState extends State<ToggleCard> {
  bool isActive = false;
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
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                    print("REMOVE TODO");
                                    localstate.removeToggle(
                                        widget.name, widget.topic);
                                  },
                                ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      isActive = true;
                                      widget.callback(isActive);
                                    });
                                  },
                                  child: Container(
                                    color: isActive
                                        ? Theme.of(context)
                                            .toggleableActiveColor
                                        : Theme.of(context).hoverColor,
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Center(child: Text("On")),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      isActive = false;
                                      widget.callback(isActive);
                                    });
                                  },
                                  child: Container(
                                    color: isActive
                                        ? Theme.of(context).hoverColor
                                        : Theme.of(context)
                                            .toggleableActiveColor,
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Center(child: Text("Off")),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("topic: ${widget.topic} "),
                      )
                    ],
                  ),
                ]))));
  }
}
