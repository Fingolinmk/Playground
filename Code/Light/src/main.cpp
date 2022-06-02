#include <Arduino.h>
#include <Adafruit_NeoPixel.h>

#include <WiFi.h>
#include <PubSubClient.h>

#define NUMPIXELS 24

#include <helper.hpp>
#include <rgb_lighthelper.hpp>
#include <colormatrix_helper.hpp>

#include <NTPClient.h> //TODO support daylight saving time
#include <WiFiUdp.h>
#include <ArduinoJson.h>
#include <TimeLib.h>

#include <secrets.h>

#define REGARD_DAYLIGHTSAVING 1

WiFiUDP ntpUDP;
// By default 'pool.ntp.org' is used with 60 seconds update interval and
NTPClient timeClient(ntpUDP, "europe.pool.ntp.org", 3600 * 2, 60000);

WiFiClient espClient;
PubSubClient client(espClient);

#define PIN1 16
#define PIN2 17
#define PIN3 4

#define YELLOW pixels1.Color(255, 110, 0)
#define WHITE pixels1.Color(255, 225, 90)
#define WWHITE pixels1.Color(255, 90, 40)
#define OFF pixels1.Color(0, 0, 0)

uint8_t R;
uint8_t G;
uint8_t B;

uint32_t colorMatrix1[NUMPIXELS];
uint32_t colorMatrix2[NUMPIXELS];
uint32_t colorMatrix3[NUMPIXELS];

uint32_t colorMatrix1_new[NUMPIXELS];
uint32_t colorMatrix2_new[NUMPIXELS];
uint32_t colorMatrix3_new[NUMPIXELS];

Adafruit_NeoPixel pixels1 = Adafruit_NeoPixel(NUMPIXELS, PIN1, NEO_GRB + NEO_KHZ800);
Adafruit_NeoPixel pixels2 = Adafruit_NeoPixel(NUMPIXELS, PIN2, NEO_GRB + NEO_KHZ800);
Adafruit_NeoPixel pixels3 = Adafruit_NeoPixel(NUMPIXELS, PIN3, NEO_GRB + NEO_KHZ800);

bool Alarm = false;
int Alarm_hours = 0;
int Alarm_minutes = 0;

int fadeoutTime = 1 * 60 * 1000; // 1 min default

void show()
{
  for (size_t i = 0; i < NUMPIXELS; i++)
  {
    pixels1.setPixelColor(i, colorMatrix1[i]);
    pixels2.setPixelColor(i, colorMatrix2[i]);
    pixels3.setPixelColor(i, colorMatrix3[i]);
  }
  pixels1.show();
  pixels2.show();
  pixels3.show();
}
void random()
{
  for (size_t i = 0; i < NUMPIXELS; i++)
  {
    colorMatrix1[i] = rand();
    colorMatrix2[i] = rand();
    colorMatrix3[i] = rand();
  }
  show();
}

