#ifndef INIFILEOPERATE_H
#define INIFILEOPERATE_H

#include <QObject>
#include <QtQml>
#include <QSettings>

class Inifileoperate : public QObject
{
    Q_OBJECT
    QML_ELEMENT

public:
    explicit Inifileoperate(QObject *parent = nullptr);

    const QString &getFileName() const;
    void setFileName(const QString &newFileName);

    Q_INVOKABLE QString getValue(QString group, QString name);
    Q_INVOKABLE void setValue(QString group, QString name, QString value);

    Q_INVOKABLE void func();

private:
    QString fileName;

};

#endif // INIFILEOPERATE_H
