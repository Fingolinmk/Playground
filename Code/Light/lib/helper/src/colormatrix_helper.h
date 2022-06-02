#include <stdint.h>
#include <cstddef>
#include "rgb_lighthelper.h"
#include <stdlib.h>
/// Set every value of the color matrix to a random value
void random_matrix(uint32_t colorMatrix1[], size_t len)
{
    for (size_t i = 0; i < len; i++)
    {
        colorMatrix1[i] = rand(); // this is not really nice, since it overflows, which works, but it is probably not "random"
    }
}

void setColor(uint32_t colorMatrix1[], size_t len, int16_t r, int16_t g, int16_t b)
{
    uint32_t color = rgb(r, g, b).get_packedRGB();
    for (size_t i = 0; i < len; i++)
    {
        colorMatrix1[i] = color;
    }
}

void toggle_RGB(uint32_t colorMatrix[], size_t len, uint8_t R, uint8_t G, uint8_t B)
{
    rgb color = rgb(R, G, B);

    for (size_t i = 0; i < len; i++)
    {
        if (colorMatrix[i] == color.get_packedRGB())
        {
            colorMatrix[i] = rgb(0, 0, 0).get_packedRGB();
        }
        else
            colorMatrix[i] = color.get_packedRGB();
    }
}