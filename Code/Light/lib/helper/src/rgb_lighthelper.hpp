#pragma once

class rgb
{
public:
    bool isDeltaColor = false;
    int16_t r;
    int16_t g;
    int16_t b;
    rgb(int16_t red, int16_t green, int16_t blue)
    {
        if (red < 0 || green < 0 || blue < 0)
        {
            this->isDeltaColor = true;
        }
        this->setRGB(red, green, blue);
    }

    rgb(uint32_t packedRGB)
    {
        uint8_t red = ((packedRGB & (255 << 16)) >> 16);
        uint8_t green = ((packedRGB & (255 << 8)) >> 8);
        uint8_t blue = (packedRGB & 255);
        this->isDeltaColor = false;

        this->setRGB(red, green, blue);
    }
    // reduces all colors >0 by one
    uint32_t reduceEvenly()
    {
        if (this->r > 0)
            this->r--;

        if (this->g > 0)
            this->g--;

        if (this->b > 0)
            this->b--;
        return get_packedRGB();
    }

    void moveToRGB(uint8_t r, uint8_t g, uint8_t b)
    {
        if (this->r < r)
            this->r++;
        if (this->g < g)
            this->g++;
        if (this->b < b)
            this->b++;

        if (this->r > r)
            this->r--;
        if (this->g > g)
            this->g--;
        if (this->b > b)
            this->b--;

        checkRGBVals();
    }

    void moveToRGB_object(rgb moveTo)
    {
        this->moveToRGB(moveTo.r, moveTo.g, moveTo.b);
    }
    uint32_t get_packedRGB()
    {
        if (r < 0 || g < 0 || b < 0)
            return 4294967295;

        return (uint32_t)((uint32_t)r << 16) | ((uint32_t)g << 8) | b;
    }

    uint32_t add_color(rgb color_to_add)
    {

        r += color_to_add.r;
        g += color_to_add.g;
        b += color_to_add.b;
        checkRGBVals();
        return get_packedRGB();
    }
    uint32_t consistentlyDecreaseBy(uint8_t decreaseByVal)
    {
        decreaseByVal = decreaseByVal / 3;

        if (decreaseByVal == 0)
            decreaseByVal = 1;

        if (b > decreaseByVal)
            b -= decreaseByVal;
        else
            r = 0;

        if (r > decreaseByVal)
            r -= decreaseByVal;
        else
            g = 0;

        if (r > decreaseByVal)
            r -= decreaseByVal;
        else
            r = 0;

        return get_packedRGB();
    }

    void checkRGBVals()
    {
        checkRGBVals(this->isDeltaColor);
    }
    // Function that checks if RGB values are within a meaningful (0-255) range, isDelta can be used to check a
    //"RGB" delta value -> can be negative so range = (-255 255)
    void checkRGBVals(bool isDelta)
    {
        this->isDeltaColor = isDelta;
        if (this->r > 255)
            this->r = 255;
        if (this->g > 255)
            this->g = 255;
        if (this->b > 255)
            this->b = 255;

        if (isDeltaColor)
        {
            if (this->r < -255)
                this->r = -255;
            if (this->g < -255)
                this->g = -255;
            if (this->b < -255)
                this->b = -255;
        }
        else
        {
            if (this->r < 0)
                this->r = 0;
            if (this->g < 0)
                this->g = 0;
            if (this->b < 0)
                this->b = 0;
        }
    }
    void setRGB(int16_t red, int16_t green, int16_t blue)
    {
        this->r = red;
        this->g = green;
        this->b = blue;
        checkRGBVals();
    }
};
uint32_t getStepsToZero(uint32_t colorMatrix1[], size_t len)
{
    uint32_t ret = 0;
    for (size_t i = 0; i < len; i++)
    {
        rgb currentColor = rgb(colorMatrix1[i]);
        ret += std::max(std::max(currentColor.r, currentColor.g), currentColor.b);
    }
    return ret;
}