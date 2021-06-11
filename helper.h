#ifndef HELPER_H
#define HELPER_H

#include <QObject>
#include <QString>

class Helper : public QObject
{
    Q_OBJECT
public:
    explicit Helper(QObject *parent = nullptr);

signals:

public slots:
    QString color3();
};
#endif // HELPER_H
