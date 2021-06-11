#include "helper.h"

Helper::Helper(QObject *parent) : QObject(parent)
{

}

QString Helper::color3()
{
    int n = rand()%4;
    if (n == 0) return QString("blue");
    else if (n == 1) return QString("orange");
    else if (n == 2) return  QString("green");
    else return QString("black");
}

