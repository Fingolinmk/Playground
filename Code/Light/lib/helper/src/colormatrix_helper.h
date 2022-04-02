#include "rgb_lighthelper.h"

/// Set every value of the color matrix to a random value
void random_matrix(uint32_t colorMatrix1[], size_t len)
{
    for (size_t i = 0; i < len; i++)
    {
        colorMatrix1[i] = rand(); // this is not really nice, since it overflows, which works, but it is probably not "random"
    }
}