// fades from colorMatrix1 to colorMatrix1_new dT gives the delay in between fades
void fadeIn(int dT)
{
  bool FadeOn = true;
  long ct = 0;
  while (FadeOn)
  {
    FadeOn = false;
    Serial.print("Fade step: ");
    Serial.println(ct);
    ct++;

    for (size_t i = 0; i < NUMPIXELS; i++)
    {
      // Matrix 1:
      rgb oldColor1(colorMatrix1[i]);
      rgb newColor1(colorMatrix1_new[i]);

      rgb oldColor2(colorMatrix2[i]);
      rgb newColor2(colorMatrix2_new[i]);

      rgb oldColor3(colorMatrix3[i]);
      rgb newColor3(colorMatrix3_new[i]);

      oldColor1.moveToRGB_object(newColor1);
      oldColor2.moveToRGB_object(newColor2);
      oldColor3.moveToRGB_object(newColor3);

      colorMatrix1[i] = oldColor1.get_packedRGB();
      colorMatrix2[i] = oldColor2.get_packedRGB();
      colorMatrix3[i] = oldColor3.get_packedRGB();
      show();
      delay(dT / NUMPIXELS);
      client.loop();
    }

    for (size_t i = 0; i < NUMPIXELS; i++) // if we are not at the end matrix FadeOn
    {
      if (colorMatrix1[i] != colorMatrix1_new[i])
      {
        FadeOn = true;
        break;
      }

      if (colorMatrix2[i] != colorMatrix2_new[i])
      {
        FadeOn = true;
        break;
      }
      if (colorMatrix3[i] != colorMatrix3_new[i])
      {
        FadeOn = true;
        break;
      }
    }
  }
}
// set RGB color to all LEDs
void setColor(uint8_t r, uint8_t g, uint8_t b)
{
  setColor(colorMatrix1, NUMPIXELS, r, g, b);
  setColor(colorMatrix2, NUMPIXELS, r, g, b);
  setColor(colorMatrix3, NUMPIXELS, r, g, b);
  show();
}
void toggle()
{
  toggle_RGB(colorMatrix1, NUMPIXELS, R, G, B);
  toggle_RGB(colorMatrix2, NUMPIXELS, R, G, B);
  toggle_RGB(colorMatrix3, NUMPIXELS, R, G, B);

  show();
}
void fadeOutNew()
{
  Serial.println("FadeOut");
  int del_t = 0;
  // Calculate how many steps it will take to go to zero for each matrix
  long steps = getStepsToZero(colorMatrix1, NUMPIXELS);
  steps += getStepsToZero(colorMatrix2, NUMPIXELS);
  steps += getStepsToZero(colorMatrix3, NUMPIXELS);

  steps /= 3; // we will do all three panels at once

  Serial.print("I think I will need ");
  Serial.print(steps);
  Serial.println("steps to do it");

  if (steps == 0)
  {
    Serial.print("Is already off");
    return;
  }
  if (steps == 0)
  {
    steps = 1; // protect from div/0
  }

  del_t = fadeoutTime / steps;
  Serial.print("Starting fadeout at: ");
  Serial.print("Fade out time set to: ");
  Serial.print(fadeoutTime / (60 * 1000));
  Serial.println(" min");
  int steps4Real = 0;
  for (int i = NUMPIXELS - 1; i >= 0; i--)
  {
    rgb currentVal[] = {
        rgb(colorMatrix1[i]),
        rgb(colorMatrix2[i]),
        rgb(colorMatrix3[i])};

    while (colorMatrix1[i] > 0 || colorMatrix2[i] > 0 || colorMatrix3[i] > 0)
    {

      colorMatrix1[i] = currentVal[0].reduceEvenly();
      colorMatrix2[i] = currentVal[1].reduceEvenly();
      colorMatrix3[i] = currentVal[2].reduceEvenly();
      steps4Real++;
      show();
      delay(del_t);
      client.loop();
    }
  }

  Serial.print("Ending fadeout at: ");
}

