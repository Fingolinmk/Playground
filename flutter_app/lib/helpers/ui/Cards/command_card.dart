import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../logic/localstate.dart';

class CommandCard extends StatefulWidget {
  const CommandCard(
      {required this.command,
      required this.topic,
      required this.callback,
      required this.name,
      required Key? key})
      : super(key: key);

  final String name;
  final String command;
  final String topic;
  final VoidCallback callback;

  @override
  State<CommandCard> createState() => _CommandCardState();
}

class _CommandCardState extends State<CommandCard> {
  bool edit = false;
  @override
  Widget build(BuildContext context) {
    final localstate = Provider.of<ComponentLocalState>(context);

    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              onTap: widget.callback,
              onLongPress: () {
                print("longPress");
                setState(() {
                  edit = !edit;
                });
              },
              title: Row(
                children: [
                  Text(widget.name),
                  const Spacer(),
                  if (edit)
                    IconButton(
                      icon: const Icon(Icons.delete),
                      color: Colors.black,
                      onPressed: () {
                        print("IconButton");
                        localstate.removeButtonMsg(
                            widget.name, widget.topic, widget.command);
                      },
                    ),
                ],
              ),
              subtitle: Text("${widget.topic} : ${widget.name}"),
            )
          ],
        ),
      ),
    );
  }
}
