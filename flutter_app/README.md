# mqtt_interface
A Flutter Application that can send user defined MQTT commands to a broker

# logic
## Add Widgets
starts on the add_card "page", here you can select between the type of widget you want to add.
Depending on the selection at the bottom of the page different Forms will be loaded (see button_form.dart).
If everything is input correctly on save the information is being saved in the localstate. There is a "motherclass" "MqttBaseMessage" from which all the other Messages are derivated.
The Message itself saves the "normal" kind of stuff like Mqtt-Topic, the payload and also a name, that can be displayed in the UI, but the message also specifies the Widget (getWidget()) that will be used on the Dashboard