void sparkel(uint8_t str_r, uint8_t str_g, uint8_t str_b)
{
  unsigned long t_start = millis();
  while (millis() < t_start + fadeoutTime)
  {
    for (size_t i = 0; i < NUMPIXELS; i++)
    {
      if (random(0, 10) > 5)
      {
        rgb color = rgb(gaussian(R, str_r), gaussian(G, str_g), gaussian(B, str_b));
        color.checkRGBVals(false);
        colorMatrix1_new[i] = color.get_packedRGB();
      }
      else
        colorMatrix1_new[i] = rgb(colorMatrix1[i]).add_color(rgb(gaussian(R, str_r), gaussian(G, str_g), gaussian(B, str_b)));

      if (random(0, 10) > 5)
      {
        rgb color = rgb(gaussian(R, str_r), gaussian(G, str_g), gaussian(B, str_b));
        color.checkRGBVals(false);
        colorMatrix2_new[i] = color.get_packedRGB();
      }
      else
        colorMatrix2_new[i] = rgb(colorMatrix2[i]).add_color(rgb(gaussian(R, str_r), gaussian(G, str_g), gaussian(B, str_b)));

      if (random(0, 10) > 5)
      {
        rgb color = rgb(gaussian(R, str_r), gaussian(G, str_g), gaussian(B, str_b));
        color.checkRGBVals(false);
        colorMatrix3_new[i] = color.get_packedRGB();
      }
      else
        colorMatrix3_new[i] = rgb(colorMatrix3[i]).add_color(rgb(gaussian(R, str_r), gaussian(G, str_g), gaussian(B, str_b)));

      if (random(0, 100) > 95)
      {
        int delay = max(0.0, gaussian(0, 6));
        fadeIn(delay);
      }
    }
    int delay = gaussian(0, 12) + 1;
    if (delay < 0)
      delay = 0;
    fadeIn(delay);
  }
  Serial.println("no more fire");
}
void callback(char *topic, byte *payload, unsigned int length)
{
  Serial.print("Message arrived [");
  String tpc = topic;
  Serial.print(topic);
  Serial.print("] ");

  String msg = "";

  for (int i = 0; i < length; i++)
  {
    msg += ((char)payload[i]);
  }
  Serial.println(msg);

  if (tpc == "light/timer")
  {
    fadeoutTime = msg.toInt();
    Serial.print("fadeout now: ");
    Serial.print(fadeoutTime);
    Serial.println("min");
    fadeoutTime *= 60000;
  }
  if (tpc == "light/Alert/Status")
  {
    if (msg == "true")
      Alarm = true;
    else if (msg == "false")
      Alarm = false;

    if (Alarm)
      Serial.println("ALARM AN");
    else
      Serial.println("ALARM AUS");

    Serial.print("MSG:\"");
    Serial.print(msg);
    Serial.println("\"");
  }
  if (tpc == "light/Alert/Time")
  {

    StaticJsonDocument<256> doc;
    deserializeJson(doc, payload, length);
    Alarm_hours = doc["hour"];
    Alarm_minutes = doc["minute"];
    Serial.print("Alarm set to: ");
    Serial.print(Alarm_hours);
    Serial.print(" : ");
    Serial.println(Alarm_minutes);
  }
  if (msg == "toggle")
  {
    Serial.println("Toggle Colors");
    toggle();
  }
  if (msg == "random")
  {
    Serial.println("Random Color");
    random();
  }
  if (msg == "Sparkel")
  {
    Serial.println("sparkel");
    sparkel(30, 10, 5);
  }
  if (msg == "Sleep")
  {
    Serial.println("Sleepytime");
    // fadeOut();
    fadeOutNew();
  }
  if (msg.indexOf("rgb") >= 0)
  {
    Serial.println("RGB");

    int idx1 = msg.indexOf("(");
    int idx2 = msg.indexOf(")");
    String substr = msg.substring(idx1 + 1, idx2);

    idx1 = substr.indexOf(',');           // first comma
    idx2 = substr.indexOf(',', idx1 + 1); // second comma

    String red = substr.substring(0, idx1);
    String green = substr.substring(idx1 + 1);

    idx2 = green.indexOf(',');
    String blue = green.substring(idx2 + 2);

    R = red.toInt();
    G = green.toInt();
    B = blue.toInt();

    Serial.print("red: ");
    Serial.print(R);
    Serial.print(" green: ");
    Serial.print(G);
    Serial.print(" blue: ");
    Serial.println(B);

    setColor(R, G, B);
  }
}

void setup()
{
  Serial.begin(9600);

  pixels1.begin();
  pixels2.begin();
  pixels3.begin();

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

  timeClient.begin();

  client.setServer(mqtt_server, 1883);
  client.setCallback(callback);

  while (!timeClient.update())
  {
    timeClient.forceUpdate();
  }
#ifdef REGARD_DAYLIGHTSAVING
  // Sie endet jeweils am letzten Sonntag im Oktober um 3:00 Uhr MESZ,
  //  indem die Stundenzählung um eine Stunde von 3:00 Uhr auf 2:00 Uhr zurückgestellt wird.
  if ((month(timeClient.getEpochTime()) > 10 || month(timeClient.getEpochTime()) < 3))
  { // Approximation fo Wintertime TODO FIX FOR REAL
    Serial.print("Wintertime");
    timeClient.setTimeOffset(3600);
  }
#endif
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
      client.subscribe("light/#");
    }
    else
    {
      Serial.print("failed, rc=");
      Serial.print(client.state());
      Serial.println(" try again in 5 seconds");
      delay(5000);
    }
  }
  Serial.println();
  Serial.println("WiFi connected");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());
}

