#define NUMPIXELS 24

#include <Arduino.h>
#include <unity.h>
#include "helper.h"
#include "rgb_lighthelper.h"
void test_fadeTo()
{
    uint32_t current_colorMatrix[NUMPIXELS];
    uint32_t stop_colorMatrix[NUMPIXELS];
    for (size_t i = 0; i < NUMPIXELS; i++)
    {
        current_colorMatrix[i] = 10;
    }
}
void test_getStepToMatrix()
{
    uint32_t current_colorMatrix[NUMPIXELS];
    uint32_t stop_colorMatrix[NUMPIXELS];
    int delta_colorMatrix[NUMPIXELS];
    for (size_t i = 0; i < NUMPIXELS; i++)
    {
        current_colorMatrix[i] = 0;
        stop_colorMatrix[i] = 10;
    }
    getStepToMatrix(current_colorMatrix, stop_colorMatrix, delta_colorMatrix, NUMPIXELS, 10);
    Serial.println("outputting delta Matrix (packed RGB) :");
    for (size_t i = 0; i < NUMPIXELS; i++)
    {
        // Serial.print(i); Serial.print(": ");
        // Serial.println(delta_colorMatrix[i]);
        TEST_ASSERT(delta_colorMatrix[i] == 1);
    }
}
void testRGB()
{
    
}
void testBudget()
{
    long red_budget;
    long green_budget;
    long blue_budget;
    long budget;

    uint32_t colorMatrix1[NUMPIXELS];
    for (size_t i = 0; i < NUMPIXELS; i++)
    {
        colorMatrix1[i] = 10;
    }

    // blue_budget should be 10*NUMPIXELS
    CalculateColorBudget(colorMatrix1, NUMPIXELS);

    Serial.println("TEST");
    Serial.print("Budget: ");
    Serial.println(red_budget);
    TEST_ASSERT(blue_budget == (10 * NUMPIXELS))
}

void testRGBClass()
{
    uint8_t r = random(0, 255);
    uint8_t g = random(0, 255);
    uint8_t b = random(0, 255);
    Serial.print("R: ");
    Serial.print(r);
    Serial.print(" G: ");
    Serial.print(g);
    Serial.print(" B: ");
    Serial.println(b);
    uint32_t color = ((uint32_t)r << 16) | ((uint32_t)g << 8) | b;

    rgb colorObj = rgb(color);
    colorObj.printMe();
    TEST_ASSERT(colorObj.r == r);
    TEST_ASSERT(colorObj.g == g);
    TEST_ASSERT(colorObj.b == b);
}

void setup()
{
    // NOTE!!! Wait for >2 secs
    // if board doesn't support software reset via Serial.DTR/RTS
    delay(2000);
    Serial.begin(9600);
    UNITY_BEGIN(); // IMPORTANT LINE!

    RUN_TEST(testRGBClass);
    RUN_TEST(testBudget);
}

void loop()
{

    UNITY_END(); // stop unit testing
}