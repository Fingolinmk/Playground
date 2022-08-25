#include "Arduino.h"
#include <WiFi.h>
#include <PubSubClient.h>
//buttons
const int SW1 = 16; //(c)
const int SW2 = 17; //(c)
const int SW3 = 26; //(c)
const int SW4 = 18; //(c)
const int SW5 = 15; // (c)
const int SW6 = 14; //(c)
const int SW7 = 4;  //(c)
const int SW8 = 5;  //(c)
const int SW9 = 13; // (C)

const int rotB = 27; // (C)
const int rotA = 33; // (C)

#define DEBOUNCE_T 250

#include <secrets.h>

WiFiClient espClient;
PubSubClient client(espClient);

void callback(char *topic, byte *message, unsigned int length)
{
  Serial.print("Message arrived on topic: ");
  Serial.print(topic);
  Serial.print(". Message: ");
  String messageTemp;

  for (int i = 0; i < length; i++)
  {
    Serial.print((char)message[i]);
    messageTemp += (char)message[i];
  }
  Serial.println();

  // Feel free to add more if statements to control more GPIOs with MQTT

  // If a message is received on the topic esp32/output, you check if the message is either "on" or "off".
  // Changes the output state according to the message
  if (String(topic) == "esp32/output")
  {
    ; //sth
  }
}
void sendPinHigh(int debounceT)
{
  bool any = false;

  if (digitalRead(SW1) == HIGH)
  {
    client.publish("Remote", "SW1");
    Serial.print("SW 1: on ");
    any = true;
    delay(debounceT);
  }
  if (digitalRead(SW2) == HIGH)
  {
    Serial.print("SW 2: on");
    client.publish("Remote", "SW2");

    any = true;
    delay(debounceT);
  }
  if (digitalRead(SW3) == HIGH)
  {
    Serial.print("SW 3: on ");
    client.publish("Remote", "SW3");

    any = true;
    delay(debounceT);
  }
  if (digitalRead(SW4) == HIGH)
  {
    Serial.print("SW 4: on ");
    client.publish("Remote", "SW4");

    any = true;
    delay(debounceT);
  }
  if (digitalRead(SW5) == HIGH)
  {
    Serial.print("SW 5: on ");
    client.publish("Remote", "SW5");

    any = true;
    delay(debounceT);
  }
  if (digitalRead(SW6) == HIGH)
  {
    Serial.print("SW 6: on ");
    client.publish("Remote", "SW6");

    any = true;
    delay(debounceT);
  }
  if (digitalRead(SW7) == HIGH)
  {
    Serial.print("SW 7: on ");
    client.publish("Remote", "SW7");

    any = true;
    delay(debounceT);
  }
  if (digitalRead(SW8) == HIGH)
  {
    Serial.print("SW 8: on ");
    client.publish("Remote", "SW8");
    any = true;
    delay(debounceT);
  }
  if (digitalRead(SW9) == HIGH)
  {
    Serial.print("SW 9: on ");
    client.publish("Remote", "SW9");
    any = true;
    delay(debounceT);
  }
  if (any)
  {
    Serial.println();
  }
}

int B;
int A;
int nA;
int nB;

void setup()
{
  // put your setup code here, to run once:
  Serial.begin(9600);

  pinMode(SW1, INPUT);
  pinMode(SW2, INPUT);
  pinMode(SW3, INPUT);
  pinMode(SW4, INPUT);
  pinMode(SW5, INPUT);
  pinMode(SW6, INPUT);
  pinMode(SW7, INPUT);
  pinMode(SW8, INPUT);
  pinMode(SW9, INPUT);

  pinMode(rotA, INPUT);
  pinMode(rotB, INPUT);
  A = digitalRead(rotA);
  nA = A;
  B = digitalRead(rotB);
  nB = B;
  //start wifi
  WiFi.begin(ssid, password);
  Serial.print("connecting");
  while (WiFi.status() != WL_CONNECTED)
  {
    delay(500);
    Serial.print(".");
  }
  Serial.println();
  Serial.println("WiFi connected");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());

  client.setServer(mqtt_server, 1883);
  client.setCallback(callback);
}

void reconnect()
{
  // Loop until we're reconnected
  while (!client.connected())
  {
    Serial.print("Attempting MQTT connection...");
    // Attempt to connect
    if (client.connect("ESP8266Client"))
    {
      Serial.println("connected");
      // Subscribe
      client.subscribe("esp32/output");
    }
    else
    {
      Serial.print("failed, rc=");
      Serial.print(client.state());
      Serial.println(" try again in 5 seconds");
      // Wait 5 seconds before retrying
      delay(5000);
    }
  }
}

void loop()
{
  if (!client.connected())
  {
    reconnect();
  }
  sendPinHigh(DEBOUNCE_T);
  client.loop();
  {
    // Read new vals:
    nA = digitalRead(rotA);
    nB = digitalRead(rotB);

    if (nA != A || nB != B)
    {
      if (nA != A)
      {
        Serial.print(" A changed ");
        Serial.print(A);
        Serial.print(" -> ");
        Serial.print(nA);
        A = nA;
      }
      if (nB != B)
      {
        Serial.print(" B Changed ");
        Serial.print(B);
        Serial.print(" -> ");
        Serial.print(nB);
        B = nB;
      }
      Serial.println();
    }
  }
  delay(10);
}