int lastMin = 0;
void loop()
{

  if (!client.connected())
  {
    reconnect();
  }

  if (timeClient.getMinutes() > lastMin)
  {
    Serial.println(timeClient.getFormattedTime());
    lastMin = timeClient.getMinutes();
  }

  if (Alarm)
  {
    if (timeClient.getHours() == Alarm_hours && timeClient.getMinutes() == Alarm_minutes)
    {
      int del = NUMPIXELS * 0;
      setColor(1, 0, 0);
      delay(del);

      setNewColorMatricesToRGB(colorMatrix1_new, 20, 1, 0, NUMPIXELS);
      setNewColorMatricesToRGB(colorMatrix2_new, 20, 1, 0, NUMPIXELS);
      setNewColorMatricesToRGB(colorMatrix3_new, 20, 1, 0, NUMPIXELS);
      fadeIn(del);
      Serial.println(timeClient.getFormattedTime());

      setNewColorMatricesToRGB(colorMatrix1_new, 20, 10, 5, NUMPIXELS);
      setNewColorMatricesToRGB(colorMatrix2_new, 20, 10, 5, NUMPIXELS);
      setNewColorMatricesToRGB(colorMatrix3_new, 20, 10, 5, NUMPIXELS);
      fadeIn(del);
      Serial.println(timeClient.getFormattedTime());

      setNewColorMatricesToRGB(colorMatrix1_new, 100, 15, 7, NUMPIXELS);
      setNewColorMatricesToRGB(colorMatrix2_new, 100, 15, 7, NUMPIXELS);
      setNewColorMatricesToRGB(colorMatrix3_new, 100, 15, 7, NUMPIXELS);
      fadeIn(del);
      Serial.println(timeClient.getFormattedTime());

      setNewColorMatricesToRGB(colorMatrix1_new, 150, 16, 8, NUMPIXELS);
      setNewColorMatricesToRGB(colorMatrix2_new, 150, 16, 8, NUMPIXELS);
      setNewColorMatricesToRGB(colorMatrix3_new, 150, 16, 8, NUMPIXELS);
      fadeIn(del);
      Serial.println(timeClient.getFormattedTime());

      setNewColorMatricesToRGB(colorMatrix1_new, 200, 20, 10, NUMPIXELS);
      setNewColorMatricesToRGB(colorMatrix2_new, 200, 20, 10, NUMPIXELS);
      setNewColorMatricesToRGB(colorMatrix3_new, 200, 20, 10, NUMPIXELS);
      fadeIn(del);
      Serial.println(timeClient.getFormattedTime());

      setNewColorMatricesToRGB(colorMatrix1_new, 255, 100, 15, NUMPIXELS);
      setNewColorMatricesToRGB(colorMatrix2_new, 255, 100, 15, NUMPIXELS);
      setNewColorMatricesToRGB(colorMatrix3_new, 255, 100, 15, NUMPIXELS);
      fadeIn(del);
      Serial.println(timeClient.getFormattedTime());

      setNewColorMatricesToRGB(colorMatrix1_new, 255, 150, 20, NUMPIXELS);
      setNewColorMatricesToRGB(colorMatrix2_new, 255, 150, 20, NUMPIXELS);
      setNewColorMatricesToRGB(colorMatrix3_new, 255, 150, 20, NUMPIXELS);
      fadeIn(del);
      Serial.println(timeClient.getFormattedTime());

      Serial.println("Alarm finished,idling");
      while (timeClient.getHours() == Alarm_hours && timeClient.getMinutes() == Alarm_minutes)
      {
        delay(5);
        client.loop();
        timeClient.update();
      }

      Serial.println("Idling finished");
    }
  }

  client.loop();
  timeClient.update();
}