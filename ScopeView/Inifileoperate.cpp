#include "Inifileoperate.h"

Inifileoperate::Inifileoperate(QObject *parent)
    : QObject{parent}
{

}

const QString &Inifileoperate::getFileName() const
{
    return fileName;
}

void Inifileoperate::setFileName(const QString &newFileName)
{
    fileName = newFileName;
}

QString Inifileoperate::getValue(QString group, QString name)
{
    //打开ini文件
    QSettings iniFile(fileName, QSettings::IniFormat);
    //打开ini组
    QString tempStr = group;
    iniFile.beginGroup(tempStr);
    //查找对应Value
    QString str = iniFile.value(name).toString();
    //关闭ini组
    iniFile.endGroup();
    //返回对应值
    return str;
}

void Inifileoperate::setValue(QString group, QString name, QString value)
{
    //打开ini文件
    QSettings iniFile(fileName, QSettings::IniFormat);
    //打开ini组
    QString tempStr = group;
    iniFile.beginGroup(tempStr);
    //设置键值对
    iniFile.setValue(name, value);
    //关闭ini组
    iniFile.endGroup();
}

void Inifileoperate::func()
{
    qDebug()<<"bbj";
}
