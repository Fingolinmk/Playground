#include <unity.h>
#include <iostream>
#include "rgb_lighthelper.hpp"
#include "colormatrix_helper.hpp"

void testRGBClass()
{
    for (uint8_t r = 0; r < 255; r++)
    {
        for (uint8_t g = 0; g < 255; g++)
        {
            for (uint8_t b = 0; b < 255; b++)
            {

                uint32_t color = ((uint32_t)r << 16) | ((uint32_t)g << 8) | b;

                rgb colorObjFromSummary = rgb(color);
                TEST_ASSERT(colorObjFromSummary.r == r);
                TEST_ASSERT(colorObjFromSummary.g == g);
                TEST_ASSERT(colorObjFromSummary.b == b);

                rgb colorObjFromRGB = rgb(r, g, b);
                TEST_ASSERT(colorObjFromSummary.r == r);
                TEST_ASSERT(colorObjFromSummary.g == g);
                TEST_ASSERT(colorObjFromSummary.b == b);
                TEST_ASSERT(colorObjFromRGB.get_packedRGB() == color);
            }
        }
    }
}

void test_reduceEvenly()
{
    for (size_t r = 0; r < 255; r++)
    {
        for (size_t g = 0; g < 255; g++)
        {
            for (size_t b = 0; b < 255; b++)
            {
                rgb test_color = rgb(r, g, b);
                test_color.reduceEvenly();
                TEST_ASSERT(test_color.r >= 0 && test_color.r < 256);
                TEST_ASSERT(test_color.g >= 0 && test_color.g < 256);
                TEST_ASSERT(test_color.b >= 0 && test_color.b < 256);
                if (r > 0)
                {
                    TEST_ASSERT(test_color.r == r - 1);
                }
                if (g > 0)
                {
                    TEST_ASSERT(test_color.g == g - 1);
                }
                if (b > 0)
                {
                    TEST_ASSERT(test_color.b == b - 1);
                }
            }
        }
    }
}

void test_moveToRGB_object()
{
    uint8_t r = 10;
    uint8_t g = 12;
    uint8_t b = 13;

    rgb test_color1 = rgb(r, g, b);

    test_color1.moveToRGB_object(rgb(255, 255, 255));

    TEST_ASSERT(test_color1.r == r + 1);
    TEST_ASSERT(test_color1.g == g + 1);
    TEST_ASSERT(test_color1.b == b + 1);

    rgb test_color2 = rgb(r, g, b);

    test_color2.moveToRGB_object(rgb(0, 0, 0));

    TEST_ASSERT(test_color2.r == r - 1);
    TEST_ASSERT(test_color2.g == g - 1);
    TEST_ASSERT(test_color2.b == b - 1);
}

void test_moveToRGB()
{
    uint8_t r = 10;
    uint8_t g = 12;
    uint8_t b = 13;

    rgb test_color1 = rgb(r, g, b);

    test_color1.moveToRGB(255, 255, 255);

    TEST_ASSERT(test_color1.r == r + 1);
    TEST_ASSERT(test_color1.g == g + 1);
    TEST_ASSERT(test_color1.b == b + 1);

    rgb test_color2 = rgb(r, g, b);
    test_color2.moveToRGB(0, 0, 0);

    TEST_ASSERT(test_color2.r == r - 1);
    TEST_ASSERT(test_color2.g == g - 1);
    TEST_ASSERT(test_color2.b == b - 1);
}
void test_setColor()
{

    int len = 24;
    int16_t r = 100;
    int16_t g = 200;
    int16_t b = 140;
    uint32_t test_Matrix1[len];

    for (size_t i = 0; i < len; i++)
    {
        test_Matrix1[i] = 0;
    }
    setColor(test_Matrix1, len, r, g, b);
    for (size_t i = 0; i < len; i++)
    {
        TEST_ASSERT(rgb(test_Matrix1[i]).r == r);
        TEST_ASSERT(rgb(test_Matrix1[i]).g == g);
        TEST_ASSERT(rgb(test_Matrix1[i]).b == b);
    }
}
////TODO:
void test_get_packedRBG()
{
    TEST_ASSERT(true == true);
}

void test_add_color()
{
    TEST_ASSERT(true == true);
}

void test_consinstentlyDecreaseBy()
{
    TEST_ASSERT(true == true);
}
void test_checkRGBVals()
{
    TEST_ASSERT(true == true);
}
void test_setRGB()
{
    TEST_ASSERT(true == true);
}

////colormatrix_helper

void test_random_matrix()
{
    int len = 24;
    uint32_t test_Matrix1[len];
    uint32_t test_Matrix2[len];
    bool r_zero = true;
    bool g_zero = true;
    bool b_zero = true;
    bool noChange = true; // indicates that the two matrices, which will be set identically are the same, after one has been "randomized"

    for (size_t i = 0; i < len; i++)
    {
        test_Matrix1[i] = 0;
        test_Matrix2[i] = 0;
    }
    random_matrix(test_Matrix1, len);
    for (size_t i = 0; i < len; i++)
    {
        rgb color = rgb(test_Matrix1[i]);
        if (test_Matrix1[i] != test_Matrix2[i])
            noChange = false;
        TEST_ASSERT(color.r < 255 && color.r >= 0);
        TEST_ASSERT(color.g < 255 && color.b >= 0);
        TEST_ASSERT(color.g < 255 && color.b >= 0);
        if (color.r != 0)
            r_zero = false;
        if (color.g != 0)
            g_zero = false;
        if (color.b != 0)
            b_zero = false;
    }
    // THIS IS THEORETICALLY POSSIBLE; BUT HIGHLY UNLIKELY, -> test with bigger matrices
    TEST_ASSERT(!r_zero);
    TEST_ASSERT(!g_zero);
    TEST_ASSERT(!b_zero);
    TEST_ASSERT(!noChange);
}

int main(int argc, char **argv)
{
    UNITY_BEGIN();
    RUN_TEST(test_reduceEvenly);
    RUN_TEST(testRGBClass);
    RUN_TEST(test_moveToRGB_object);
    RUN_TEST(test_moveToRGB);
    RUN_TEST(test_get_packedRBG);
    RUN_TEST(test_add_color);
    RUN_TEST(test_consinstentlyDecreaseBy);
    RUN_TEST(test_checkRGBVals);
    RUN_TEST(test_setRGB);
    RUN_TEST(test_random_matrix);
    RUN_TEST(test_setColor);
    UNITY_END();

    return 0;
}