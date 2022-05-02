#include <QFileInfo>
#include <QGuiApplication>
#include <QIcon>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QSettings>

#include "Inifileoperate.h"

//应用程序路径
QString exeDir;
QString iniDir;

void iniConfig()
{
    //config.ini保存路径为 exepath/config.ini
    Inifileoperate* iniInstance = new Inifileoperate;
    iniInstance->setFileName(exeDir.append("/config.ini"));

    iniDir = iniInstance->getFileName();

    qDebug()<<iniInstance->getFileName();

    iniInstance->setValue("func", "teacher","什么");

    QString temp  = iniInstance->getValue("func","teacher");

    qDebug()<<temp;

}



int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    //获取应用程序路径
    exeDir = app.applicationDirPath();

    iniConfig();



    QQmlApplicationEngine engine;

    QQmlContext* context =  engine.rootContext();
    context->setContextProperty("iniDir", iniDir);

    qmlRegisterType<Inifileoperate>("Inifileoperate",1,0,"Inifileoperate");

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    app.setWindowIcon(QIcon("://icons/logo.png"));

    return app.exec();
}

