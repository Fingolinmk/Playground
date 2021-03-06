#define NUMPIXELS 24

#include <Arduino.h>
#include <unity.h>
#include "helper.hpp"
#include "rgb_lighthelper.hpp"

void test_fadeTo()
{
    uint32_t current_colorMatrix[NUMPIXELS];
    uint32_t stop_colorMatrix[NUMPIXELS];
    for (size_t i = 0; i < NUMPIXELS; i++)
    {
        current_colorMatrix[i] = 10;
    }
}

void setup()
{
    // NOTE!!! Wait for >2 secs
    // if board doesn't support software reset via Serial.DTR/RTS
    delay(2000);
    Serial.begin(9600);
    UNITY_BEGIN(); // IMPORTANT LINE!
}

void loop()
{

    UNITY_END(); // stop unit testing
}