#pragma once
#include <Arduino.h>
double gaussian(float mean, float std_dev)
{
    double u1 = random(0, 100000) / 100000.0; //uniform(0,1] random doubles
    double u2 = random(0, 100000) / 100000.0;

    double randStdNormal = sqrt(-2.0 * log(u1)) * sin(2.0 * PI * u2); //random normal(0,1)
    double randNormal = mean + std_dev * randStdNormal;               //random normal(mean,stdDev^2)

    return randNormal;
}

double gaussian_ge_zero(float mean, float std_dev)
{
    double ran = gaussian(mean, std_dev);
    if (ran < 0)
        ran *= -1.0;
    if (ran > 255)
        return gaussian(mean, std_dev);
    return ran;
}

double gaussian_ge_zero_capped(float mean, float std_dev,float cap)
{
    double ran = gaussian(mean, std_dev);
    if (ran < 0)
        ran *= -1.0;
    if (ran > cap)
        return gaussian(mean, std_dev);
    return ran;
}


