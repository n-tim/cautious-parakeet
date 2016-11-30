// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com

#include <QtGui/QGuiApplication>
#include <QtQml/QQmlApplicationEngine>
#include <QtQml/QQmlContext>

#include <appHelper.hpp>

int main(int argc, char** argv)
{
	QGuiApplication app(argc, argv);

	AppHelper appHelper;	

	QQmlApplicationEngine engine;
	engine.rootContext()->setContextProperty("appHelper", &appHelper);
	engine.load(QGuiApplication::applicationDirPath() + "/qml/main.qml");	

	return app.exec();
}